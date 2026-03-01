#!/usr/bin/env python3

# Physics Derivation Graph
# Ben Payne, 2026
# https://creativecommons.org/licenses/by/4.0/
# Attribution 4.0 International (CC BY 4.0)

import xmltodict
import os

with open("feed.atom") as file_handle:
    file_content = xmltodict.parse(file_handle.read())

for this_entry_dict in file_content['feed']['entry']:

    # make blog title and content safe for jinja2; see https://github.com/allofphysicsgraph/ui_v8_website_flask_neo4j/issues/79
    safe_blog_title = blog_title.replace("{{", "&#123;&#123;").replace("}}","&#125;&#125;").replace("{%", "&#123;%").replace("%}", "%&#125;")
    safe_content = this_entry_dict['content']['#text'].replace("{{", "&#123;&#123;").replace("}}","&#125;&#125;").replace("{%", "&#123;%").replace("%}", "%&#125;")

    if this_entry_dict['blogger:type']=='POST': # don't include 'COMMENT'
        YYYY = this_entry_dict['published'][0:4]
        MM = this_entry_dict['published'][5:7]
        blog_title = this_entry_dict['title']
        #print(YYYY,MM,blog_title)
        str_to_write  = ""
        str_to_write += '{% extends "jinja2_pages/reusable_components/_base.html" %}\n'
        str_to_write += '{% block content %}\n\n'
        str_to_write += "<H1>"+safe_blog_title+"</H1>\n\n"
        str_to_write += "<P><small>Published "+this_entry_dict['published']+" by Physics Derivation Graph</small></P>\n\n"
        # TODO: in the entry body image URLs are not correctly linked to local images
        str_to_write += safe_content + "\n\n"
        str_to_write += '{% endblock %}'

        blog_title_with_dash = blog_title.replace(' ','-').replace('/','-').replace('(','').replace(')','').replace('!','').replace(";","").replace(',','').replace('"','').replace("'","").replace("?","")

        # https://stackoverflow.com/a/273227/1164295
        if not os.path.exists(YYYY):
            os.makedirs(YYYY)
        if not os.path.exists(YYYY+"/"+MM):
            os.makedirs(YYYY+"/"+MM)
        with open(YYYY+"/"+MM+"/"+blog_title_with_dash+".html","w") as file_handle:
            file_handle.write(str_to_write)
