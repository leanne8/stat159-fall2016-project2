#install.packages("glmnet")
library(glmnet)

#Load data 
scaledCredit = as.matrix(read.csv("data/scaled-credit.csv"))[,-1]
trainSet = as.matrix(read.csv("data/train-set.csv"))[,-1]
testSet = as.matrix(read.csv("data/test-set.csv"))[,-1]

#Set Random seeds
set.seed(12345)

#Run train set using ten-fold cross-validation
grid = 10^seq(10, -2, length = 100)
trainx = as.matrix(trainSet[,3:13])
trainy = as.matrix(trainSet[,14])
ridgeCV = cv.glmnet(trainx, trainy, alpha = 0, intercept = F, standardize = F,lambda = grid)

#Select the best model
RidgeBest = ridgeCV$lambda.min

#Plot the cross-validation errors
png("images/ridgeCV.png")
plot(ridgeCV)
dev.off()

# Use test set to compute the test Mean Square Error (test MSE)
testx <- as.matrix(testSet[,3:13])
testy <- as.matrix(testSet[,14])

# Calculating the MSE
ridgeP <- predict(ridgeCV,testx, s = RidgeBest)
ridgeMSE <- mean((ridgeP-testy)^2)

# refit the model on the full data set using the parameter chosen by cross-validation
fullx = as.matrix(scaledCredit[,2:12])
fully = as.matrix(scaledCredit[,13])
fullFit <- glmnet(fullx, fully, lambda = RidgeBest, intercept = FALSE, 
                  standardize = FALSE, alpha = 0)
ridgeFitcoef <- coef(fullFit, s = RidgeBest)

#Save Ridge model in binary data
save(ridgeCV, RidgeBest, ridgeMSE, ridgeFitcoef, file = "data/ridge.RData")


# Sinking output to txt file
sink('./data/ridge-output.txt')
cat('\nRidge best model\n')
print(RidgeBest)
cat('Ridge MSE\n')
print(ridgeMSE)
cat('Ridge regression coefficients\n')
print(ridgeFitcoef)
sink()
