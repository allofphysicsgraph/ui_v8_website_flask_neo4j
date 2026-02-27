#!/usr/bin/env python3

# Ben Payne
# Physics Derivation Graph
# https://allofphysics.com
# Creative Commons Attribution 4.0 International License
# https://creativecommons.org/licenses/by/4.0/

import re
import json
import os
from playwright.sync_api import Page, expect


# this is what is exposed inside the Docker container
URL="http://localhost:5000"

def test_has_title(page: Page):
    page.goto(URL)

    # Expect a title to contain a substring.
    expect(page).to_have_title(re.compile("Welcome")) 
    # using a str would necessitate an exact match, whereas using `re` enables partial matches.
    # `.to_have_title` shows up in the HTML's <title> tag -- the browser tab

def test_get_started_link(page: Page):
    page.goto(URL)

    # Click the get started link.
    page.get_by_test_id("impatient-nav-link").click()

    # the following doesn't work because there are multiple `<a href="">navigation</a>`
    #page.get_by_role("link", name="navigation").click()

    # Expects page to have a heading with the name of `Navigating`.
    expect(page.get_by_role("heading", name="Navigating")).to_be_visible()


def test_get_nav_page(page: Page):
    page.goto(URL+"/navigation")

    expect(page).to_have_title(re.compile("site map"))

def test_link_nav_page_to_derivations(page: Page):
    page.goto(URL+"/navigation")

    page.get_by_role("link", name="derivations").click()

    expect(page).to_have_title(re.compile("Derivation"))



def test_get_login_page(page: Page):
    page.goto(URL+"/login")

def test_get_index_page(page: Page):
    page.goto(URL+"/index")

def test_get_choose_new_symbol_page(page: Page):
    page.goto(URL+"/new_symbol")


def test_get_query_page(page: Page):
    page.goto(URL+"/query")

    expect(page).to_have_title(re.compile("Query"))

def test_get_list_feeds_page(page: Page):
    page.goto(URL+"/list_feeds")

def test_get_list_operations_page(page: Page):
    page.goto(URL+"/list_operations")

def test_get_list_relations_page(page: Page):
    page.goto(URL+"/list_relations")

def test_get_list_scalars_page(page: Page):
    page.goto(URL+"/list_scalars")

def test_get_list_vectors_page(page: Page):
    page.goto(URL+"/list_vectors")

def test_get_list_matrices_page(page: Page):
    page.goto(URL+"/list_matrices")

def test_get_list_expressions_page(page: Page):
    page.goto(URL+"/list_expressions")

    expect(page).to_have_title(re.compile("Expression"))

def test_get_list_derivations_page(page: Page):
    page.goto(URL+"/list_derivations")

    expect(page).to_have_title(re.compile("Derivation list"))

def test_link_list_derivations_to_curl_curl(page: Page):
    page.goto(URL+"/list_derivations")

    page.get_by_role("link", name="curl curl identity").click()

    expect(page.get_by_role("heading", name="Review curl curl identity")).to_be_visible()

def test_get_list_inference_rules_page(page: Page):
    page.goto(URL+"/list_inference_rules")

    expect(page).to_have_title(re.compile("Inference"))
    

def test_get_export_json_page(page: Page):
    # page.goto(URL+"/export_to_json")

    page.goto(f"{URL}/navigation")

    with page.expect_download() as download_info:
        # It is better practice to click the actual link to test the UI,
        # but you can also use page.goto(f"{URL}/export_to_cypher")
        page.get_by_role("link", name="export as JSON").click()

        # another option is
        #page.get_by_text("export", exact=True).click()

    download = download_info.value

    # Define the path where you want to save the file. Use the suggested filename for uniqueness
    save_path = os.path.join(os.getcwd(), download.suggested_filename)
    download.save_as(save_path)

    print(f"Downloaded file saved to: {save_path}")
    assert os.path.exists(save_path)
    assert download.suggested_filename == "pdg.jsonl" # Verify the filename matches

    # Clean up (Optional but recommended so future tests don't get false positives)
    if os.path.exists(save_path):
        os.remove(save_path)

