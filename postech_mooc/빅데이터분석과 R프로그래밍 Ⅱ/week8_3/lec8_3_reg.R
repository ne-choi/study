# lec8_3_reg.r : Multiple Linear model 
# Regression

library(dplyr)

# set working directory
setwd("D:/tempstore/moocr/wk8")

# autompg data
car<-read.csv("autompg.csv", stringsAsFactors = TRUE)
head(car)
str(car)

# subset with cyl=4,6,8
car1<-subset(car, cyl==4 | cyl==6 | cyl==8)
attach(car1)

table(cyl)

# multiple Regression
r2<-lm(mpg~wt+accler, data=car1)
summary(r2)
anova(r2)

# residual diagnostic plot 
layout(matrix(c(1,2,3,4),2,2)) # optional 4 graphs/page 
plot(r2)

# filtered data : regression by group
car2<-filter(car, cyl==4 | cyl==6 )
car3<-filter(car, cyl==8)

# car cyl=4,6 vs cyl=8 
par(mfrow=c(1,2))
plot(car2$wt, car2$mpg, col=as.integer(car2$cyl), pch=19, main="cyl=4 or 6")
# best fit linear line
abline(lm(car2$mpg~car2$wt), col="red", lwd=2, lty=1)

plot(car3$wt, car3$mpg, col="green", pch=19, main="cyl=8")
# best fit linear line
abline(lm(car3$mpg~car3$wt), col="red", lwd=2, lty=1)

# compare with total 
m2<-lm(mpg~wt, data=car2)
summary(m2)

m3<-lm(mpg~wt, data=car3)
summary(m3)

m1<-lm(mpg~wt, data=car1)
summary(m1)
