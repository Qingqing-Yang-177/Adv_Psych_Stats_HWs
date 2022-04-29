# Advance Psychological statistics Spring 2022
# R Lab 2 
# Created by Qingqing Yang, 02/10/2022


## bar plot for assign 1 Q#5
set1 <- sample.int(5,50,replace = TRUE)
barplot(set1)
set1.sort <- sort(set1)
set1.unisort = sort(unique(set1))
set1.tabled = tabulate(match(set1.sort, set1.unisort))
barplot(set1.tabled, names.arg = set1.unisort)

## scatter plot and correlation
#dataset, change working directory
getwd()
set2 <- read.csv("D:/A-NYU/22_Spring/Advanced Psych Stats/Recitation/Recitation R/HW2/InClass/InClassData2.csv")
summary(set2)

# correlation of column 2 and 3 in set 2
set3 <- set2[,2:3]
cor(set3, use="complete.obs", method="pearson")
library(Hmisc) 
# rcorr function from Hmisc gives p values
rsign <- rcorr(as.matrix(set3),type = "pearson")
rsign

# For spearman correlation, change the above parameter type
# as type ="spearman" in rcorr and cor functions.


# Second method of calculate r
# install.packages("ppcor")
# library(ppcor)
# ppcor(set3$N_of_Friends~set3$Organizational_Self_Rating)
# y~ x

# Third method of calculate r
library(psych)
corr.test(set3,use = "pairwise",method="pearson",adjust="holm", alpha=.05)
help(corr.p)

# For partial correlation 
# help(partial.r)
# partial.r(set2,c(2),c(3),use = "pairwise",method="pearson")

# Scatterplot
plot(set3[,1], set3[,2], main="SelfRating & # of Friends", xlab="SelfRating", ylab="#of friends", pch=19, col ="green")
abline(lsfit(set3$Organizational_Self_Rating,set3$N_of_Friends))
abline(h=12)
help(abline)
# abline(a = NULL, b = NULL, h = NULL, v = NULL, ...)
# abline place straight lines on a plot where ¡°b¡¯=slope, and ¡°a¡±=intercept

# find the linear model for the best fit line.
help(lm)
lm.3 <- lm(set3$N_of_Friends~set3$Organizational_Self_Rating)
summary(lm.3)
# y = -0.03473*x + 12.78696,
# N of Friends = -0.03473*Organizational self rating + 12.78696