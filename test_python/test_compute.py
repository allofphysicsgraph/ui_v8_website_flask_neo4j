#!/usr/bin/env python3

# Physics Derivation Graph
# Ben Payne
# https://creativecommons.org/licenses/by/4.0/
# Attribution 4.0 International (CC BY 4.0)

import logging
import pytest
from unittest.mock import MagicMock, patch


from webserver_for_pdg.library.compute import *

logger = logging.getLogger(__name__)


@pytest.fixture
def mock_driver():
    """Fixture to mock the Neo4j Graph Database Driver and Session."""
    driver = MagicMock()
    session = MagicMock()
    driver.session.return_value.__enter__.return_value = session
    return driver, session


def test_generate_random_id(mock_driver):
    driver, session = mock_driver
    # Return a set of existing IDs that does not conflict with the generated ones
    session.read_transaction.return_value = ["1111111111", "2222222222"]

    query_time_dict = {}
    new_id, updated_dict = generate_random_id(driver, query_time_dict)

    assert len(new_id) == 10
    assert new_id.isdigit()
    assert new_id not in ["1111111111", "2222222222"]
    assert any("generate_random_id" in key for key in updated_dict)


def test_get_placement_options():
    # Empty sequence list
    assert get_placement_options([], "1") == [""]
    # Selected index not in sequence list
    assert get_placement_options(["1", "2"], "3") == [""]

    # Valid placements
    # For sequence ["A", "B", "C"] selecting "B"
    # remaining list becomes ["A", "C"]
    res1 = get_placement_options(["A", "B", "C"], "B")
    assert res1 == ["before 'A'", "after 'C'"]

    # For sequence ["A", "B", "C", "D"] selecting "C"
    # remaining list becomes ["A", "B", "D"]
    res2 = get_placement_options(["A", "B", "C", "D"], "C")
    assert res2 == ["before 'A'", "between 'A' and 'B'", "after 'D'"]


@patch("webserver_for_pdg.library.compute.latex_and_sympy")
@patch("webserver_for_pdg.library.compute.sympy_validate_expression")
def test_guess_sympy_from_expression(
    mock_sympy_validate, mock_latex_sympy, mock_driver
):
    driver, session = mock_driver
    mock_latex_sympy.cleaned_latex_str_to_sympy_expression.side_effect = [
        "lhs_sympy",
        "rhs_sympy",
    ]
    mock_sympy_validate.convert_sympy_expr_to_pdg_symbols.side_effect = [
        "pdg0000001",
        "pdg0000002",
    ]

    expr_dict = {"latex_lhs": "a", "latex_rhs": "b"}
    q_dict = {}

    q, lhs, rhs = guess_sympy_from_expression(driver, q_dict, expr_dict)

    assert lhs == "Symbol('pdg0000001')"
    assert rhs == "Symbol('pdg0000002')"


@patch("webserver_for_pdg.library.compute.neo4j_query")
def test_guess_operations_from_latex(mock_neo4j_query, mock_driver):
    driver, session = mock_driver
    session.read_transaction.return_value = [
        {"latex": "plus", "id": "op1"},
        {"latex": "times", "id": "op2"},
    ]
    expr_dict = {"latex_lhs": "a", "latex_relation": "=", "latex_rhs": "b"}
    q_dict = {}

    q, ops = guess_operations_from_latex(driver, q_dict, expr_dict)

    assert len(ops) == 2
    assert ops[0]["latex"] == "plus"
    assert ops[1]["latex"] == "times"


@patch("webserver_for_pdg.library.compute.latex_and_sympy")
@patch("webserver_for_pdg.library.compute.neo4j_query")
def test_guess_symbols_from_latex(mock_neo4j_query, mock_latex_sympy, mock_driver):
    driver, session = mock_driver
    session.read_transaction.return_value = [
        {"id": "sym1", "latex": "x"},
        {"id": "sym2", "latex": "y"},
    ]
    mock_latex_sympy.cleaned_latex_str_to_sympy_expression.side_effect = [
        "lhs_expr",
        "rhs_expr",
    ]
    mock_latex_sympy.list_of_sympy_symbols_in_sympy_expression.side_effect = [
        ["x"],
        ["y"],
    ]

    expr_dict = {"latex_lhs": "x", "latex_relation": "=", "latex_rhs": "y"}
    q_dict = {}

    q, potential_syms = guess_symbols_from_latex(driver, q_dict, expr_dict)

    assert len(potential_syms) == 2
    assert potential_syms[0]["latex"] == "x"
    assert potential_syms[1]["latex"] == "y"


