# lec8_1_cor.r
# Correlation coefficent

# set working directory
setwd("D:/tempstore/moocr/wk8")

# autompg data
car<-read.csv("autompg.csv")
#head(car)
#dim(car)

# subset of car : cyl (4,6,8)
car1<-subset(car, cyl==4 | cyl==6 | cyl==8)
attach(car1)

#correlation
cor(wt, mpg)
cor(disp, mpg)
cor(accler, mpg)

# 6. pariwise plot
# new variable lists
vars1<-c("disp", "wt", "accler", "mpg")
# pariwise plot
pairs(car1[vars1], main ="Autompg",cex=1, col=as.integer(car1$cyl),pch =substring((car1$cyl),1,1))

## Watch out!!
## Monkey data
monkey<-read.csv("monkey.csv")
head(monkey)
dim(monkey)
attach(monkey)

# correlation coefficients
cor(height, weight)
# scatterplot for weight and height
par(mfrow=c(1, 1))
plot(height, weight, pch=16, col=3,main="Monkey data")

# add the best fit linear line (lec4_3.R)
abline(lm(weight~height), col="blue", lwd=2, lty=1)

# linear model and summary of linear model
m1<-lm(weight~height)
summary(m1)

## Monkey data + Kingkong
monkey1<-read.csv("monkey_k.csv")
head(monkey1)
dim(monkey1)
attach(monkey1)

# correlation coefficients
cor(height, weight)
# scatterplot for weight and height
par(mfrow=c(1, 1))
plot(height, weight, pch=16, col=3,main="Monkey data")

# add the best fit linear line (lec4_3.R)
abline(lm(weight~height), col="red", lwd=2, lty=1)

# linear model and summary of linear model for monkey+king kong
m2<-lm(weight~height)
summary(m2)

  