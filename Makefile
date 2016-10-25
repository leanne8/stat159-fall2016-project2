#declare phony targets
.PHONY: all data tests eda ols ridge lasso pcr plsr regressions report slides session clean testAndTrain

all: eda ols report session-info data testAndTrain

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

#OLS Regression
regression: 
	Rscript code/scripts/ols.R
#Generate pdf report
#report: report/report.Rmd
#	Rscript -e 'library(rmarkdown); render("report/report.Rmd")'

#clean the target
clean:
	rm -f report/report.pdf 

