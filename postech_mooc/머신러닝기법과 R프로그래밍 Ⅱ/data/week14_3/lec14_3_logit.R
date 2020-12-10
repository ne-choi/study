# lec14_3_logit.r
# Logistic regression

# set working directory
setwd("D:/tempstore/moocr/wk14")

# remiss data
re <- read.csv("remiss.csv")
head(re)
str(re)
attach(re)

#logistic regression (full model)
t1<-glm(remiss~cell+smear+infil+li+blast+temp, data=re,family=binomial(logit))
summary(t1)

cor(re)

# logisitic regression (reduced model 1)
t2<-glm(remiss~cell+smear+li+temp, data=re,family=binomial(logit))
summary(t2)

# logisitic regression (reduced model 2)
t3<-glm(remiss~cell+li+temp, data=re,family=binomial(logit))
summary(t3)

# output data with predicted probability
dat1_pred<-cbind(re,t3$fitted.values)
write.table(dat1_pred,file="dat1_pred.csv", row.names=FALSE, sep=",", na=" ")

