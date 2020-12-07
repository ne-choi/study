# lec8_4_reg.r : Linear model 
# Regression

library(dplyr)
library(ggplot2)

# set working directory
setwd("D:/tempstore/moocr/wk8")

# subset of flight data in SFO (n=2974)
# dest="SFO", origin=="JFK", arr_delay<420, arr_delay>0
SF<-read.csv("SF_2974.csv", stringsAsFactors = TRUE))

# 1. graphic analytics
SF %>% 
  ggplot(aes(arr_delay)) + geom_histogram(binwidth = 15)

# 2. graphic analytics
SF %>%
  ggplot(aes(x = hour, y = arr_delay)) +
  geom_boxplot(alpha = 0.1, aes(group = hour)) + geom_smooth(method = "lm") + 
  xlab("Scheduled hour of departure") + ylab("Arrival delay (minutes)") + 
  coord_cartesian(ylim = c(0, 120))

# linear regression
m1<- lm(arr_delay ~ hour , data = SF)
summary(m1)

# scatterplot with best fit lines
par(mfrow=c(1,1))
SF %>%
  plot(hour, arr_delay,  col=as.integer(SF$carrier), pch=19)%>% 
  # best fit linear line
  abline(lm(arr_delay~hour), col="red", lwd=2, lty=1)


# residual diagnostic plot 
layout(matrix(c(1,2,3,4),2,2)) # optional 4 graphs/page 
plot(m1)

# pariwise plot
pairs(car1[,1:6], main ="Autompg",cex=1, col=as.integer(car1$cyl),pch =substring((car1$cyl),1,1))

# par(mar=c(4,4,4,4))
# par(mfrow=c(1,1))
# plot(disp, mpg,  col=as.integer(car1$cyl), pch=19)
# best fit linear line
# abline(lm(mpg~disp), col="red", lwd=2, lty=1)






