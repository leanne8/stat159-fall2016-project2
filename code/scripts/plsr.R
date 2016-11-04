library(pls)

# Load data
scaledCredit = as.matrix(read.csv("data/scaled-credit.csv")) [,-1]
trainSet = as.matrix(read.csv("data/train-set.csv"))[,-1]
testSet = as.matrix(read.csv("data/test-set.csv"))[,-1]
trainx = as.matrix(trainSet[,3:13])
trainy = as.matrix(trainSet[,14])
testx = as.matrix(testSet[,3:13])
testy = as.matrix(testSet[,14])
fullx = as.matrix(scaledCredit[,2:12])
fully = as.matrix(scaledCredit[,13])

#Set Random seeds
set.seed(12345)

plsrCV <- plsr(trainy ~ trainx, scaled = FALSE, validation = "CV")

#Best PLSR model
BestPlsr = min(plsrCV$validation$PRESS)
minPlsr = which.min(plsrCV$validation$PRESS)

# Create PLSR plot
png("images/plsrCV.png")
validationplot(plsrCV, val.type = "MSEP")
dev.off()

# use test sets to get test MSE
plsrPred = as.matrix(predict(plsrCV, testx, ncomp = minPlsr))
plsrMSE= mean((plsrPred - testy)^2)

# refit the model on the full data set
plsrFit <- plsr(fully ~ fullx, ncomp = minPlsr)
plsrFitCoef <- coef(plsrFit)

save(BestPlsr, plsrMSE, minPlsr, plsrCV, plsrFitCoef, file = "data/plsr.RData")

sink('./data/plsr-output.txt')
cat('PLSR CV\n')
print(plsrCV)
cat('PLSR Best Model\n')
print(BestPlsr)
cat('PLSR MSE\n')
print(plsrMSE)
cat('PLSR Coefficients\n')
print(plsrFitCoef)
sink()

