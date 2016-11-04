#install.packages("pls")
library(pls)

# Load data
scaledCredit = as.matrix(read.csv("data/scaled-credit.csv")) [,-1]
trainSet = as.matrix(read.csv("data/train-set.csv"))[,-1]
testSet = as.matrix(read.csv("data/test-set.csv"))[,-1]
trainx = as.matrix(trainSet[,3:13])
trainy = as.matrix(trainSet[,14])
testx = as.matrix(testSet[,3:13])
testy = as.matrix(testSet[,14])

#Set Random seeds
set.seed(12345)

#Cross validation 
pcrCV = pcr(trainy ~ trainx, scaled = FALSE, validation = "CV")

#Best PCR model
BestPCR = min(pcrCV$validation$PRESS)
minPCR = which.min(pcrCV$validation$PRESS)

# Create PCR plot
png("images/pcrCV.png")
validationplot(pcrCV, val.type = "MSEP")
dev.off()

# use test sets to get test MSE
pcrPred = as.matrix(predict(pcrCV, testx, ncomp = minPCR))
pcrMSE= mean((pcrPred - testy)^2)

# refit the model on the full data set
fullx = as.matrix(scaledCredit[,2:12])
fully = as.matrix(scaledCredit[,13])
pcrFit <- pcr(fully ~ fullx, ncomp = minPCR)
pcrFitCoef <- coef(pcrFit)

save(BestPCR, pcrMSE, minPCR, pcrCV, pcrFitCoef, file = "data/pcr.RData")

sink('./data/pcr-output.txt')
cat('PCR CV\n')
print(pcrCV)
cat('PCR Best Model\n')
print(BestPCR)
cat('PCR MSE\n')
print(pcrMSE)
cat('PCR Coefficients\n')
print(pcrFitCoef)
sink()

