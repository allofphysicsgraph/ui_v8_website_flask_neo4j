import sys
import re
import argparse

def split_cypher_objects(content):
    """
    Splits a Cypher list string (e.g., "{id:1}, {id:2}") into individual items.
    It respects nested braces and quoted strings to avoid splitting incorrectly.
    """
    items = []
    current_item = []
    brace_depth = 0
    in_quote = False
    quote_char = None
    
    # Iterate character by character
    i = 0
    while i < len(content):
        char = content[i]
        
        # Handle Quotes
        if in_quote:
            current_item.append(char)
            # Check for closing quote, ignoring escaped quotes (e.g. \")
            if char == quote_char and (len(current_item) < 2 or current_item[-2] != '\\'):
                in_quote = False
                quote_char = None
        else:
            # Check for opening quote
            if char == '"' or char == "'":
                in_quote = True
                quote_char = char
                current_item.append(char)
            
            # Handle Braces
            elif char == '{':
                brace_depth += 1
                current_item.append(char)
            elif char == '}':
                brace_depth -= 1
                current_item.append(char)
            
            # Handle Split (Comma at depth 0)
            elif char == ',' and brace_depth == 0:
                items.append("".join(current_item).strip())
                current_item = []
            else:
                current_item.append(char)
        
        i += 1
        
    # Append the last item
    if current_item:
        items.append("".join(current_item).strip())
        
    return items

def format_cypher_line(line):
    """
    Analyzes a line. If it's a long UNWIND list, formats it.
    Otherwise returns the line as-is.
    """
    stripped = line.strip()
    
    # Regex to capture: UNWIND [ ... ] AS row
    # Group 1: Prefix (UNWIND)
    # Group 2: Content inside [ ]
    # Group 3: Suffix (AS row...)
    match = re.match(r'(UNWIND\s*)\[(.*)\](\s*AS\s+.*)', stripped)
    
    if match:
        prefix = match.group(1)
        inner_content = match.group(2)
        suffix = match.group(3)
        
        # Split the inner content into individual objects
        objects = split_cypher_objects(inner_content)
        
        # Reconstruct with indentation
        # Indent 2 spaces for the brackets, 4 spaces for the items
        formatted_list = ",\n  ".join(objects)
        
        return f"{prefix}[\n  {formatted_list}\n]{suffix}"
    
    return line

def process_file(input_file, output_file=None):
    lines = input_file.readlines()
    output = []
    
    for line in lines:
        if not line.strip(): 
            continue # Skip empty lines
        output.append(format_cypher_line(line))
        
    result = "\n".join(output)
    
    if output_file:
        with open(output_file, 'w', encoding='utf-8') as f:
            f.write(result)
    else:
        print(result)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Pretty print Cypher files with long UNWIND lists.")
    parser.add_argument('input_file', nargs='?', type=argparse.FileType('r'), default=sys.stdin, help="Path to input file (or stdin)")
    
    args = parser.parse_args()
    
    try:
        process_file(args.input_file)
    except BrokenPipeError:
        # Python flushes standard streams on exit; redirecting stdout to head can trigger this
        sys.stderr.close()