def test_hash_of_string():
    s = "hello"
    h = hash_of_string(s)
    import hashlib

    expected = hashlib.sha256(s.encode("utf-8")).hexdigest()
    assert h == expected


def test_encode_user_identifier():
    user = "  TestUser@Example.com  "
    h = encode_user_identifier(user)
    import hashlib

    expected = hashlib.sha256(user.strip().lower().encode("utf-8")).hexdigest()
    assert h == expected


def test_url_shortener_flow(tmp_path, monkeypatch):
    # Set up a temporary directory path to mimic the shortened url csv file
    temp_csv = tmp_path / "url_shorten_expand.csv"
    monkeypatch.setattr(
        "webserver_for_pdg.library.compute.shorten_url_file", str(temp_csv)
    )

    # Initialize the temporary CSV file
    temp_csv.write_text(
        "timestamp|email|count|lookup|url\n2026-07-18|some_hash|0|abcde|http://example.com\n"
    )

    # Test generation and checking lookup collisions
    lookup = generate_lookup_for_shorten_url(str(temp_csv))
    assert len(lookup) == 5
    assert lookup != "abcde"

    # Test adding URL
    temp_csv.unlink()  # Delete to let add_url_to_shortened_list create it with a header
    now_str = "2026-07-18 12:00:00"
    email = "user@example.com"
    url = "http://google.com"

    new_lookup = add_url_to_shortened_list(now_str, email, url)
    assert len(new_lookup) == 5

    # Test retrieving URL
    status, retrieved_url = get_url_from_shortened_list(new_lookup)
    assert status == "success"
    assert retrieved_url == url

    # Test fallback retrieve
    err_status, err_url = get_url_from_shortened_list("unknown")
    assert "ERROR" in err_status
    assert err_url is None


@patch("webserver_for_pdg.library.compute.subprocess.run")
def test_send_email_with_msmtp(mock_run):
    # Success scenario
    mock_run.return_value = MagicMock(returncode=0)
    res = send_email_with_msmtp(
        "recipient@example.com", "Test Subject", "Test Body", "sender@example.com"
    )
    assert res is True

    # Verify command execution parameters
    mock_run.assert_called_once()
    args, kwargs = mock_run.call_args
    assert args[0] == ["msmtp", "recipient@example.com"]
    assert b"Subject: Test Subject" in kwargs["input"]
    assert b"From: sender@example.com" in kwargs["input"]
    assert b"To: recipient@example.com" in kwargs["input"]
    assert b"Test Body" in kwargs["input"]

    # Subprocess execution error scenarios (FileNotFoundError fallback)
    mock_run.side_effect = FileNotFoundError()
    res_err = send_email_with_msmtp(
        "recipient@example.com", "Subject", "Body", "sender@example.com"
    )
    assert res_err is False


@patch("webserver_for_pdg.library.compute.neo4j_query")
def test_check_whether_inference_rule_exists(mock_neo4j_query, mock_driver):
    driver, session = mock_driver
    session.read_transaction.return_value = [
        {"name_latex": "Rule A", "latex": "latexA"},
        {"name_latex": "Rule B", "latex": "latexB"},
    ]

    # Existing Name Conflict
    exists, msg, q = check_whether_inference_rule_exists(driver, {}, "Rule A", "latexC")
    assert exists is True
    assert "name already exists" in msg

    # Existing Latex Conflict
    exists, msg, q = check_whether_inference_rule_exists(driver, {}, "Rule C", "latexB")
    assert exists is True
    assert "latex already exists" in msg

    # Unique/New rule
    exists, msg, q = check_whether_inference_rule_exists(driver, {}, "Rule C", "latexC")
    assert exists is False


