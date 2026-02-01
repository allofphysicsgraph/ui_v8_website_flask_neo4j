import sys
import re


def pretty_print_cypher(content):
    """
    Formats Cypher query content to be human-readable.
    - Expands dictionaries/maps ({...}) and lists ([...]) onto new lines.
    - Indents based on nesting level.
    - Adds spacing after colons.
    """
    formatted_output = []
    indent_level = 0
    indent_string = "    "  # 4 spaces for indentation

    # State tracking
    in_string = False
    quote_char = None  # To track if we are in '...', "...", or `...`
    i = 0
    n = len(content)

    while i < n:
        char = content[i]

        # --- 1. Handle Strings ---
        # We must ignore syntax characters (:, {, [, etc.) if they appear inside strings.
        if in_string:
            formatted_output.append(char)
            # Check for end of string, ensuring the quote wasn't escaped (e.g., \")
            if char == quote_char and content[i - 1] != "\\":
                in_string = False
                quote_char = None
            i += 1
            continue

        # Detect start of string
        # Cypher uses single quotes, double quotes, and backticks for identifiers
        if char in ['"', "'", "`"]:
            in_string = True
            quote_char = char
            formatted_output.append(char)
            i += 1
            continue

        # --- 2. Handle Structural Characters ---

        # Open Brace/Bracket: Increase indent, Newline
        if char in ["{", "["]:
            indent_level += 1
            formatted_output.append(char)
            formatted_output.append("\n")
            formatted_output.append(indent_string * indent_level)

            # Skip optional whitespace immediately following the opener
            while i + 1 < n and content[i + 1].isspace():
                i += 1

        # Close Brace/Bracket: Decrease indent, Newline
        elif char in ["}", "]"]:
            indent_level = max(0, indent_level - 1)
            formatted_output.append("\n")
            formatted_output.append(indent_string * indent_level)
            formatted_output.append(char)

        # Comma: Newline, maintain current indent
        elif char == ",":
            formatted_output.append(char)
            formatted_output.append("\n")
            formatted_output.append(indent_string * indent_level)

            # Skip optional whitespace immediately following comma
            while i + 1 < n and content[i + 1].isspace():
                i += 1

        # Semicolon: End of statement. Double newline.
        elif char == ";":
            formatted_output.append(char)
            formatted_output.append("\n\n")
            indent_level = 0  # Reset indent for safety

            # Skip optional whitespace immediately following semicolon
            while i + 1 < n and content[i + 1].isspace():
                i += 1

        # Colon: Add space after colon (e.g., key:value -> key: value)
        elif char == ":":
            formatted_output.append(": ")
            # Skip existing whitespace to avoid double spaces
            while i + 1 < n and content[i + 1].isspace():
                i += 1

        # --- 3. Handle General Whitespace ---
        elif char.isspace():
            # Collapse multiple spaces into one, but ignore if we just added a newline
            if formatted_output and formatted_output[-1].strip() == "":
                pass  # We are at the start of a line (indentation), don't add space
            elif formatted_output and formatted_output[-1][-1].isspace():
                pass  # Don't add multiple spaces
            else:
                formatted_output.append(" ")

        # --- 4. Normal Characters ---
        else:
            formatted_output.append(char)

        i += 1

    return "".join(formatted_output).strip()


def main():
    # File handling logic
    if len(sys.argv) < 2:
        print("Usage: python format_cypher.py <input_file.cypher> [output_file.cypher]")
        print("If output_file is not provided, prints to console.")
        return

    input_path = sys.argv[1]

    try:
        with open(input_path, "r", encoding="utf-8") as f:
            content = f.read()
    except FileNotFoundError:
        print(f"Error: File '{input_path}' not found.")
        return

    formatted_content = pretty_print_cypher(content)

    if len(sys.argv) >= 3:
        output_path = sys.argv[2]
        with open(output_path, "w", encoding="utf-8") as f:
            f.write(formatted_content)
        print(f"Successfully formatted '{input_path}' to '{output_path}'")
    else:
        print(formatted_content)


if __name__ == "__main__":
    main()
