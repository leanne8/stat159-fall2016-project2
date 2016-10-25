#declare phony targets
.PHONY: all data tests eda ols ridge lasso pcr plsr regressions report slides session clean

all: eda ols report session-info data 

#import data into the data folder (Run this line first to import)
data:
	curl "http://www-bcf.usc.edu/~gareth/ISL/Credit.csv" > data/Credit.csv

#Run eda-script to generate images and summary statistics
eda: code/scripts/eda-script.R $(dataset)
	Rscript code/scripts/eda-script.R

#Save session info information
session-info: code/scripts/session-info-script.R
	Rscript code/scripts/session-info-script.R
	
#Generate pdf report
#report: report/report.Rmd
#	Rscript -e 'library(rmarkdown); render("report/report.Rmd")'

#clean the target
clean:
	rm -f report/report.pdf 

