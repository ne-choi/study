# lec12_3_rf.R
# Random Forest using R

# random forest package
install.packages("randomForest")
library(randomForest)
help(randomForest)

# load caret package for confusion matrix
library(caret)

# set working directory
setwd("D:/tempstore/moocr/wk12")

# read csv file
iris<-read.csv("iris.csv")
attach(iris)

# training/ test data : n = 150
set.seed(1000, sample.kind="Rounding")
N<-nrow(iris)
tr.idx<-sample(1:N, size=N*2/3, replace=FALSE)

# split training and test data
train<-iris[tr.idx,]
test<-iris[-tr.idx,]
#dim(train)
#dim(test)

#Random Forest : mtry=2 (default=sqrt(p))
rf_out1<-randomForest(Species~.,data=train,importance=T)
rf_out1

# important variables for RF
round(importance(rf_out1), 2)

#Random Forest : mtry=4
rf_out2<-randomForest(Species~.,data=train,importance=T, mtry=4)
rf_out2

# important variables for RF
round(importance(rf_out2), 2)

# graph
randomForest::importance(rf_out2)
varImpPlot(rf_out2)

#measuring accuracy(rf)
rfpred<-predict(rf_out2,test)
confusionMatrix(rfpred,test$Species)
