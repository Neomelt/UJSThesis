ENGINE ?= xelatex
MAIN := main.tex
PDF := main.pdf

.PHONY: all thesis clean cleanall wordcount help FORCE

all thesis: FORCE $(PDF)

$(PDF): FORCE $(MAIN) ujsthesis.cls style/ujsthesis.cls $(wildcard chapters/*.tex) $(wildcard bib/*.bib) $(wildcard figures/*) latexmkrc
	latexmk -$(ENGINE) -interaction=nonstopmode -file-line-error -synctex=1 $(MAIN)

FORCE:

clean:
	latexmk -c $(MAIN)
	find . -type f \( -name '*.aux' -o -name '*.bbl' -o -name '*.bcf' -o -name '*.blg' -o -name '*.fdb_latexmk' -o -name '*.fls' -o -name '*.log' -o -name '*.out' -o -name '*.run.xml' -o -name '*.synctex.gz' -o -name '*.toc' -o -name '*.lof' -o -name '*.lot' -o -name '*.xdv' -o -name '*.nav' -o -name '*.snm' -o -name '*.vrb' -o -name '*.dvi' -o -name '*.listing' \) -delete

cleanall:
	latexmk -C $(MAIN)
	find . -type f \( -name '*.aux' -o -name '*.bbl' -o -name '*.bcf' -o -name '*.blg' -o -name '*.fdb_latexmk' -o -name '*.fls' -o -name '*.log' -o -name '*.out' -o -name '*.run.xml' -o -name '*.synctex.gz' -o -name '*.toc' -o -name '*.lof' -o -name '*.lot' -o -name '*.xdv' -o -name '*.nav' -o -name '*.snm' -o -name '*.vrb' -o -name '*.dvi' -o -name '*.listing' \) -delete
	find . -maxdepth 1 -type f -name 'main.pdf' -delete

wordcount:
	python3 scripts/wordcount.py

help:
	@echo 'make              build main.pdf with XeLaTeX and Biber'
	@echo 'make ENGINE=lualatex build with LuaLaTeX'
	@echo 'make clean        remove intermediate files'
	@echo 'make cleanall     remove intermediate files and PDF'
	@echo 'make wordcount    count Chinese characters and English words'
