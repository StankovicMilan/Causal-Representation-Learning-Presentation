# Build the slides:            make
# Build slides + speaker notes: make notes   (writes main-notes.pdf)
# Remove build files:          make clean

all:
	latexmk -pdf -interaction=nonstopmode -halt-on-error main.tex

notes:
	latexmk -pdf -interaction=nonstopmode -halt-on-error -jobname=main-notes -usepretex='\def\withnotes{}' main.tex

clean:
	latexmk -C main.tex
	latexmk -C -jobname=main-notes main.tex

.PHONY: all notes clean
