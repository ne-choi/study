# lec11_2_svm.r
# Classification 
# support vector machine using kernel

# install package for support vector machine
# install.packages("e1071")
library (e1071)
# help(svm)

# install package for confusionMatrix
install.packages("caret")
library(caret)

# set working directory
setwd("D:/tempstore/moocr/wk11")

# read data
iris<-read.csv("iris.csv")
attach(iris)

# training (100) & test set (50)
set.seed(1000, sample.kind="Rounding")
N=nrow(iris)
tr.idx=sample(1:N, size=N*2/3, replace=FALSE)
# target variable
y=iris[,5]
# split train data and test data
train=iris[tr.idx,]
test=iris[-tr.idx,]

#svm using kernel
help("svm")
m1<-svm(Species~., data = train)
summary(m1)
m2<-svm(Species~., data = train,kernel="polynomial")
summary(m2)
m3<-svm(Species~., data = train,kernel="sigmoid")
summary(m3)
m4<-svm(Species~., data = train,kernel="linear")
summary(m4)

#measure accuracy
pred11<-predict(m1,test) # radial basis
confusionMatrix(pred11, test$Species)
#table(pred11, y[-tr.idx])

pred12<-predict(m2,test) # polynomial
confusionMatrix(pred12, test$Species)
#table(pred12, y[-tr.idx])

pred13<-predict(m3,test) # simoid
confusionMatrix(pred13, test$Species)
#table(pred13, y[-tr.idx])

pred14<-predict(m4,test) # linear
confusionMatrix(pred14, test$Species)
#table(pred14, y[-tr.idx])

CrossTable(test$Species, pred14)

