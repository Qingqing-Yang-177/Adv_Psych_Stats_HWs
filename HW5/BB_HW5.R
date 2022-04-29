#Q1
q1_1 <- rnorm(10,100,1)
summary(q1_1)
q1_2 <- rnorm(10,100,10)
summary(q1_2)
q1_3 <- rnorm(100,100,10)
summary(q1_3)
sd(q1_1)
sd(q1_2)
sd(q1_3)
boxplot(q1_1,ylim=c(90,110))
boxplot(q1_2,ylim=c(90,110))
boxplot(q1_3,ylim=c(90,110))
library(psych)

#Q2
set1 <- c(50, 40, 46, 49, 40, 58, 45, 47, 46, 43)
t.test(set1, mu = 50,alternative='less')
# Null hypo: 
# people on vacation, engage in an ¡°inner dialogue¡± no diff 
# compared to people working
# miu1=50
# Alter Hypo:
# people on vacation, engage in an ¡°inner dialogue¡± less than 
# when working. 
# Miu1 < 50

# 2 tail:
# Null hypo: 
# people on vacation, engage in an ¡°inner dialogue¡± no diff 
# compared to people working
# miu1=50
# Alter Hypo:
# people on vacation, engage in an ¡°inner dialogue¡± diff compared 
# when working. 
# Mu1 < 50 or Mu1>50
# t.test(set1, mu = 50)

# Q3
set2 <- c(53, 40, 51, 50,43, 62, 49, 47, 51, 39)
t.test(set1,set2,var.equal = TRUE,alternative='less')
# t = -0.77378, df = 18=2n-2, p-value = 0.2246
# Null hypo: 
# people on vacation, engage in an ¡°inner dialogue¡± no diff 
# compared to people working
# miu1=miu2
# Alter Hypo:
# people on vacation, engage in an ¡°inner dialogue¡± less than 
# when working. 
# Miu1 < miu2

# people on vacation, engage in an ¡°inner dialogue¡± less than 
# when working. 
# Miu1 < miu2

# Null hypo: 
# people on vacation, engage in an ¡°inner dialogue¡± no diff 
# compared to people working
# miu1=mu2
# Alter Hypo:
# people on vacation, engage in an ¡°inner dialogue¡± diff compared 
# when working. 
# Miu1 < mu2 or Mu1>mu2
# t.test(set1, set2,var.equal = TRUE)

# Q4
t.test(set1,set2, paired = TRUE,alternative='less')
# t = -2.3333, df = 9=n-1, p-value = 0.02225
# Null hypo: 
# people on vacation, engage in an ¡°inner dialogue¡± no diff 
# compared to people working
# miu1=miu2
# Alter Hypo:
# people on vacation, engage in an ¡°inner dialogue¡± less than 
# when working. 
# Miu1 < miu2
