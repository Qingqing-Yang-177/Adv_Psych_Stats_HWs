#Sampling Demo
#Judy Yang
#03/21/2022
#revised by Qingqing Yang 03/24/2022

##create 2 populations

#Uniform dis pop
#1000 random integers in range of 1 and 100
rand_pop_uni = sample.int(100,1000, replace = TRUE) 
mean(rand_pop_uni)
#this is nearly a uniform distribution
barplot(table(rand_pop_uni))


#Normal dis pop
#1000 random number from a standard normal distribution (mean = 0, sd = 1)
rand_pop_norm = rnorm(1000) 
#this is a normal distribution
hist(rand_pop_norm, prob = TRUE) 
lines(x = density(rand_pop_norm))

# Uniform dis, 100 sample mean (size =5)
# Sampling from the uniformed population, 
# with a sample size of 5 
rand_samp_uni = sample(rand_pop_uni, size = 5)
hist(rand_samp_uni)
mean(rand_samp_uni)
# Get 100 sample with size of 5
uni_samp_mean_list = c()
for (i in 1:100) {
  rand_samp_uni = sample(rand_pop_uni, size = 5)
  uni_samp_mean = mean(rand_samp_uni)
  uni_samp_mean_list = c(uni_samp_mean_list, uni_samp_mean)
}
hist(uni_samp_mean_list)
lines(x = density(uni_samp_mean_list))
mean(uni_samp_mean_list)
# the original population was uniform, 
# but the sampling distribution of the mean is normal
# Central Limit Theorem!!


# Normal dis
# random sampling from the Normal population, 
# with a sample size of 5
rand_samp_norm = sample(rand_pop_norm, size = 5)
hist(rand_samp_norm)
mean(rand_samp_norm)
# 20 sample with the size of 5
norm_samp_mean_list = c()
for (i in 1:100) {
  rand_samp_norm = sample(rand_pop_norm, size = 5)
  norm_samp_mean = mean(rand_samp_norm)
  norm_samp_mean_list = c(norm_samp_mean_list, norm_samp_mean)
}
hist(norm_samp_mean_list, prob = TRUE) 
lines(x = density(norm_samp_mean_list))
mean(norm_samp_mean_list) #very close to population mean

# 1000 sample with the size of 5
for (i in 1:1000) {
  rand_samp_norm = sample(rand_pop_norm, size = 5)
  norm_samp_mean = mean(rand_samp_norm)
  norm_samp_mean_list = c(norm_samp_mean_list, norm_samp_mean)
}
hist(norm_samp_mean_list, prob = TRUE) 
lines(x = density(norm_samp_mean_list))
mean(norm_samp_mean_list)
