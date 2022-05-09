# Data assign 6

##load packages#############
library(ggplot2)
library(dplyr)#means for groups
# install.packages('gplots')
# install.packages('ggpubr')
# install.packages("report")
library(report)
library(gplots)
library(ggpubr)

## One-way Anova

# import data 
anv_data_df <- data.frame(group = rep(c("A", "B", "C", "D"), each = 50),
                          DV = c(runif(50, 0, 3), runif(50, 0, 5), runif(50, 1, 7), runif(50, 1, 
                                                                                          7)),stringsAsFactors=T)
class(anv_data_df) 
str(anv_data_df) 

anv_output = aov(DV ~ group, data = anv_data_df) 
summary(anv_output)
report(anv_output)
# The main effect of group is statistically significant and large (F(3, 196) = 31.46, p < .001; Eta2 = 0.33, 95% CI [0.23, 1.00])
library(dplyr)
ms = anv_data_df %>% group_by(group) %>% summarise(DVmean = mean(DV))

# PLOT DATA
ggplot(anv_data_df)+aes(x = group, y = DV, color = group)+ geom_point() + 
  theme(legend.position = "none")

# ggplot(ms)+aes(x = group, y = DVmean, color = group)+ 
  # theme(legend.position = "none")+ geom_boxplot(aes(colour = group)) 


## Two-way anova
anv2_data_df <- data.frame(IV1 = rep(c("A", "B", "C"), each = 60),
                        IV2 = c(rep(c("short", "long"), each =30), rep(c("short", "long"), each =30), 
                                rep(c("short", "long"), each =30)),
                        DV = c(runif(60, 0, 3),
                               runif(60, 0, 5),
                               runif(60, 1, 10)),stringsAsFactors=T) 
str(anv2_data_df) 

anv2_output = aov(DV ~ IV1*IV2, data = anv2_data_df)
summary(anv2_output)
report(anv2_output)
# - The main effect of IV1 is statistically significant and large (F(2, 174) = 94.02, p < .001; Eta2 (partial) = 0.52, 95% CI [0.44, 1.00])
# - The main effect of IV2 is statistically not significant and very small (F(1, 174) = 0.75, p = 0.388; Eta2 (partial) = 4.29e-03, 95% CI [0.00, 1.00])
# - The interaction between IV1 and IV2 is statistically not significant and very small (F(2, 174) = 0.86, p = 0.427; Eta2 (partial) = 9.74e-03, 95% CI [0.00, 1.00])

interaction.plot(x.factor = anv2_data_df$IV2, #x-axis variable
                 trace.factor = anv2_data_df$IV1, #variable for lines
                 response = anv2_data_df$DV, #y-axis variable
                 fun = mean, #metric to plot
                 ylab = "DV",
                 xlab = "IV2",
                 col = c("green", "blue","purple"),
                 lty = 1, #line type
                 lwd = 2, #line width
                 trace.label = "IV1")
