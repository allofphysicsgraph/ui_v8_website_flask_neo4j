
# Step 1: export from Google Takeout

Export all of "blogger" from <https://takeout.google.com/>

# Step 2: extract `feed.atom` to HTML files

In this folder (`blog`) place `convert_feedatom_from_google_takeout_to_flat_html_files.py` and `feed.atom`

Then run
```bash
python3 convert_feedatom_from_google_takeout_to_flat_html_files.py
```
to generate the folders and files.

# Step 3: overview file

To generate `blog_list.html` run
```bash
find . -type f | sort | grep /20 > blog_list.html
```

# Step 4: Regex to get HTML

In Sublime replace
```
^\./(.*)\.html
```
with
```
  <LI><a href="/\1.html">\1</a></LI>
```

# Step 5: re-order date

Replace
```
<LI>(<a href="/blog/.*">)([0-9][0-9][0-9][0-9]/[0-9][0-9])/
```
with
```
<LI>\2: \1
```

EOF