@patch("webserver_for_pdg.library.compute.latex_and_sympy")
def test_get_sympy_as_latex_per_feed_id(mock_latex_sympy):
    mock_latex_sympy.sympy_to_latex_str.side_effect = [
        "latex_val",
        Exception("conversion_error"),
    ]

    feeds = [
        {"id": "f1", "sympy": "x + y"},
        {"id": "f2", "sympy": "bad_expr"},
        {"id": "f3"},  # Missing 'sympy' key
        {"id": "f4", "sympy": ""},  # Empty 'sympy' key
    ]

    res = get_sympy_as_latex_per_feed_id(feeds)
    assert res["f1"] == "latex_val"
    assert res["f2"] == "error converting"
    assert res["f3"] == "no 'sympy' key"
    assert res["f4"] == "'sympy' key is empty"


@patch("webserver_for_pdg.library.compute.latex_and_sympy")
def test_get_sympy_as_latex_per_expr_id(mock_latex_sympy):
    mock_latex_sympy.sympy_to_latex_str.side_effect = [
        "lhs_latex",
        "rhs_latex",
        AttributeError("mock_attr_error"),
    ]

    expressions = [
        {"id": "e1", "sympy_lhs": "lhs1", "sympy_rhs": "rhs1"},
        {"id": "e2", "sympy_lhs": "lhs2"},
    ]

    res = get_sympy_as_latex_per_expr_id(expressions)
    assert res[0]["latex_as_sympy_LHS"] == "lhs_latex"
    assert res[0]["latex_as_sympy_RHS"] == "rhs_latex"
    assert "AttributeError" in res[1]["latex_as_sympy_LHS"]


@patch("webserver_for_pdg.library.compute.sympy_validate_expression")
@patch("webserver_for_pdg.library.compute.neo4j_query")
def test_get_dimensional_consistency_for_every_expression(
    mock_neo4j_query, mock_sympy_validate, mock_driver
):
    driver, session = mock_driver
    session.read_transaction.side_effect = [
        [{"id": "expr1"}, {"id": "expr2"}],  # expression dict list
        ["sym1", "sym2"],  # symbols for expr1
        ["sym3"],  # symbols for expr2
    ]

    mock_sympy_validate.dimensional_consistency.side_effect = [True, False]

    res, q = get_dimensional_consistency_for_every_expression(driver, {})
    assert res["expr1"] is True
    assert res["expr2"] is False


@patch("webserver_for_pdg.library.compute.neo4j_query")
@patch("webserver_for_pdg.library.compute.list_of_valid")
def test_get_dict_of_node_type_for_every_id(
    mock_list_of_valid, mock_neo4j_query, mock_driver
):
    driver, session = mock_driver
    mock_list_of_valid.node_types = ["expression", "symbol", "operation"]

    session.read_transaction.return_value = [
        {"labels(n)": ["expression", "a_node"], "n.id": "id1"},
        {"labels(n)": ["symbol"], "n.id": "id2"},
        {"labels(n)": ["unknown_label"], "n.id": "id3"},
    ]

    res, q = get_dict_of_node_type_for_every_id(driver, {})
    assert res["id1"] == "expression"
    assert res["id2"] == "symbol"
    assert res["id3"] == "unknown_label"


def test_remove_file_debris(tmp_path):
    temp_dir = tmp_path / "debris"
    temp_dir.mkdir()

    file1 = temp_dir / "temp_file.txt"
    file1.write_text("temporary content")

    file2 = temp_dir / "keep_file.log"
    file2.write_text("keep this file")

    remove_file_debris([str(temp_dir) + "/"], ["temp_file"], ["txt"])

    assert not file1.exists()
    assert file2.exists()


@patch("webserver_for_pdg.library.compute.neo4j_query")
def test_get_symbols_not_in_expression(mock_neo4j_query, mock_driver):
    driver, session = mock_driver
    session.read_transaction.return_value = [
        {"id": "sym1", "latex": "x"},
        {"id": "sym2", "latex": "y"},
        {"id": "sym3", "latex": "z"},
    ]

    expression_dict = {"latex_lhs": "x + y", "latex_rhs": "z"}
    symbols_in_expression = [{"id": "sym1", "latex": "x"}]

    res, q = get_symbols_not_in_expression(
        expression_dict, symbols_in_expression, driver, {}
    )
    assert len(res) == 2
    assert {s["id"] for s in res} == {"sym2", "sym3"}


