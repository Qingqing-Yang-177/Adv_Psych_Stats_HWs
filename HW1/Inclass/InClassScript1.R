# Advance Psychological statistics Spring 2022
# R Lab 1 
# Created by Qingqing Yang, 02/01/2022

# Packages
install.packages("carData")
library(carData)

## Data Set Manipulation
# assign variable:
# windows 	Alt+-, 
# mac Option+-
set1 <-  c(1,2,3,3,4,5,6,7)
# The ¡°c¡± stands for combine

set2 <- sample.int(10, 9)
# sample.int(10, 9) returns 9 numbers randomly, 
# drawn from 1 to 10.

set3 <- sample.int(5, 100, replace = TRUE) 
# returns 100 numbers randomly drawn from 1 to 5.

# The argument ¡°replace = TRUE¡± allows the command 
# ¡°sample.int¡± to drawn from the vector 1 through 5 here 
# and then return the selection drawn after it 
# has been pulled.
getwd()
# setwd("D:/A-NYU/22_Spring/Advanced Psych Stats/Recitation/Recitation R")
getwd()
set4 <- read.csv("D:/A-NYU/22_Spring/Advanced Psych Stats/Recitation/Recitation R/HW1/Inclass/InClassData1.csv")
set5 <- InClassData1

## Descriptive data analysis
# mean of set1
set1.mean <- mean(set1)
set1.mean
print(set1.mean)
print(mean(set1))

# median of set2
set2.median <- median(set2)
set2.median

print(median(set2))

# mode of set1
set1.unique <- unique(set1)
help("unique")
# unique returns a vector, data frame or array like x 
# but with duplicate elements/rows removed.
set1.tabled = tabulate(match(set1, set1.unique))
match(set1, set1.unique)
help("tabulate")
# tabulate takes the integer-valued vector bin and counts 
# the number of times each integer occurs in it.

set1.mode <- set1.unique[set1.tabled == max(set1.tabled)]
set1.mode
set1.unique[3]

#descriptive statsitics of set4
sapply(set4,mean)
sapply(set4,median)
sapply(set4,sd)

participat1_mean <- mean(set4$Participant1)
participat1_mean

sapply(set4[,1:3],mean)
sapply(set4[,c(2,4)],var)

## Plottings
set6 <- sample.int(5,50,replace = TRUE)
set6.sort <- sort(set6)
set6.unisort = sort(unique(set6))
set6.tabled = tabulate(match(set6.sort, set6.unisort))
barplot(set6.tabled, names.arg = set6.unisort)
help("barplot")

boxplot(set3)
# The boxplot() command is used to create a ¡°box and whiskers¡± plot 
# that lists the median, range, 25  and 75th percentile value and 
# shows the dispersion of the values.

## Normal Distribution
x = seq(-4, 4, by = .1)
help(seq)
# by: increment of the sequence.

# ## other practice of setting a sequence
# grade_c <- seq(4,8,by=2)
# # equal interval of the number 2, from 4 to 8
# 
# rep_group_c <- rep(8:2,times=4)
# # the in ordered number column, with 1 as interval, repeat 4 times
# 
# sorted_rep_group_c <- sort(rep_group_c)
# # sorted the order by small numbers to larger ones

# rep_each_c <- rep(2:5,each=2)
# # repeat each number from 2 to 5, each 2 times.

y = dnorm(x, mean = 0, sd = 1)
help("dnorm")
#density distribution
z = pnorm(x, mean = 0, sd = 1)
# culmulated distribution
# z = pnorm(x, mean = 0, sd = 1, lower.tail = TRUE, log.p = FALSE)
plot(x,y, main="Normal distributed sample", xlab="x", ylab="y", pch=10, col ="blue")
plot(x,z, main="Normal distributed sample", xlab="x", ylab="y", pch=19, col ="blue")

# Change circle to line
help("plot.default")
plot(x, y, type = "l",main="Normal distributed sample", col ="darkorchid") 

