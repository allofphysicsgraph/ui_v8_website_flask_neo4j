# Minimal makefile for Sphinx documentation
#

# You can set these variables from the command line.
SPHINXOPTS    = -v
SPHINXBUILD   = sphinx-build
SPHINXPROJ    = PhysicsDerivationGraph
SOURCEDIR     = .
BUILDDIR      = _build

# Put it first so that "make" without argument is like "make help".
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

.PHONY: help Makefile

apidoc:
	sphinx-apidoc -o . ../webserver_for_pdg -f -e

# - `-o .` writes the generated `.rst` stub files into the current docs folder
# - `../webserver_for_pdg` is the source tree to scan (matches your `sys.path.insert` target)
# - `-f` overwrites existing stubs on rebuild
# - `-e` puts each module on its own page (nicer navigation)
# This walks the whole package, including every submodule of `library`, 
# and generates a `.rst` file per module plus a `webserver_for_pdg.rst` 
# (or similarly named) TOC file with proper `automodule::` directives — no manual listing needed. 



# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
html: apidoc
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

clean:
	rm -rf library* _build/* logs/* modules.rst pdg_app.rst wsgi.rst gunicorn.rst