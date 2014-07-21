NAME = usercriteria

all: pdf
pdf: $(NAME).pdf
dvi: $(NAME).dvi
show: showpdf
showpdf: $(NAME).pdf
	evince $<
showdvi: $(NAME).dvi
	xdvi $<

clean::
	-rm -f $(NAME).{aux,log}

$(NAME).bbl: dicosmo.bib mancoosi.bib $(NAME).tex
	bibtex -min-crossrefs=10 $(NAME)

# Debian package: latex-make
-include /usr/include/LaTeX.mk

# create hooks for the gitinfo latex package
configure-git-hooks: .git/hooks/post-commit .git/hooks/post-merge .git/hooks/post-update

.git/hooks/post-commit .git/hooks/post-merge .git/hooks/post-update:
	cp post-xxx-sample.txt $@

