
all: pdf

pdf:
	pdflatex report.tex
	bibtex report
	pdflatex report.tex

clean:
	rm -rf *.aux *.log *.dvi *.blg *.bbl