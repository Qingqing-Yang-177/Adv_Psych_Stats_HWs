# InClassScript4
# Created by Qingqing Yang
# Based on Judy Yang's SamplingTheory script
# 03/27/2022

## uniform population

#Get 1000 random integers in range of [1,100]
rand_pop_uni = sample.int(100,1000, replace = TRUE)
#this is nearly a uniform population dis
barplot(table(rand_pop_uni))

#Get 3 samples from uniform pop distribution
x = sample(rand_pop_uni, size = 10)
y = sample(rand_pop_uni, size = 10)
z = sample(rand_pop_uni, size = 10)

#Create a data frame to store the samples
df <- data.frame(x,y,z)

## Describe the data
sapply(df, mean)
# It's enough to have only 1 time of installation
# of certain package, for the whole using of R
install.packages("ppcor")
install.packages("psych")
library(ppcor)
library(psych)
describe(df)

## Correlation
cor.test(df$x,df$y,method="pearson")
partial.r(df)
pcor.test(df$x,df$y,df$z,method="pearson")
pcor(df)

## Q4 plot 2 sets of points
plot(df$x,df$y,
     main = "Correlation",
     xlab = "x",
     ylab = "y",
#     xlim=c(0,200),
     type ="o",
     col="green")
help("plot.default")
# a
plot(df$x,df$z,
     main = "Correlation",
     xlab = "x",
     ylab = "z",
     pch=6,
     col="red")

# add some points with another color
points(df$x,df$z, type = "p", col = "red")

#b
# sort the df by the order of y
df_ordery=df[order(df$y),]
plot(df_ordery$y,df_ordery$z,
     main = "Correlation",
     xlab = "y",
     ylab = "z",
     col="green")
# add a line without point
points(df_ordery$y,df_ordery$z, type = "l", col = "pink")
help("data.frame")
