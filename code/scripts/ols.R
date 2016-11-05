scaledCreditA = as.matrix(read.csv("data/scaled-credit.csv")) [,3:13]
scaledCreditB = as.matrix(read.csv("data/scaled-credit.csv")) [,14]

#Fit the ols regression 
ols <- lm (scaledCreditB ~ scaledCreditA )

#Find the summary of ols regression
olsSum <- summary(ols)

#Coeffiecients 
olsCoef <- coef(ols)

#MSE for OLS
olsMSE <- mean(ols$residuals^2)

#save into OLS binary file
save(ols, olsSum, olsCoef, olsMSE, file="./data/ols.RData")

sink('./data/ols-output.txt')
cat('OLS summary statistics\n')
print(olsSum)
cat('OLS coefficients\n')
print(olsCoef)
cat('OLS MSE\n')
print(olsMSE)
sink()
