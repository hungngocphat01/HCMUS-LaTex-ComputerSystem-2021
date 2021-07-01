LATEX=latexmk
LFLAGS=--shell-escape -synctex=1 -interaction=nonstopmode -file-line-error -pdf
OUTDIR=build
TARGET=main

$(TARGET): main.tex
	latexmk $(LFLAGS) -outdir=$(OUTDIR) $^
	mv $(OUTDIR)/$(patsubst %.tex,%.pdf,$^) $(OUTDIR)/$@