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
	pandoc -o ./outputs/$(FILENAME).docx $(FILENAME).md --reference-doc=./styles/$(WORD).docx --citeproc
	pandoc $(FILENAME).md -s -o ./outputs/$(FILENAME).html -c ./styles/$(HTML).css --citeproc
	pandoc $(FILENAME).md -o ./outputs/$(FILENAME).pdf --pdf-engine=xelatex -H ./styles/$(LATEX).tex --citeproc
	cp ./styles/$(HTML).css ./outputs/styles/$(HTML).css
	cp ./assets/logo.png ./outputs/assets/logo.png

# Make pdf output with xelatex engine
pdf:
	pandoc $(FILENAME).md -o ./outputs/$(FILENAME).pdf --pdf-engine=xelatex -H ./styles/$(LATEX).tex --citeproc

# Make html with provided css
html:
	pandoc $(FILENAME).md -s -o ./outputs/$(FILENAME).html -c ./styles/$(HTML).css --citeproc
	cp ./styles/$(HTML).css ./outputs/styles/$(HTML).css
	cp ./assets/logo.png ./outputs/assets/logo.png

# Make docx output with docx template
docx:
	pandoc -o ./outputs/$(FILENAME).docx $(FILENAME).md --reference-doc=./styles$(WORD).docx --citeproc

clean:
	rm ./outputs/resume.{pdf,html,docx} ./outputs/styles/${HTML}.css ./outputs/assets/logo.png
