#!/usr/bin/env python3
import json
import re
import sys
import argparse
from datetime import datetime
from urllib.parse import urlparse, parse_qs
from collections import defaultdict

def parse_statline(statline):
    """Parses HTTP method and path from a statline string."""
    if not statline:
        return None, None
    parts = statline.split()
    if len(parts) >= 2:
        method = parts[0]
        full_path = parts[1]
        return method, full_path
    return None, None

def normalize_path(path_str):
    """
    Normalizes the request path to group similar endpoints (e.g., matching IDs to ':id')
    and cleans up home pages and trailing slashes.
    """
    parsed = urlparse(path_str)
    path = parsed.path
    
    if path == "/" or not path:
        return "Home"
    
    # Normalize numeric IDs (e.g., /edit_expression/9847143017 -> /edit_expression/:id)
    path = re.sub(r'/\d+', '/:id', path)
    
    # Strip trailing slash
    if path != "Home" and path.endswith('/') and len(path) > 1:
        path = path.rstrip('/')
        
    return path

def extract_query_referrer(path_str):
    """Extracts 'referrer' parameters embedded inside the request query parameters."""
    parsed = urlparse(path_str)
    queries = parse_qs(parsed.query)
    if 'referrer' in queries:
        return queries['referrer'][0]
    return None

def clean_referrer_name(ref_val):
    """Maps typical referrer fields (domain-level, relative, footer tags) to clean names."""
    if not ref_val or ref_val == "-":
        return None
    
    # If the referrer is a full URL, strip it to the path
    if ref_val.startswith("http://") or ref_val.startswith("https://"):
        parsed = urlparse(ref_val)
        if parsed.path == "" or parsed.path == "/":
            return "Home"
        return normalize_path(parsed.path)
        
    # Standard query mapping
    if ref_val == "index":
        return "Home"
    if "footer" in ref_val:
        return "Footer"
        
    return ref_val

def parse_date(date_str):
    """Parses the Nginx/Common Log Format timestamp."""
    # Strip brackets e.g. [11/Jul/2026:22:56:31 +0000]
    clean_date = date_str.strip('[]')
    return datetime.strptime(clean_date, "%d/%b/%Y:%H:%M:%S %z")

def process_logs(input_stream, session_threshold_secs):
    # Group logs by user context: (IP, User Agent)
    user_groups = defaultdict(list)
    
    for line_num, line in enumerate(input_stream, 1):
        line = line.strip()
        if not line:
            continue
        try:
            log_data = json.loads(line)
        except json.JSONDecodeError:
            sys.stderr.write(f"Warning: Line {line_num} is not valid JSON. Skipping.\n")
            continue
            
        ip = log_data.get("ip", "-")
        ua = log_data.get("ua", "-")
        date_str = log_data.get("date")
        statline = log_data.get("statline")
        ref_field = log_data.get("ref", "-")
        
        if not date_str or not statline:
            continue
            
        try:
            timestamp = parse_date(date_str)
        except ValueError:
            sys.stderr.write(f"Warning: Line {line_num} has an invalid date format: '{date_str}'. Skipping.\n")
            continue
            
        _, full_path = parse_statline(statline)
        if not full_path:
            continue
            
        # Group together
        user_key = (ip, ua)
        user_groups[user_key].append((timestamp, full_path, ref_field))

    # Segment groups into sessions based on the time threshold
    sessions = []
    for user_key, logs in user_groups.items():
        # Sort logs chronologically for the user
        logs.sort(key=lambda x: x[0])
        
        current_session = []
        for log in logs:
            if not current_session:
                current_session.append(log)
            else:
                last_time = current_session[-1][0]
                time_diff = (log[0] - last_time).total_seconds()
                if time_diff > session_threshold_secs:
                    sessions.append(current_session)
                    current_session = [log]
                else:
                    current_session.append(log)
        if current_session:
            sessions.append(current_session)
            
    return sessions

