scaled_credit <- read.csv('data/scaled-credit.csv', header = TRUE)

#reproducible random numbers
set.seed(12345)

#generate random sample without replacement
train <- sample(1:400, 300, replace = FALSE)

#training set
train_set <- scaled_credit[train, ]

#excluding the 300 random number from above and select 100 random number as test set

test_set <- scaled_credit[!(1:400 %in% train), ]

#save the training and testing sets into csv
write.csv(train_set, file = "data/trainSet.csv")
write.csv(test_set, file = "data/testSet.csv")