# lect11_3_svm.r
# Classification
# Support vector machine using kernel

# install.packages("e1071")
# load package for support vector machine
library(e1071) #svm model

install.packages("caret")
# load package for Confusion matrix
library(caret)

# set working directory
setwd("D:/tempstore/moocr/wk11")

# read data
cancer<-read.csv("cancer.csv")
head(cancer, n=10)

# remover X1 column(ID number)
cancer<-cancer[, names(cancer) != "X1"]
attach(cancer)

# training (455) & test set (228)
# set.seed(1000)
N=nrow(cancer)
set.seed(998, sample.kind="Rounding")

# split train data and test data
tr.idx=sample(1:N, size=N*2/3, replace=FALSE)
train <- cancer[ tr.idx,]
test  <- cancer[-tr.idx,]

#svm using kernel
m1<-svm(Y~., data = train)
summary(m1)
m2<-svm(Y~., data = train,kernel="polynomial")
summary(m2)
m3<-svm(Y~., data = train,kernel="sigmoid")
summary(m3)
m4<-svm(Y~., data = train,kernel="linear")
summary(m4)

#measure accuracy
pred11<-predict(m1,test) # radial basis
confusionMatrix(pred11, test$Y)
#table(pred11, y[-tr.idx])

pred12<-predict(m2,test) # polynomial
confusionMatrix(pred12, test$Y)
#table(pred12, y[-tr.idx])

pred13<-predict(m3,test) # sigmoid
confusionMatrix(pred13, test$Y)
#table(pred13, y[-tr.idx])

pred14<-predict(m4,test) # linear
confusionMatrix(pred14, test$Y)
#table(pred14, y[-tr.idx])

library(gmodels)
CrossTable(pred14, test$Y)

