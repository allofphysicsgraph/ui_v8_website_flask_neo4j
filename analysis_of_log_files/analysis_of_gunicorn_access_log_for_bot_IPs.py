#!/usr/bin/env python3

# Ben Payne
# Physics Derivation Graph
# https://allofphysics.com
# Creative Commons Attribution 4.0 International License
# https://creativecommons.org/licenses/by/4.0/

# Generated 2026-07-11 by Gemini 3.5 Flash 

"""
python3 analysis_of_gunicorn_access_log_for_bot_IPs.py | grep "IP Address:" | cut -d' ' -f3 > IP_of_bot.log
"""


import json
import re
from datetime import datetime
from collections import defaultdict


# Static assets extension patterns
STATIC_EXTENSIONS = {'.css', '.js', '.png', '.jpg', '.jpeg', '.gif', '.svg', '.woff', '.woff2', '.ttf', '.eot', '.ico', '.json', '.tex'}

# Diagnostic/Scraping/Recon paths
RECON_PATHS = {'/config', '/info', '/robots.txt', '/robots.txt/'}

# Explicit bot agent keywords
BOT_SIGNATURES = [
    'bot', 'spider', 'crawler', 'scrapy', 'curl', 'wget', 'python', 
    'upptime', 'scan', 'claudebot', 'chatgpt', 'semrush', 'meta-webindexer',
    'sogou', 'cohere', 'facebookexternalhit'
]

def analyze_access_log(lines):
    # Aggregated metrics for each IP address
    ip_stats = defaultdict(lambda: {
        'requests': [],
        'static_count': 0,
        'dynamic_count': 0,
        'user_agents': set(),
        'recon_count': 0,
    })

    for line in lines:
        line = line.strip()
        if not line:
            continue
        try:
            entry = json.loads(line)
        except json.JSONDecodeError:
            continue

        ip = entry.get('ip')
        ua = entry.get('ua', '')
        ref = entry.get('ref', '')
        statline = entry.get('statline', '')
        date_str = entry.get('date', '')

        # Extract HTTP method and path
        path = ''
        match = re.match(r'^[A-Z]+\s+([^\s\?]+)', statline)
        if match:
            path = match.group(1)

        # Parse request timestamp
        timestamp = None
        if date_str:
            cleaned_date = date_str.strip("[]")
            try:
                timestamp = datetime.strptime(cleaned_date, "%d/%b/%Y:%H:%M:%S %z")
            except ValueError:
                pass

        # Identify asset classification (Static vs. Dynamic)
        is_static = False
        if path:
            for ext in STATIC_EXTENSIONS:
                if path.lower().endswith(ext):
                    is_static = True
                    break

        # Record entry values
        ip_stats[ip]['user_agents'].add(ua)
        if is_static:
            ip_stats[ip]['static_count'] += 1
        else:
            ip_stats[ip]['dynamic_count'] += 1

        if path in RECON_PATHS:
            ip_stats[ip]['recon_count'] += 1

        if timestamp:
            ip_stats[ip]['requests'].append({
                'time': timestamp,
                'path': path,
                'ref': ref,
                'ua': ua
            })

    suspected_bots = {}

    for ip, data in ip_stats.items():
        score = 0
        markers = []
        total_reqs = len(data['requests'])

        # --- HEURISTIC 1: Explicit User-Agent Signatures ---
        has_bot_ua = False
        for agent in data['user_agents']:
            agent_lower = agent.lower()
            if any(sig in agent_lower for sig in BOT_SIGNATURES):
                has_bot_ua = True
                markers.append(f"Explicit Bot User-Agent detected: '{agent}'")
                score += 100

        # --- HEURISTIC 2: Asset Completeness Profile (Zero-Asset) ---
        # Humans generally require supporting assets to display web pages. 
        # A visitor requesting multiple endpoints but downloading zero assets is suspicious.
        if total_reqs >= 3 and data['static_count'] == 0 and data['dynamic_count'] > 0:
            markers.append("Zero-Asset Profile (fetched only text/endpoints without CSS, JS, or images)")
            score += 45

        # --- HEURISTIC 3: Temporal Speed & Interval Variance ---
        if total_reqs >= 3:
            # Sort the chronological path
            sorted_reqs = sorted(data['requests'], key=lambda x: x['time'])
            deltas = []
            for i in range(1, len(sorted_reqs)):
                delta = (sorted_reqs[i]['time'] - sorted_reqs[i-1]['time']).total_seconds()
                deltas.append(delta)
            
            if deltas:
                avg_interval = sum(deltas) / len(deltas)
                # Rapid timing average
                if avg_interval < 1.5:
                    markers.append(f"High-frequency request sequence (average request rate: {avg_interval:.2f}s)")
                    score += 35
                
                # Low interval variance (highly-uniform programmatic timing)
                if len(deltas) >= 3:
                    variance = sum((x - avg_interval) ** 2 for x in deltas) / len(deltas)
                    if variance < 0.2 and avg_interval > 0:
                        markers.append(f"Programmatic uniformity (interval variance: {variance:.4f}s, average: {avg_interval:.2f}s)")
                        score += 30

        # --- HEURISTIC 4: Probing Scanner Behaviours ---
        if data['recon_count'] > 0:
            markers.append(f"Attempted access to sensitive scanning paths: {RECON_PATHS}")
            score += 50

        # --- HEURISTIC 5: Dynamic deep crawling without Referrers ---
        deep_missing_ref = 0
        for req in data['requests']:
            p, r = req['path'], req['ref']
            if p and p != '/' and p != '/robots.txt' and r == '-':
                deep_missing_ref += 1

        if total_reqs >= 3 and (deep_missing_ref / total_reqs) > 0.8:
            markers.append("Direct dynamic path manipulation (missing standard page referrers)")
            score += 25

        # Classify as suspected bot if any explicit signature matches or the compound behavioral score exceeds 40
        if score >= 40:
            suspected_bots[ip] = {
                'score': score,
                'reasons': markers,
                'total_requests': total_reqs,
                'user_agents': list(data['user_agents'])
            }

    return suspected_bots

if __name__ == '__main__':
    with open('gunicorn_access.log', 'r') as file:
         log_lines = file.readlines()
    
    # log_lines = LOG_DATA.strip().split('\n')
    results = analyze_access_log(log_lines)

    print("=" * 70)
    print("LOG ANALYSIS: IDENTIFIED SUSPECTED WEB BOT / CRAWLER IP ADDRESSES")
    print("=" * 70)
    
    for ip, info in results.items():
        print(f"\nIP Address: {ip}")
        print(f"Confidence Score: {info['score']}/100")
        print(f"Total Log Events: {info['total_requests']}")
        print("Triggers:")
        for reason in info['reasons']:
            print(f"  - {reason}")
    print("\n" + "=" * 70)
