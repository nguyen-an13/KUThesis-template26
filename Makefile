thesis:
	@mkdir -p build
	@pdflatex -output-directory=build $@
	@bibtex build/$@
	@pdflatex -output-directory=build $@
	@pdflatex -output-directory=build $@
	@pdflatex -output-directory=build $@
	@cp build/$@.pdf .

clean:
	rm -rf build
	rm -f thesis.pdf
