# lec9_4_tr_test.R
# classification 
# training data and test data

# set working directory
setwd("D:/tempstore/moocr/wk9")

# read csv file
iris<-read.csv(file="iris.csv")
head(iris)
str(iris)
attach(iris)

# training/ test data : n=150
set.seed(1000, sample.kind="Rounding")
N=nrow(iris)
tr.idx=sample(1:N, size=N*2/3, replace=FALSE)
tr.idx

# attributes in training and test
iris.train<-iris[tr.idx,-5]
iris.test<-iris[-tr.idx,-5]

# target value in training and test
trainLabels<-iris[tr.idx,5]
testLabels<-iris[-tr.idx,5]

# to get frequency of class in test set
table(testLabels)

