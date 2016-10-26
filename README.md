# Project 2
# Predictive Modeling Process
## Leanne Lee and Eranda Bregasi

## Description
The file-structure for the project is as follows:
```
stat159-fall2016-project2/
   README.md
   Makefile
   LICENSE
   session-info.txt
   .gitignore
   code/
      functions/
         ...
      scripts/
         ...
      tests/
         ...
   data/
      Credit.csv
      ...
   images/
      ...
   report/
      report.pdf
      report.Rmd
      sections/
         00-abstract.Rmd
         01-introduction.Rmd
         02-data.Rmd
         03-methods.Rmd
         04-analysis.Rmd
         05-results.Rmd
         06-conclusions.Rmd
   slides/
      ...
```
## Instructions on how to reproduce the Project
Users can download the credit database from http://www-bcf.usc.edu/~gareth/ISL/Credit.csv.
Users can reproduce the Exploratory Data Analysis (EDA) by finding summary statistics and plotting data plots. They can also find the relationship between the dependent and independent variables through frequency and anova.
Users can use the. same pre-modeling data process method.
By setting the seeds and using cross validation method, users can generate training and testing sets and use those sets to run regression models.
Users can perform ridge regression, lasso regression, Principal components regression, partial least squares regressions.
Users can find the guidelines through slides.



## phony targets
Your Makefile should have the following Phony targets:

- all: will be associated to phony targets eda, regressions, and report
- data: will download the file Credit.csv to the folder data/
- tests: will run the unit tests of your functions
- eda: will perform the exploratory data analysis
- ols: OLS regression
- ridge: Rdige Regression
- lasso: Lasso Regression
- pcr: Principal Components Regression
- plsr: Partial Least Squares Regression
- regressions: all five types of regressions
- report: will generate report.pdf (or report.html)
- slides: will generate slides.html
- session: will generate session-info.txt
- clean: will delete the generated report (pdf and/or html)
The rule for the target regressions should be written like this:

- regressions:
    - make ols
    - make ridge
    - make lasso
    - make pcr
    - make plsr

## Common License
<a rel="license" href="http://creativecommons.org/licenses/by/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0 International License</a>.

## License
MIT License

Copyright (c) [2016] [Leanne Lee, Eranda Bregasi]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