@patch("webserver_for_pdg.library.compute.neo4j_query")
def test_get_operations_not_in_expression(mock_neo4j_query, mock_driver):
    driver, session = mock_driver
    session.read_transaction.return_value = [
        {"id": "op1", "latex": "+"},
        {"id": "op2", "latex": "*"},
        {"id": "op3", "latex": "/"},
    ]

    expression_dict = {"latex_lhs": "x + y", "latex_rhs": "*"}
    operations_in_expression = [{"id": "op1", "latex": "+"}]

    res, q = get_operations_not_in_expression(
        expression_dict, operations_in_expression, driver, {}
    )
    assert len(res) == 1
    assert res[0]["id"] == "op2"


@patch("webserver_for_pdg.library.compute.neo4j_query")
def test_get_relations_not_in_expression(mock_neo4j_query, mock_driver):
    driver, session = mock_driver
    session.read_transaction.return_value = [
        {"latex": "="},
        {"latex": "<"},
        {"latex": ">"},
    ]

    expression_dict = {"latex_lhs": "x", "latex_rhs": "y"}
    res, q = get_relations_not_in_expression(expression_dict, "=", driver, {})

    assert len(res) == 2
    assert {r["latex"] for r in res} == {"<", ">"}


@patch("webserver_for_pdg.library.compute.neo4j_query")
@patch("webserver_for_pdg.library.compute.list_of_valid")
def test_get_dict_of_node_dicts(mock_list_of_valid, mock_neo4j_query, mock_driver):
    driver, session = mock_driver
    mock_list_of_valid.node_types = ["expression"]

    session.read_transaction.return_value = [
        {"id": "n1", "name": "node1"},
        {"id": "n2", "name": "node2"},
    ]

    res, q = get_dict_of_node_dicts(driver, {}, "expression")
    assert res["n1"]["name"] == "node1"
    assert res["n1"]["node_type"] == "expression"
    assert res["n2"]["name"] == "node2"
    assert res["n2"]["node_type"] == "expression"


@patch("webserver_for_pdg.library.compute.neo4j_query")
def test_get_dict_of_derivations_used_per_inference_rule(mock_neo4j_query, mock_driver):
    driver, session = mock_driver

    session.read_transaction.side_effect = [
        [
            {"id": "deriv1", "name": "Derivation 1"},
            {"id": "deriv2", "name": "Derivation 2"},
        ],  # for rule1
        [{"id": "deriv1", "name": "Derivation 1"}],  # for rule2
    ]

    rules = [{"id": "rule1"}, {"id": "rule2"}]

    res, q = get_dict_of_derivations_used_per_inference_rule(driver, {}, rules)
    assert len(res["rule1"]) == 2
    assert len(res["rule2"]) == 1


@patch("webserver_for_pdg.library.compute.neo4j_query")
def test_get_dict_of_steps_in_derivation(mock_neo4j_query, mock_driver):
    driver, session = mock_driver
    steps = [{"id": "step1"}, {"id": "step2"}]

    session.read_transaction.side_effect = [
        steps,  # retrieve step list
        # Step 1 values
        {"id": "inf_rule1"},  # rule
        ["input1"],  # HAS_INPUT
        ["feed1"],  # HAS_FEED
        ["output1"],  # HAS_OUTPUT
        2,  # sequence index for step1
        # Step 2 values
        {"id": "inf_rule2"},  # rule
        ["input2"],  # HAS_INPUT
        ["feed2"],  # HAS_FEED
        ["output2"],  # HAS_OUTPUT
        1,  # sequence index for step2
    ]

    res, q = get_dict_of_steps_in_derivation(driver, "deriv_id", {})

    # Sorting order check (index 1 must appear before index 2)
    keys = list(res.keys())
    assert keys == ["step2", "step1"]
    assert res["step2"]["sequence index"] == 1
    assert res["step1"]["sequence index"] == 2


def test_remove_latex_presention_markings():
    raw_latex = "\\left. \\right. \\left|x\\right| \\left(y\\right) \\, \\ \\; \\: \\! \\quad \\qquad"
    cleaned = remove_latex_presention_markings(raw_latex)
    assert "\\left." not in cleaned
    assert "\\right." not in cleaned
    assert "|" in cleaned
    assert "(" in cleaned
    assert ")" in cleaned
    assert "\\," not in cleaned
    assert "\\quad" not in cleaned
