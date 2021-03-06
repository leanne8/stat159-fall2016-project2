credit <- read.csv("data/Credit.csv", header = TRUE)

library(ggplot2)

sink('data/eda_sum_stat.txt')
cat("Summary statistics for Income \n")
summary(credit$Income)
range(credit$Income)
IQR(credit$Income)
sd(credit$Income)

cat("Summary statistics for Limit \n")
summary(credit$Limit)
range(credit$Limit)
IQR(credit$Limit)
sd(credit$Limit)

cat("Summary statistics for Rating \n")
summary(credit$Rating)
range(credit$Rating)
IQR(credit$Rating)
sd(credit$Rating)

cat("Summary statistics for Cards \n")
summary(credit$Cards)
range(credit$Cards)
IQR(credit$Cards)
sd(credit$Cards)

cat("Summary statistics for Age \n")
summary(credit$Age)
range(credit$Age)
IQR(credit$Age)
sd(credit$Age)

cat("Summary statistics for Education \n")
summary(credit$Education)
range(credit$Education)
IQR(credit$Education)
sd(credit$Education)

cat("Summary statistics for Balance \n")
summary(credit$Balance)
range(credit$Balance)
IQR(credit$Balance)
sd(credit$Balance)

sink()

#Income Graphs
png(filename = "./images/hist-income.png")
ggplot(credit, aes(x = Income)) + geom_histogram(binwidth=7, colour = "blue") + ggtitle("Histogram for Income")
dev.off()

png(filename = "./images/boxplot-income.png")
boxplot(credit$Income, main = "Boxplot for Income")
dev.off()

#Limit Graphs
png(filename = "./images/hist-limit.png")
ggplot(credit, aes(x = Limit)) + geom_histogram(binwidth=7, colour = "blue") + ggtitle("Histogram for Limit")
dev.off()

png(filename = "./images/boxplot-limit.png")
boxplot(credit$Limit, main = "Boxplot for Limit")
dev.off()

#Rating Graphs
png(filename = "./images/hist-rating.png")
ggplot(credit, aes(x = Rating)) + geom_histogram(binwidth=7, colour = "blue") + ggtitle("Histogram for rating")
dev.off()

png(filename = "./images/boxplot-rating.png")
boxplot(credit$Rating, main = "Boxplot for Rating")
dev.off()

#Cards Graphs
png(filename = "./images/hist-cards.png")
ggplot(credit, aes(x = Cards)) + geom_histogram(binwidth=7, colour = "blue") + ggtitle("Histogram for Cards")
dev.off()

png(filename = "./images/boxplot-cards.png")
boxplot(credit$Cards, main = "Boxplot for Cards")
dev.off()

#Age Graphs
png(filename = "./images/hist-age.png")
ggplot(credit, aes(x = Age)) + geom_histogram(binwidth=7, colour = "blue") + ggtitle("Histogram for Age")
dev.off()

png(filename = "./images/boxplot-age.png")
boxplot(credit$Age, main = "Boxplot for Age")
dev.off()

#Education Graphs
png(filename = "./images/hist-ed.png")
ggplot(credit, aes(x = Education)) + geom_histogram(binwidth=7, colour = "blue") + ggtitle("Histogram for Education")
dev.off()

png(filename = "./images/boxplot-ed.png")
boxplot(credit$Education, main = "Boxplot for Education")
dev.off()


#Gender Boxplot
png(filename = "./images/boxplot-gender.png")
boxplot(Balance ~ Gender, data = credit, main = "Boxplot for Gender")
dev.off()

#Student Boxplot
png(filename = "./images/boxplot-student.png")
boxplot(Balance ~ Student, data = credit, main = "Boxplot for Student")
dev.off()

#Married Boxplot
png(filename = "./images/boxplot-married.png")
boxplot(Balance ~ Married, data = credit, main = "Boxplot for Married")
dev.off()

#Ethnicity Boxplot
png(filename = "./images/boxplot-ethnicity.png")
boxplot(Balance ~ Ethnicity, data = credit, main = "Boxplot for Ethnicity")
dev.off()

#Balance Graphs
png(filename = "./images/hist-balance.png")
ggplot(credit, aes(x = Balance)) + geom_histogram(binwidth=10, colour = "blue") + ggtitle("Histogram for Balance")
dev.off()

png(filename = "./images/boxplot-balance.png")
boxplot(credit$Balance, main = "Boxplot for Balance")
dev.off()

#Frequency 
sink('data/eda-frequency.txt')
cat("Gender Frequency \n")
genderF <- table(credit$Gender)
genderRF <- genderF/400
cbind(genderF, genderRF)

cat("Student Frequency \n")
studentF <- table(credit$Student)
studentRF <- studentF/400
cbind(studentF, studentRF)

cat("Married Frequency \n")
marriedF <- table(credit$Married)
marriedRF <- marriedF/400
cbind(marriedF, marriedRF)

cat("Ethnicity Frequency \n")
ethnicityF <- table(credit$Ethnicity)
ethnicityRF <- ethnicityF/400
cbind(ethnicityF, ethnicityRF)

sink()

# Making Qualitative Variable Information Tables
quantitative_df = credit[,c("Income", "Limit", "Rating", "Cards", "Age", "Education", "Balance")]
corr_mat <- cor(quantitative_df)
save(corr_mat, file = "./data/correlation-matrix-quantitative.RData")

#scatterplot matrix
png('images/scatterplot-matrix-quantitative.png')
pairs(quantitative_df)
dev.off()

#quantitative
qualitative_df = credit[, c("Gender", "Student", "Married", "Ethnicity")]

sink('data/eda-sum-stat.txt')
cat("Anova for Gender \n")
aov(credit$Balance ~ credit$Gender)
cat("Anova for Student \n")
aov(credit$Balance ~ credit$Student)
cat("Anova for Married \n")
aov(credit$Balance ~ credit$Married)
cat("Anova for Ethnicity \n")
aov(credit$Balance ~ credit$Ethnicity)
sink()

png(filename = "./images/boxplot-gender.png")
boxplot(credit$Balance ~ credit$Gender)
dev.off()
png(filename = "./images/boxplot-student.png")
boxplot(credit$Balance ~ credit$Student)
dev.off()
png(filename = "./images/boxplot-married.png")
boxplot(credit$Balance ~ credit$Married)
dev.off()
png(filename = "./images/boxplot-ethnicity.png")
boxplot(credit$Balance ~ credit$Ethnicity)
dev.off()

