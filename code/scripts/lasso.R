library(glmnet)

scaledCredit = as.matrix(read.csv("data/scaled-credit.csv"))[,-1]
trainSet = as.matrix(read.csv("data/train-set.csv"))[,-1]
testSet = as.matrix(read.csv("data/test-set.csv"))[,-1]
trainx = as.matrix(trainSet[,3:13])
trainy = as.matrix(trainSet[,14])
testx <- as.matrix(testSet[,3:13])
testy <- as.matrix(testSet[,14])

#Run train set using ten-fold cross-validation
grid = 10^seq(10, -2, length = 100)
set.seed(12345)
lassoCV = cv.glmnet(trainx, trainy, alpha = 1, intercept = F, 
                    standardize = F,lambda = grid)

#Select the best model
LassoBest = lassoCV$lambda.min

#plot
png("images/lassoCV.png")
plot(lassoCV)
dev.off()

#MSE 
lasso = predict(lassoCV, testx, s = LassoBest)
lassoMSE <- mean((lasso-testy)^2)

# refit the model on the full data
fullx = as.matrix(scaledCredit[,2:12])
fully = as.matrix(scaledCredit[,13])
LassoFit <- glmnet(fullx, fully, lambda = LassoBest, intercept = FALSE, 
                  standardize = FALSE, alpha = 1)
LassoFitcoef <- coef(LassoFit, s = LassoBest)

#Save Ridge model in binary data
save(lassoCV, LassoBest, lassoMSE, LassoFitcoef, file = "data/lasso.RData")


# Sinking output to txt file
sink('./data/lasso-output.txt')
cat('Lasso best model\n')
print(LassoBest)
cat('Lasso MSE\n')
print(lassoMSE)
cat('Lasso regression coefficients\n')
print(LassoFitcoef)
sink()

