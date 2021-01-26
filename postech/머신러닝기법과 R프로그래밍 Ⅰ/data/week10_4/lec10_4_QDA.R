# lec10_4_QDA.R
# Quadratic Discriminant Analysis

# MASS package for LDA
# install.packages("MASS")
library(MASS)

# install.packages("gmodels") #crosstable
library(gmodels)

# set working directory
setwd("D:/tempstore/moocr/wk10")

# read csv file
iris<-read.csv("iris.csv")
attach(iris)

# training/ test data : n=150
set.seed(1000, sample.kind="Rounding")
N=nrow(iris)
tr.idx=sample(1:N, size=N*2/3, replace=FALSE)

# attributes in training and test
iris.train<-iris[tr.idx,-5]
iris.test<-iris[-tr.idx,-5]
# target value in training and test
trainLabels<-iris[tr.idx,5]
testLabels<-iris[-tr.idx,5]

train<-iris[tr.idx,]
test<-iris[-tr.idx,]

# Box's M-test for Homogenity of Covariance Matrices
install.packages("biotools")
library(biotools)
boxM(iris[1:4], iris$Species)

# Quadratic Discriminant Analysis (QDA)
iris.qda <- qda(Species ~ ., data=train, prior=c(1/3,1/3,1/3))
iris.qda

# predict test data set n=50
testpredq <- predict(iris.qda, test)
testpredq

# accuracy of QDA
CrossTable(x=testLabels,y=testpredq$class, prop.chisq=FALSE)

# partimat() function for LDA & QDA
install.packages("klaR")
library(klaR)
partimat(as.factor(iris$Species) ~ ., data=iris, method="lda")
partimat(as.factor(iris$Species) ~ ., data=iris, method="qda")





# stacked histogram
ldahist(data=testpred$x[,1], g=iris$Species, xlim=range(-10:10), ymax=0.7)
ldahist(data=testpred$x[,2], g=iris$Species, xlim=range(-10:10), ymax=0.7)

