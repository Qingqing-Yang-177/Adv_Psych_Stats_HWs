#Advanced Stats Spring '22
#In Class script #3
#Created by Qingqing Yang 03/2/2022

##Question 1#####################

# Create data frame
Q1_df <- data.frame(
  categories=c("Orange","Blue","Green","Red","Maroon"),
  freq = c(21,21,18,19,20)
)
# barplot(Q1_df$freq,names.arg = Q1_df$categories, ylim=c(0,25), space=0.1,legend.text = Q1_df$freq,col=rainbow(5))
barplot(Q1_df$freq,
        names.arg = Q1_df$categories, 
        ylim=c(0,25)
)

##Question 2#####################

# Create data frame
Q2_df <- data.frame(
  Participant = 1:15,
  Introspection = c(51,65,74,74,75,76,87,86,51,85,52,92,97,70,86),
  Optimism = c(55,80,71,66,74,68,51,67,74,67,81,83,87,74,84)
)

# Pearson's r
cor.test(Q2_df$Introspection, Q2_df$Optimism,method = "pearson")

# Plot the data
plot(Q2_df$Introspection, Q2_df$Optimism,
     main = "Introspection and Optimism",
     xlab = "Introspection",
     ylab = "Optimism"
)

# Linear regression
lm_Q2=lm(Q2_df$Introspection ~ Q2_df$Optimism)
abline(lm_Q2)
# Y = 0.2423X+57.2557
lm_Q2

##Question 3#####################

# Get the data frame for Q3
Q3_df <- data.frame(
  Participant = 1:12,
  Visual_Imagery_Rating= c(44,38,40,43,47,31,42,42,48,28,40,41),
  Vivid_Dreaming = NaN
)

# calculate the y and put it in the data frame
slope = 0.004
intercept= 6.023

for (i in 1:12){
Q3_df$Vivid_Dreaming[i]=
  slope*Q3_df$Visual_Imagery_Rating[i]+intercept
}

Q3_df

##Question 4#######################

# Data frame
Q4_df <- data.frame(
  x = c(16,12,15,13,11),
  y_predicted= c(56.86,146.38,79.2415,124,168.76),
  residuals= c(-21.86,-66.38,30.76,26,31.24),
  y = NaN
)
# Find y
for (i in 1:5){
  Q4_df$y[i]=Q4_df$y_predicted[i]+Q4_df$residuals[i]
}

# Plot x and y with range on x and y
plot(Q4_df$x, Q4_df$y,
     main = "x and y",
     xlab = "x",
     ylab = "y",
    xlim = c(0,25),
    ylim = c(0,250),
)

help('plot')
help('abline')
# The h= and v= forms draw horizontal and vertical lines at the specified coordinates
abline(v=11.8)
