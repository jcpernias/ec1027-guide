
rootdir := .
bookdir := $(rootdir)/_book

sources := \
	index \
	cs-part \
	mcrl \
	asymp \
	het \
	lpm \
	other-cs \
	ts-part \
	intro-ts \
	ols-ts \
	regr-ts \
	autocorr \
	references

html_output_files := $(addprefix $(bookdir)/,$(addsuffix .html,$(sources)))

all: $(html_output_files)

$(bookdir)/%.html: $(rootdir)/%.qmd
	Rscript -e "quarto::quarto_render('$<')"

publish:
	quarto publish gh-pages

preview:
	quarto preview
