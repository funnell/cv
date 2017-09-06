          NAME1 = cv
       PRODUCT1 = $(NAME1).pdf
     TEXSOURCE1 = $(NAME1).tex
           BCF1 = $(NAME1).bcf
      BIBINPUTS = $(NAME1).bib

all: TylerFunnell-CV.pdf

$(NAME1).pdf: $(TEXSOURCE1) $(BCF1)
$(NAME1).dvi: $(TEXSOURCE1) $(BCF1)
$(NAME1).bcf: $(TEXSOURCE1) $(BIBINPUTS)

clean:
	$(RM) $(PRODUCT1) $(NAME1).aux $(NAME1).dvi $(NAME1).log $(NAME1).out \
		$(NAME1).bcf $(NAME1).bbl $(NAME1).blg $(NAME1).run.xml

# configuration issues
.SUFFIXES: .tex .pdf .bcf

PDFLATEX=	pdflatex
XELATEX=	xelatex 
LATEX=		latex
BIBLATEX=	$(XELATEX)
BIBER=      biber
BIBTEX=		bibtex -min-crossref=1000
RM=		rm -f
MV=		mv
CP=		cp -p

.tex.pdf:
	$(XELATEX) $(LATEXFLAGS) $<
	$(XELATEX) $(LATEXFLAGS) $<

.tex.bcf: 
	$(XELATEX) $(LATEXFLAGS) $<
	$(BIBER) $*
	$(RM) $*.aux $*.dvi $*.pdf

TylerFunnell-CV.pdf: cv.pdf
	$(CP) cv.pdf TylerFunnell-CV.pdf
