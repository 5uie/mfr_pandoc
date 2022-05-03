## Do not add extensions in the names below
# Name of markdown file for the Resume
FILENAME = resume
# HTML style file (css)
HTML = htmlstyle
# Latex file with preamble text
LATEX = latexstyle
# Word template for required formatting (not a template file but a docx file)
WORD = wordstyle

# Make docx, pdf and html
all:
	pandoc -o $(FILENAME).docx $(FILENAME).md --reference-doc=$(WORD).docx --citeproc
	pandoc $(FILENAME).md -s -o $(FILENAME).html -c $(HTML).css --citeproc
	pandoc $(FILENAME).md -o $(FILENAME).pdf --pdf-engine=xelatex -H $(LATEX).tex --citeproc

# Make pdf output with xelatex engine
pdf:
	pandoc $(FILENAME).md -o $(FILENAME).pdf --pdf-engine=xelatex -H $(LATEX).tex --citeproc

# Make html with provided css
html:
	pandoc $(FILENAME).md -s -o $(FILENAME).html -c $(HTML).css --citeproc

# Make docx output with docx template
docx:
	pandoc -o $(FILENAME).docx $(FILENAME).md --reference-doc=$(WORD).docx --citeproc

clean:
	rm resume.{pdf,html,docx}
