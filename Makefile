#
# Makefile
#

EPS_FIGURES=$(shell find . -name \*.eps)
GENPDFS=$(EPS_FIGURES:.eps=.pdf)
unexport TEXINPUTS

all: FBR_Bericht_2025.toc FBR_Bericht_2025.bbl
	sh ./tools/encoding-tester.sh
	pdflatex -halt-on-error FBR_Bericht_2025.tex
	echo "============== important LaTeX warnings ====================="
	cat FBR_Bericht_2025.log | grep "LaTeX Warn" | egrep 'mult|undef' || :

FBR_Bericht_2025.bbl: FBR_Bericht_2025.tex
	biber FBR_Bericht_2025
	pdflatex -halt-on-error FBR_Bericht_2025.tex

FBR_Bericht_2025.toc: FBR_Bericht_2025.tex $(GENPDFS)
	sh ./tools/encoding-tester.sh
	pdflatex -halt-on-error FBR_Bericht_2025.tex 

commit:
	sh ./tools/encoding-tester.sh
	pdflatex -halt-on-error FBR_Bericht_2025.tex
	python3 ./tools/commit-checker.py
	git add -u
	git commit

clean:
	rm -f FBR_Bericht_2025.{aux,bbl,bcf,blg,dvi,log,out,ps,pdf,toc}
	for ext in aux bbl bcf blg dvi log toc out run.xml ; do find . -name \*.$$ext -delete ;done

%.pdf: %.eps
	epstopdf $^ --outfile=$@

