#Advanced Stats Spring '22
#In Class data exercise #2
#Judy Yang 02/10/2022
#revised by Qingqing Yang 02/10/2022

##Question 1#####################

#read data file
getwd()
caffeine = read.csv('D:/A-NYU/22_Spring/Advanced Psych Stats/Recitation/Recitation R/HW2/InClass/InClass Ex 2/AdvStatsDataEx2_CaffeinexDream.csv')
summary(caffeine)

###create a scatterplot with caffeine intake on the x-axis and dream vividness 
#on the y-axis
#labeling the axes and the plot
#set the color of the scatter to be red
plot(caffeine$CaffeineIntake, caffeine$DreamVividnessRating, xlab = 'Caffeine Intake', ylab = 'Dream Vividness',
     main = 'Caffeine Intake and Dream Vividness', col = 'red')

#add the best fit line and make it blue
lm.caffeine <- lm(caffeine$DreamVividnessRating ~ caffeine$CaffeineIntake)
summary(lm.caffeine)
# DreamVividnessRating = CaffeineIntake *0.05195 +4.41808
abline(lm(caffeine$DreamVividnessRating ~ caffeine$CaffeineIntake), col = 'blue')
#Dream vividness rating = 0.05195*caffine intake + 4.41808

# calculate the r coefficient
cor.test(caffeine$CaffeineIntake, caffeine$DreamVividnessRating, method="spearman")
# rcorr function from Hmisc gives p values
# install.packages("Hmisc")
library(Hmisc)
rsign <- rcorr(as.matrix(caffeine),type = "spearman")
rsign
# For spearman correlation, change the above parameter type
# as type ="spearman" in rcorr and cor functions.


##Question 2#######################

#read data file
getwd()
openmindedness = read.csv('D:/A-NYU/22_Spring/Advanced Psych Stats/Recitation/Recitation R/HW2/InClass/InClass Ex 2/AdvStatsDataEx2_openmindedness')

#computing the mean
openmindedness.mean = mean(openmindedness$Rating)
openmindedness.mean

#computing the median
openmindedness.median = median(openmindedness$Rating)
openmindedness.median

#computing the mode
# create a function to calcualte the mode
modecal = function(v) {
  uniqv = unique(v)
  tabv = tabulate(match(v, uniqv))
  uniqv[tabv == max(tabv)]
}
openmindedness.mode = modecal(openmindedness$Rating)
openmindedness.mode

#computing standard deviation
# sample 
# df=n-1
openmindedness.ssd = sd(openmindedness$Rating)
openmindedness.ssd
# population
# df = n
# Population standard deviation is simply
# sqrt((n-1)/n) * sd(x)
popsd = function(v) {
  (sd(v) *sqrt((length(v)-1) / (length(v))))
  }
openmindedness.psd = popsd(openmindedness$Rating)
openmindedness.psd

##Question 3##################
getwd()
selfrate = read.csv('D:/A-NYU/22_Spring/Advanced Psych Stats/Recitation/Recitation R/HW2/InClass/InClass Ex 2/AdvStatsDataEx_SpearmanR.csv')

#calculate pearson's r
cor(selfrate$OrganizationalSelfRating, selfrate$NumberofFriends,method = 'pearson')

#calculate spearman's r
cor.test(selfrate$OrganizationalSelfRatingRank, selfrate$NumberofFriendsRank,
         method = 'pearson')
rsign <- rcorr(as.matrix(caffeine),type = "spearman")
rsign

#create scatterplot
plot(selfrate$NumberofFriends, selfrate$OrganizationalSelfRating, col = 'red',
     xlab = 'Number of Friends', 
     ylab = 'Self-Rating',
     main = 'Number of Friends and Self-Rating')

#create linear model
selfrate.line = lm(selfrate$OrganizationalSelfRating ~ selfrate$NumberofFriends)
summary(selfrate.line)
# y = x*(-0.6796)+47.6809

#add best fit line to plot
abline(selfrate.line, col = 'blue')