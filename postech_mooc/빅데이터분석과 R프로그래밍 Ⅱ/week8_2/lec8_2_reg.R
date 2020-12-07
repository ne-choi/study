# lec8_2_reg.r : Linear model 
# Regression

# set working directory
setwd("D:/tempstore/moocr/wk8")

# autompg data
car<-read.csv("autompg.csv")
head(car)
str(car)

# subset with cyl=4,6,8
car1<-subset(car, cyl==4 | cyl==6 | cyl==8)
attach(car1)

table(cyl)

# 1. simple Regression(independent variable : wt)
r1<-lm(mpg~wt, data=car1)
summary(r1)
anova(r1)

# scatterplot with best fit lines
par(mfrow=c(1,1))
plot(wt, mpg,  col=as.integer(car1$cyl), pch=19)
# best fit linear line
abline(lm(mpg~wt), col="red", lwd=2, lty=1)

# 2. simple Regression(independent variable : disp)
r2<-lm(mpg~disp, data=car1)
summary(r2)
anova(r2)

# residual diagnostic plot 
layout(matrix(c(1,2,3,4),2,2)) # optional 4 graphs/page 
plot(r2)

# pariwise plot
pairs(car1[,1:6], main ="Autompg",cex=1, col=as.integer(car1$cyl),pch =substring((car1$cyl),1,1))

# par(mar=c(4,4,4,4))
# par(mfrow=c(1,1))
# plot(disp, mpg,  col=as.integer(car1$cyl), pch=19)
# best fit linear line
# abline(lm(mpg~disp), col="red", lwd=2, lty=1)