def test_get_export_metadata_page(page: Page):
    """
    Unlike other exports that produce a file, this route puts the JSON inline and the browser renders the JSON
    """
    # page.goto(URL+"/export_metadata_schema")

    page.goto(f"{URL}/navigation")

    # clicking the link navigates the current page to the JSON view:
    page.get_by_role("link", name="Export Metadata").click()
    
    # Wait for the URL to change or the content to be visible
    # page.wait_for_url("**/export_metadata_schema")
    print(f"Current URL: {page.url}")

    page.wait_for_url(re.compile(r"export_metadata_schema"))


    # Browsers often wrap raw JSON in a <pre> tag
    content = page.locator("pre").inner_text()
    
    # Parse and verify
    data = json.loads(content)
    assert "labelCount" in data.keys()


def test_get_export_csv_page(page: Page):
    # page.goto(URL+"/export_to_csv")

    page.goto(f"{URL}/navigation")

    with page.expect_download() as download_info:
        # It is better practice to click the actual link to test the UI,
        # but you can also use page.goto(f"{URL}/export_to_cypher")
        page.get_by_role("link", name="export as CSV").click()

        # another option is
        #page.get_by_text("export", exact=True).click()

    download = download_info.value

    # Define the path where you want to save the file. Use the suggested filename for uniqueness
    save_path = os.path.join(os.getcwd(), download.suggested_filename)
    download.save_as(save_path)

    print(f"Downloaded file saved to: {save_path}")
    assert os.path.exists(save_path)
    assert download.suggested_filename == "pdg.csv" # Verify the filename matches

    # Clean up (Optional but recommended so future tests don't get false positives)
    if os.path.exists(save_path):
        os.remove(save_path)


def test_get_export_graphml_page(page: Page):
    # page.goto(URL+"/export_to_graphml")

    page.goto(f"{URL}/navigation")

    with page.expect_download() as download_info:
        # It is better practice to click the actual link to test the UI,
        # but you can also use page.goto(f"{URL}/export_to_cypher")
        page.get_by_role("link", name="export as GraphML").click()

        # another option is
        #page.get_by_text("export", exact=True).click()

    download = download_info.value

    # Define the path where you want to save the file. Use the suggested filename for uniqueness
    save_path = os.path.join(os.getcwd(), download.suggested_filename)
    download.save_as(save_path)

    print(f"Downloaded file saved to: {save_path}")
    assert os.path.exists(save_path)
    assert download.suggested_filename == "pdg.graphml" # Verify the filename matches

    # Clean up (Optional but recommended so future tests don't get false positives)
    if os.path.exists(save_path):
        os.remove(save_path)


def test_get_export_cypher_page(page: Page):
    # page.goto(URL+"/export_to_cypher")

    page.goto(f"{URL}/navigation")

    with page.expect_download() as download_info:
        # It is better practice to click the actual link to test the UI,
        # but you can also use page.goto(f"{URL}/export_to_cypher")
        page.get_by_role("link", name="export as Cypher").click()

        # another option is
        #page.get_by_text("export", exact=True).click()

    download = download_info.value

    # Define the path where you want to save the file. Use the suggested filename for uniqueness
    save_path = os.path.join(os.getcwd(), download.suggested_filename)
    download.save_as(save_path)

    print(f"Downloaded file saved to: {save_path}")
    assert os.path.exists(save_path)
    assert download.suggested_filename == "pdg.cypher" # Verify the filename matches

    # Clean up (Optional but recommended so future tests don't get false positives)
    if os.path.exists(save_path):
        os.remove(save_path)


def test_get_api_js_page(page: Page):
    page.goto(URL+"/api_via_js")

def test_get_api_page(page: Page):
    page.goto(URL+"/documentation/api")

    expect(page).to_have_title(re.compile("API Documentation"))

    expect(page.get_by_role("heading", name="API Documentation")).to_be_visible()
    

def test_get_workflow_page(page: Page):
    page.goto(URL+"/workflow_documentation")

    expect(page).to_have_title(re.compile("Workflow"))

    #expect(page.get_by_role("heading", name="Workflow")).to_be_visible()
    expect(page.get_by_role("heading", name=re.compile("Workflow Interface Documentation"))).to_be_visible()

    

def test_get_profile_page(page: Page):
    page.goto(URL+"/profile")

def test_get_search_page(page: Page):
    page.goto(URL+"/search")

def test_get_favicon_page(page: Page):
    page.goto(URL+"/favicon.ico")

def test_get_robots_page(page: Page):
    page.goto(URL+"/robots.txt")

def test_get_sitemap_page(page: Page):
    page.goto(URL+"/sitemap.txt")

