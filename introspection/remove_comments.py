import argparse
import ast
import sys


def is_string_node(node):
    """
    Checks if an AST node is a string literal.
    """
    if isinstance(node, ast.Expr):
        val = node.value
        # For Python 3.8+, string literals are represented as ast.Constant
        if isinstance(val, ast.Constant) and isinstance(val.value, str):
            return True
        # For compatibility with older Python versions
        if hasattr(ast, "Str") and isinstance(val, ast.Str):
            return True
    return False


class DocstringRemover(ast.NodeTransformer):
    """
    An AST NodeTransformer that removes the first string literal (docstring)
    from modules, classes, and functions.
    """

    def _remove_docstring(self, node, needs_pass=True):
        if node.body and is_string_node(node.body[0]):
            node.body.pop(0)
            # If the body is empty after removing the docstring,
            # append 'pass' to preserve valid syntax.
            if not node.body and needs_pass:
                node.body.append(ast.Pass())
        return node

    def visit_Module(self, node):
        self.generic_visit(node)
        return self._remove_docstring(node, needs_pass=False)

    def visit_ClassDef(self, node):
        self.generic_visit(node)
        return self._remove_docstring(node, needs_pass=True)

    def visit_FunctionDef(self, node):
        self.generic_visit(node)
        return self._remove_docstring(node, needs_pass=True)

    def visit_AsyncFunctionDef(self, node):
        self.generic_visit(node)
        return self._remove_docstring(node, needs_pass=True)


def remove_comments_and_docstrings(source_code: str) -> str:
    """
    Parses source code into an AST, removes docstrings,
    and returns the unparsed code (which naturally strips comments).
    """
    tree = ast.parse(source_code)
    transformer = DocstringRemover()
    transformed_tree = transformer.visit(tree)
    return ast.unparse(transformed_tree)


if __name__ == "__main__":
    theparser = argparse.ArgumentParser(
        description="remove comments", allow_abbrev=False
    )

    theparser.add_argument(
        "script_filename",
        type=str,
        help="Python filename; full path with file extension",
    )

    args = theparser.parse_args()

    # Read the target file
    try:
        with open(args.script_filename, "r", encoding="utf-8") as f:
            source = f.read()
    except FileNotFoundError:
        print(f"Error: File '{args.script_filename}' not found.", file=sys.stderr)
        sys.exit(1)
    except Exception as e:
        print(f"Error reading file: {e}", file=sys.stderr)
        sys.exit(1)

    # Process and print the result
    try:
        cleaned_code = remove_comments_and_docstrings(source)
        print(cleaned_code)
    except SyntaxError as e:
        print(f"Syntax Error in input file: {e}", file=sys.stderr)
        sys.exit(1)
    except Exception as e:
        print(f"Error processing file: {e}", file=sys.stderr)
        sys.exit(1)