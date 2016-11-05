#declare phony targets
.PHONY: all data tests eda ols ridge lasso pcr plsr regressions report slides session clean testAndTrain

all: eda ols report session-info data testAndTrain slides ols ridge lasso pcr plsr regression 

#import data into the data folder (Run this line first to import)
data:
	curl "http://www-bcf.usc.edu/~gareth/ISL/Credit.csv" > data/Credit.csv

#Run eda-script to generate images and summary statistics
eda: code/scripts/eda-script.R 
	Rscript code/scripts/eda-script.R

#Create testing and training sets and put them into csv 
testAndTrain:  code/scripts/training-and-testing.R 
	Rscript code/scripts/training-and-testing.R 

#Save session info information
session-info: code/scripts/session-info-script.R
	Rscript code/scripts/session-info-script.R

ols: 
	Rscript code/scripts/ols.R

ridge:
	Rscript code/scripts/ridge.R

lasso: 
	Rscript code/scripts/lasso.R

pcr:
	Rscript code/scripts/pcr.R

plsr: 
	Rscript code/scripts/plsr.R
  
#Regression script
regression: 
	Rscript code/functions/regression-script.R

#Generate pdf report
report: report/sections/*.Rmd
	cat report/sections/*.Rmd > report.Rmd; 
	Rscript -e "library(rmarkdown); render('report.Rmd','pdf_document')";

#slides:
slides: slides/slides.Rmd
	Rscript -e "library(rmarkdown); render('slides/slides.Rmd')";

#clean the target
clean:
	rm -f report/report.pdf 