def test_get_static_dir_page(page: Page):
    page.goto(URL+"/static_dir/")

    expect(page.get_by_role("heading", name="File listing of static")).to_be_visible()

def test_get_eval_LLM_page(page: Page):
    page.goto(URL+"/documentation/evaluation_of_LLM_prompts")

    expect(page.get_by_role("heading", name="Evaluation of LLM prompts")).to_be_visible()

def test_get_overview_page(page: Page):
    page.goto(URL+"/documentation/overview")

    expect(page.get_by_role("heading", name="Documentation")).to_be_visible()

def test_get_user_page(page: Page):
    page.goto(URL+"/documentation/user")

    expect(page).to_have_title(re.compile("User Documentation"))
    

def test_get_developer_page(page: Page):
    page.goto(URL+"/documentation/developer")

    expect(page).to_have_title(re.compile("Developer Documentation"))
    

def test_get_conventions_page(page: Page):
    page.goto(URL+"/documentation/conventions")

    expect(page.get_by_role("heading", name="Conventions and Definitions")).to_be_visible()
    

def test_get_design_choices_page(page: Page):
    page.goto(URL+"/documentation/design_choices")

    #expect(page.get_by_role("heading", name="Design")).to_be_visible()
    expect(page.get_by_role("heading", name=re.compile("Design Principles Documentation"))).to_be_visible()
    

def test_get_dimensionality_page(page: Page):
    page.goto(URL+"/documentation/dimensionality")

    expect(page.get_by_role("heading", name="Dimensionality")).to_be_visible()
    

def test_get_roadmap_page(page: Page):
    page.goto(URL+"/documentation/goals_roadmap")

    expect(page.get_by_role("heading", name="Goals and Roadmap")).to_be_visible()
    

def test_get_hilbert_sixth_page(page: Page):
    page.goto(URL+"/documentation/hilberts_sixth_problem")

    expect(page.get_by_role("heading", name="Hilbert")).to_be_visible()
    

def test_get_faq_page(page: Page):
    page.goto(URL+"/documentation/faq")

    expect(page.get_by_role("heading", name="Frequently Asked Questions")).to_be_visible()
    

def test_get_other_projects_page(page: Page):
    page.goto(URL+"/documentation/other_projects")

    expect(page.get_by_role("heading", name="Other Projects")).to_be_visible()


def test_get_expand_page(page: Page):
    page.goto(URL+"/expand")

def test_get_arxiv_page(page: Page):
    page.goto(URL+"/arxiv_scraper")

def test_get_common_errors_page(page: Page):
    page.goto(URL+"/documentation/common_errors_in_college_math")

def test_get_lit_review_page(page: Page):
    page.goto(URL+"/documentation/literature_review")


    expect(page.get_by_role("heading", name="Literature Review")).to_be_visible()
    

def test_get_compare_cas_page(page: Page):
    page.goto(URL+"/documentation/comparison_of_design_options/cas")

def test_get_compare_graph_page(page: Page):
    page.goto(URL+"/documentation/comparison_of_design_options/graph_drawing")

    expect(page.get_by_role("heading", name="Comparison of Graph Drawing")).to_be_visible()
    

def test_get_compare_proofs_page(page: Page):
    page.goto(URL+"/documentation/comparison_of_design_options/proofs")

def test_get_compare_syntax_page(page: Page):
    page.goto(URL+"/documentation/comparison_of_design_options/syntax")

    expect(page.get_by_role("heading", name="Comparison of Syntax")).to_be_visible()
    

def test_get_compare_db_page(page: Page):
    page.goto(URL+"/documentation/comparison_of_design_options/database")

    expect(page.get_by_role("heading", name="Comparison of Database")).to_be_visible()

def test_get_list_named_expressions_page(page: Page):
    page.goto(URL+"/list_named_expressions")

def test_get_survey_named_expressions_page(page: Page):
    page.goto(URL+"/survey_of_named_expressions")

def test_get_blog_page(page: Page):
    page.goto(URL+"/blog/")

def test_get_clickable_layers_page(page: Page):
    page.goto(URL+"/clickable_layers")

def test_get_class_notes_page(page: Page):
    page.goto(URL+"/class_notes")

def test_get_spectrum_precision_overview_page(page: Page):
    page.goto(URL+"/spectrum_of_precision/overview")