def build_clickstream(sessions):
    edge_counts = defaultdict(int)
    node_counts = defaultdict(int)
    
    for session in sessions:
        steps = []
        for timestamp, full_path, ref_field in session:
            norm_path = normalize_path(full_path)
            
            # Identify referrer priority: 1. query param, 2. JSON ref field
            query_ref = extract_query_referrer(full_path)
            ref_val = query_ref if query_ref else ref_field
            cleaned_ref = clean_referrer_name(ref_val)
            
            steps.append((norm_path, cleaned_ref))
            
        if not steps:
            continue
            
        # Collapse sequential identical paths to simplify loops (e.g., page reloads)
        collapsed_steps = []
        for path, ref in steps:
            if not collapsed_steps or collapsed_steps[-1][0] != path:
                collapsed_steps.append((path, ref))
                
        # Register the starting point
        first_path, first_ref = collapsed_steps[0]
        node_counts[first_path] += 1
        
        # If there's an external entry point that isn't the page itself, start there
        if first_ref and first_ref != first_path:
            edge_counts[(first_ref, first_path)] += 1
            node_counts[first_ref] += 1
        else:
            edge_counts[("[Start]", first_path)] += 1
            node_counts["[Start]"] += 1
            
        # Record transitions between pages
        for i in range(len(collapsed_steps) - 1):
            curr_path = collapsed_steps[i][0]
            next_path = collapsed_steps[i+1][0]
            edge_counts[(curr_path, next_path)] += 1
            node_counts[next_path] += 1
            
        # Record drop-offs / exits
        last_path = collapsed_steps[-1][0]
        edge_counts[(last_path, "[Exit]")] += 1
        node_counts["[Exit]"] += 1
        
    return edge_counts, node_counts

def generate_dot(edge_counts, node_counts):
    """Generates the DOT representation of the directed clickstream graph."""
    lines = [
        "digraph UserJourney {",
        "    // Layout & Styling",
        "    rankdir=LR;",
        "    fontname=\"Helvetica,Arial,sans-serif\";",
        "    node [fontname=\"Helvetica,Arial,sans-serif\", fontsize=10, shape=box, style=\"filled,rounded\", fillcolor=\"#F3F4F6\", color=\"#D1D5DB\"];",
        "    edge [fontname=\"Helvetica,Arial,sans-serif\", fontsize=9, color=\"#4B5563\"];",
        "",
        "    // Special Nodes",
        "    \"[Start]\" [shape=circle, fillcolor=\"#DEF7EC\", color=\"#057A55\", fontcolor=\"#03543F\", label=\"Start\"];",
        "    \"[Exit]\" [shape=doublecircle, fillcolor=\"#FDE8E8\", color=\"#E02424\", fontcolor=\"#9B1C1C\", label=\"Drop-off\"];",
        ""
    ]
    
    # Output page node weights
    lines.append("    // Node frequencies")
    for node, count in node_counts.items():
        if node in ("[Start]", "[Exit]"):
            continue
        escaped_node = node.replace('"', '\\"')
        lines.append(f'    "{escaped_node}" [label="{escaped_node}\\n({count} visits)"];')
        
    lines.append("")
    lines.append("    // Transitions")
    
    # Calculate relative weight for transition edge formatting
    max_edge_count = max(edge_counts.values()) if edge_counts else 1
    for (src, dest), count in edge_counts.items():
        # Scale line thickness (penwidth) between 1.0 and 5.0 based on traffic intensity
        penwidth = 1.0 + 4.0 * (count / max_edge_count)
        color = "#111827" if count / max_edge_count > 0.5 else "#6B7280"
        
        src_esc = src.replace('"', '\\"')
        dest_esc = dest.replace('"', '\\"')
        lines.append(f'    "{src_esc}" -> "{dest_esc}" [label="{count}", penwidth={penwidth:.2f}, color="{color}"];')
        
    lines.append("}")
    return "\n".join(lines)



if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Analyze site logs and generate a Graphviz clickstream DOT graph.")
    parser.add_argument("logfile", nargs="?", type=str, help="Path to JSON log file. Reads from stdin if omitted.")
    parser.add_argument("--threshold", type=int, default=1800, help="Inactivity timeout in seconds to divide sessions (default: 1800s / 30m)")
    
    args = parser.parse_args()
    
    # Handle inputs
    if args.logfile:
        try:
            with open(args.logfile, 'r') as f:
                sessions = process_logs(f, args.threshold)
        except IOError as e:
            sys.stderr.write(f"Error opening file: {e}\n")
            sys.exit(1)
    else:
        # Fall back to stdin
        sessions = process_logs(sys.stdin, args.threshold)
        
    edge_counts, node_counts = build_clickstream(sessions)
    dot_output = generate_dot(edge_counts, node_counts)
    print(dot_output)
    