import ast
import argparse
import sys


def extract_routes(file_path: str):
    """
    Parses the given Python file and uses AST to find all routes and
    determine if they require login.
    """
    try:
        with open(file_path, "r", encoding="utf-8") as f:
            source = f.read()
    except FileNotFoundError:
        print(f"Error: The file '{file_path}' does not exist.", file=sys.stderr)
        sys.exit(1)
    except Exception as e:
        print(f"Error reading file: {e}", file=sys.stderr)
        sys.exit(1)

    try:
        tree = ast.parse(source)
    except SyntaxError as e:
        print(f"Syntax error while parsing the file: {e}", file=sys.stderr)
        sys.exit(1)

    login_required_routes = []
    public_routes = []

    # Iterate through all nodes in the AST to find function definitions
    for node in ast.walk(tree):
        if isinstance(node, (ast.FunctionDef, ast.AsyncFunctionDef)):
            is_login_required = False
            routes_on_func = []

            for decorator in node.decorator_list:
                # 1. Identify `@login_required`
                # Can be a simple Name (e.g., @login_required)
                if isinstance(decorator, ast.Name) and decorator.id == "login_required":
                    is_login_required = True
                # Can be an Attribute (e.g., @auth.login_required)
                elif isinstance(decorator, ast.Attribute) and decorator.attr == "login_required":
                    is_login_required = True
                # Can be a Call (e.g., @login_required())
                elif isinstance(decorator, ast.Call):
                    func = decorator.func
                    if isinstance(func, ast.Name) and func.id == "login_required":
                        is_login_required = True
                    elif isinstance(func, ast.Attribute) and func.attr == "login_required":
                        is_login_required = True

                # 2. Identify `@app.route(...)` or `@web_app.route(...)`
                if isinstance(decorator, ast.Call):
                    func = decorator.func
                    is_route_decorator = False
                    
                    if isinstance(func, ast.Attribute) and func.attr == "route":
                        is_route_decorator = True
                    elif isinstance(func, ast.Name) and func.id == "route":
                        is_route_decorator = True

                    if is_route_decorator and decorator.args:
                        # Extract the first argument, which is the route path string
                        first_arg = decorator.args[0]
                        route_path = None
                        
                        if isinstance(first_arg, ast.Constant):  # Python 3.8+
                            route_path = first_arg.value
                        elif isinstance(first_arg, ast.Str):  # Fallback for older versions
                            route_path = first_arg.s

                        if route_path is not None:
                            routes_on_func.append(route_path)

            # Assign extracted routes to the appropriate list
            if routes_on_func:
                if is_login_required:
                    login_required_routes.extend(routes_on_func)
                else:
                    public_routes.extend(routes_on_func)

    return login_required_routes, public_routes


if __name__ == "__main__":
    theparser = argparse.ArgumentParser(
        description="assess file content", allow_abbrev=False
    )

    theparser.add_argument(
        "script_filename",
        type=str,
        help="Python filename; full path with file extension",
    )

    theparser.add_argument(
        "--routes-that-require-login",
        action="store_true",
        help="Print only the routes that require login",
    )

    theparser.add_argument(
        "--routes-that-do-not-require-login",
        action="store_true",
        help="Print only the routes that do not require login",
    )

    args = theparser.parse_args()

    # Get routes from the script
    login_req, public = extract_routes(args.script_filename)

    # Determine what to print based on command-line flags
    show_login_required = args.routes_that_require_login
    show_public = args.routes_that_do_not_require_login

    # If neither flag is selected, default to showing both
    if not show_login_required and not show_public:
        show_login_required = True
        show_public = True

    if show_login_required:
        print("Routes that require login:")
        if login_req:
            for route in login_req:
                print(f"{route}")
        else:
            print("  None found.")
        print()

    if show_public:
        print("Routes that do not require login:")
        if public:
            for route in public:
                print(f"{route}")
        else:
            print("  None found.")
        print()
