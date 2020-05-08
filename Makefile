HTMLS := $(patsubst %.Rmd,%.html,$(wildcard *.Rmd))
PPTS := $(patsubst %.Rmd,%.pptx,$(wildcard *.Rmd))

all : $(HTMLS) $(PPTS)

%.html : %.Rmd
	Rscript -e "library(rmarkdown); render('$<', 'xaringan::moon_reader')"

%.pptx : %.Rmd
	Rscript -e "library(rmarkdown); render('$<', output_format = 'powerpoint_presentation')"
