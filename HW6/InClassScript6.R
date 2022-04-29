#In Class Data Assignment 6 Demo
#Judy Yang
#04182022
#revised by Qingqing Yang 04/21/2022

##load packages#############
library(ggplot2)
library(dplyr)#means for groups
install.packages('gplots')
install.packages('ggpubr')
library(gplots)
library(ggpubr)

##read data file############
poisons = read.csv('https://raw.githubusercontent.com/guru99-edu/R-Programming/master/poisons.csv')
head(poisons)
unique(poisons$treat)
unique(poisons$poison)
class(poisons)
str(poisons)
# The column DV should be "num" (number)
# The column DV should be "char"
poisons$poison = as.factor(poisons$poison)
str(poisons)



##One-Way ANOVA#############
oneway = aov(time ~ poison, data = poisons)
help(aov)
install.packages("report")
library("report")
report(oneway)
summary(oneway)
# eta2=ss(Between)/SS(Total)=ss(Between)/ss(Between)+ss(Within)

###plotting#########
#boxplot
ggplot(poisons, aes(x = poison, y = time, group = poison)) +
  geom_boxplot(aes(colour = poison))  + scale_fill_brewer(palette = 'Dark2')
  labs(title = 'Survival Time by Poison Types')

#line graph
plotmeans(time ~ poison, data = poisons)

# or: since the each poison only has 1 dot, no line would be drawn
 time_mean1 = poisons %>%
   group_by(poison) %>%
   summarise(mean = mean(time))
# str(time_mean1)
 ggplot(time_mean1,aes(x = poison, y = mean, colour = poison))+ 
    geom_line() +geom_point() 

##Two-Way ANOVA#############
# for independent 2 way anova:
twoway_int = aov(time ~ poison * treat, data = poisons)
summary(twoway_int)
report(twoway_int)

# for 2 way repeated measure anova
 twoway_main = aov(time ~ poison + treat, data = poisons)
 summary(twoway_main)
 report(twoway_main)

###plotting the data#######

# get means using ¡°summarise¡± command from dplyr package
# anv_data_df %>% group_by(group) %>% summarise(mean = mean(DV))

time_mean = poisons %>%
  group_by(poison, treat) %>%
  summarise(mean = mean(time))

ggplot(time_mean, aes(x = poison, y = mean, colour = treat, group=treat)) +
  geom_point() + geom_line() + labs(title = 'Time of Survival', 
                                    subtitle = 'by poison type and treatment type',
                                    x = 'poison type',
                                    y = 'survival time', 
                                    color = 'treatment type')
# boxplot
ggplot(data = poisons, aes(x = poison, y = time, group = treat)) + 
  geom_boxplot(aes(colour = treat)) + scale_fill_brewer(palette = 'Dark2')

# OR do:
ggplot(data = poisons[poisons$treat == 'A',], aes(x = poison, y = time)) +
  geom_boxplot() + labs(title = 'Treatment A')
p1 = ggplot(data = poisons[poisons$treat == 'A',], aes(x = poison, y = time)) +
  geom_boxplot() + labs(title = 'Treatment A')
p2 = ggplot(data = poisons[poisons$treat == 'B',], aes(x = poison, y = time)) +
  geom_boxplot() + labs(title = 'Treatment B')
p3 = ggplot(data = poisons[poisons$treat == 'C',], aes(x = poison, y = time)) +
  geom_boxplot() + labs(title = 'Treatment C')
p4 = ggplot(data = poisons[poisons$treat == 'D',], aes(x = poison, y = time)) +
  geom_boxplot() + labs(title = 'Treatment D')
ggarrange(p1,p2,p3,p4,nrow = 1)
help('ggarrange')
