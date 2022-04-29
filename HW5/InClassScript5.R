# InClassScript5
# Created by Qingqing Yang
# 04/06/2022

# sampling from normal distribution
help(rnorm)
# rnorm generate random deviates from a normal dis
q1_1=rnorm(10,mean=100,sd=1)
q1_2=rnorm(10,mean=100,sd=10)
summary(q1_1)
summary(q1_2)
# plot the q1_1 and q1_2
boxplot(q1_1,ylim=c(90,110))
boxplot(q1_2,ylim=c(90,110))


# q1_1 was drawn from the dis as following:
x_alxe=seq(80, 120, by = .1)
y_alxe=dnorm(x_alxe, mean = 100, sd = 1)
plot(x_alxe,y_alxe,type="l")
# q1_2 was drawn from the dis as following:
x_alxe=seq(80, 120, by = .1)
y_alxe=dnorm(x_alxe, mean = 100, sd = 10)
plot(x_alxe,y_alxe,type="l")


# Change the size
q1_4=rnorm(100,mean=100,sd=10)
boxplot(q1_3,ylim=c(90,110))
barplot(tabulate(p))

### t-tests
help(t.test)

## one sample t-test
q2_df=rnorm(10,mean=45,sd=1)
q2_df

# compare with mu by code
t.test(q2_df, mu = 50)
# df =n-1= 9

# compare with mu by hand
q2_mean=mean(q2_df)
q2_se=sd(q2_df)/sqrt(10)
p5_2tail=qt(c(.025, .975), df=9)
CI95_lower=q2_mean+p5_2tail[1]*q2_se
CI95_upper=q2_mean+p5_2tail[2]*q2_se
CI95_lower
CI95_upper


## two samples independent t-test
# q2_df=rnorm(10,mean=45,sd=1)
q3_df=rnorm(10,mean=47,sd=1)
boxplot(q2_df)
boxplot(q3_df)
t.test(q2_df,q3_df,var.equal = TRUE)
# df =N-2=2n-2=18

## two samples dependent t-test
t.test(q2_df,q3_df, paired = TRUE)
# t = -2.3333, df =n-1=9, p-value = 0.0445