#name

#Q1
set1 <- c(28,23,28,30,24,30,20,25,29,24,24,24,20,28,29)
mean(set1)
median(set1)
  
set1.unique <- unique(set1)
set1.tabled = tabulate(match(set1, set1.unique))
set1.mode <- set1.unique[set1.tabled == max(set1.tabled)]
set1.mode

#Q2
set2 <- sample.int(20,10)
mean(set2)
median(set2)

#3
#import the inclassdata1 manually
summary(set3)
sapply(set3, mean)
sapply(set3, median)
sapply(set3,sd)

set3[8,4] <- 10*set3[8,4]
set3[8,4]
sapply(set3, median)


#4
set4 <- sample.int(5,50,replace=TRUE)
barplot(set4)

#5
set5 <- sample.int(100,10)
boxplot(set5)
summary(set5)
sd(set5)
