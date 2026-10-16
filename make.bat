call clean.bat

if not exist build mkdir build
pdflatex -output-directory=build thesis
bibtex build\thesis
pdflatex -output-directory=build thesis
pdflatex -output-directory=build thesis
pdflatex -output-directory=build thesis
copy /y build\thesis.pdf .
