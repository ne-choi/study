# lec10_3_LDA.R
# Linear Discriminant Anlaysis

# install the MASS package for LDA
install.packages("MASS")
library(MASS)

# install.packages("gmodels") #crosstable
library(gmodels)

# set working directory
setwd("D:/tempstore/moocr/wk10")

# read csv file
iris<-read.csv("iris.csv")
attach(iris)

# training/ test data : n=150

set.seed(1000,sample.kind="Rounding")

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

# Linear Discriminant Analysis (LDA) with training data n=100
iris.lda <- lda(Species ~ ., data=train, prior=c(1/3,1/3,1/3))
iris.lda

# predict test data set n=50
testpred <- predict(iris.lda, test)
testpred

# accuracy of LDA
CrossTable(x=testLabels,y=testpred$class, prop.chisq=FALSE)

# export csv file - write out to csv file 
write.table(testpred$posterior,file="posterior_iris.csv", row.names = TRUE, sep=",", na=" ")
write.table(test, ,file="test_iris.csv", row.names = TRUE, sep=",", na=" ")


# stacked histogram
# ldahist(data=testpred$x[,1], g=iris$Species, xlim=range(-10:10), ymax=0.7)
# ldahist(data=testpred$x[,2], g=iris$Species, xlim=range(-10:10), ymax=0.7)
