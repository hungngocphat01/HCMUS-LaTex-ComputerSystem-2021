LATEX=latexmk
LFLAGS=--shell-escape -synctex=1 -interaction=nonstopmode -file-line-error -pdf
OUTDIR=build
TARGET=main.pdf

$(TARGET): main.tex
	latexmk $(LFLAGS) -outdir=$(OUTDIR) $^
	mv $(OUTDIR)/$(patsubst %.tex,%.pdf,$^) $(OUTDIR)/$@

clean:
	rm $(OUTDIR)/*