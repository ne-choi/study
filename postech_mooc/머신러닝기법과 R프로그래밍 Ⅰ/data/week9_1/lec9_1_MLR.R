# lec9_1_MLR.r
# Multiple Regression
# stepwise method

# set working directory
setwd("D:/tempstore/moocr/wk9")

# autompg data
car<-read.csv("autompg.csv")
head(car)
str(car)
attach(car)

# multiple regression : 1st full model 
r1<-lm(mpg ~ disp+hp+wt+accler, data=car)
summary(r1)

# pariwise plot - Explanatory Data Analysis
var1<-c("mpg","disp","hp","wt", "accler" )
pairs(car[var1], main ="Autompg",cex=1, col=as.integer(car$cyl))

# 2rd model using variable selection method
# step(r1, direction="forward")
# step(r1, direction="backward")
# stepwise selection
step(r1, direction="both")
#step(lm(mpg ~ disp+hp+wt+accler, data=car), direction="both")

# final multiple regression
r2<-lm(mpg ~ disp+wt+accler, data=car)
summary(r2)

# residual diagnostic plot 
layout(matrix(c(1,2,3,4),2,2)) # optional 4 graphs/page 
plot(r2)
