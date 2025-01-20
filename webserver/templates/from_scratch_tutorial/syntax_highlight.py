# !pip install Pygments
# https://pygments.org/
# https://pygments.org/docs/quickstart/
# https://pygments.org/docs/lexers/

from pygments import highlight
from pygments.lexers import PythonLexer, DockerLexer, BaseMakefileLexer
from pygments.formatters import HtmlFormatter

with open('docker_and_make/Dockerfile','r') as fil:
    code = fil.read()    
html_output = highlight(code, DockerLexer(), HtmlFormatter())
with open('docker_and_make/Dockerfile.syntax_highlighted','w') as fil:
    fil.write(html_output)
    
with open('docker_and_make/Makefile','r') as fil:
    code = fil.read()    
html_output = highlight(code, BaseMakefileLexer(), HtmlFormatter())
with open('docker_and_make/Makefile.syntax_highlighted','w') as fil:
    fil.write(html_output)

with open('python_and_flask/Dockerfile','r') as fil:
    code = fil.read()    
html_output = highlight(code, DockerLexer(), HtmlFormatter())
with open('python_and_flask/Dockerfile.syntax_highlighted','w') as fil:
    fil.write(html_output)

with open('python_and_flask/controller.py','r') as fil:
    code = fil.read()    
html_output = highlight(code, PythonLexer(), HtmlFormatter())
with open('python_and_flask/controller.py.syntax_highlighted','w') as fil:
    fil.write(html_output)

