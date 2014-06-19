          NAME1 = cv
       PRODUCT1 = $(NAME1).pdf
     TEXSOURCE1 = $(NAME1).tex

all: TylerFunnell-CV.pdf $(PRODUCT1)

$(NAME1).pdf: $(TEXSOURCE1)
$(NAME1).dvi: $(TEXSOURCE1)
$(NAME1).bbl: $(TEXSOURCE1)

clean:
	$(RM) $(PRODUCT1) $(NAME1).aux $(NAME1).dvi $(NAME1).log $(NAME1).out

# configuration issues
.SUFFIXES: .tex .pdf

PDFLATEX=	pdflatex
XELATEX=	xelatex 
LATEX=		latex
RM=		rm -f
MV=		mv
CP=		cp -p

.tex.pdf:
	$(XELATEX) $(LATEXFLAGS) $<
	@while egrep -q 'LaTeX Warning:.*Rerun|Rerun to get' $*.log; do \
		   echo $(XELATEX) $<; \
		  $(XELATEX) $(LATEXFLAGS) $< || exit $$?; \
	done

TylerFunnell-CV.pdf: cv.pdf
	$(CP) cv.pdf TylerFunnell-CV.pdf
