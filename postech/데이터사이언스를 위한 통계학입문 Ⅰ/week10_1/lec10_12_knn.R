# lec10_12_knn.R
# updated Jun.2018

# lec10_1_knn.R
# Classification
# k-Nearest Neighbor

# packages
install.packages("class")#no weighted value knn
install.packages("gmodels")#crosstable
install.packages("scales")#for graph
library(class)
library(gmodels)
library(scales)

# set working directory
setwd("D:/tempstore/moocr/wk10")

# read csv file
iris<-read.csv("iris.csv")
# head(iris)
# str(iris)
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

# knn (5-nearest neighbor)
md1<-knn(train=iris.train,test=iris.test,cl=trainLabels,k=5)
md1
help(knn)
# accuracy of 5-nearest neighbor classification
CrossTable(x=testLabels,y=md1, prop.chisq=FALSE)
help(CrossTable)

########################

# lec10_2_knn.R
# optimal k
# Weighted knn

# optimal k selection (1 to n/2)
accuracy_k <- NULL
# try k=1 to nrow(train)/2, may use nrow(train)/3(or 4,5) depending the size of n in train data
nnum<-nrow(iris.train)/2
for(kk in c(1:nnum))
{
  set.seed(1234, sample.kind="Rounding")
  knn_k<-knn(train=iris.train,test=iris.test,cl=trainLabels,k=kk)
  accuracy_k<-c(accuracy_k,sum(knn_k==testLabels)/length(testLabels))
}

# plot for k=(1 to n/2) and accuracy
test_k<-data.frame(k=c(1:nnum), accuracy=accuracy_k[c(1:nnum)])
plot(formula=accuracy~k, data=test_k,type="o",ylim=c(0.5,1), pch=20, col=3, main="validation-optimal k")
with(test_k,text(accuracy~k,labels = k,pos=1,cex=0.7))

# minimum k for the highest accuracy
min(test_k[test_k$accuracy %in% max(accuracy_k),"k"])

#k=7 knn
md1<-knn(train=iris.train,test=iris.test,cl=trainLabels,k=7)
CrossTable(x=testLabels,y=md1, prop.chisq=FALSE)

# graphic display
plot(formula=Petal.Length ~ Petal.Width,
     data=iris.train,col=alpha(c("purple","blue","green"),0.7)[trainLabels],
     main="knn(k=7)")
points(formula = Petal.Length~Petal.Width,
       data=iris.test,
       pch = 17,
       cex= 1.2,
       col=alpha(c("purple","blue","green"),0.7)[md1]
)
legend("bottomright",
       c(paste("train",levels(trainLabels)),paste("test",levels(testLabels))),
       pch=c(rep(1,3),rep(17,3)),
       col=c(rep(alpha(c("purple","blue","green"),0.7),2)),
       cex=0.9
)

## Weighted KNN packages
install.packages("kknn")#weighted value knn
library(kknn)
help("kknn")

# weighted knn
md2<-kknn(Species~., train=train,test=iris.test,k=5,distance=1,kernel="triangular")
md2
# to see results for weighted knn
md2_fit<-fitted(md2)
md2_fit
# accuracy of weighted knn
CrossTable(x=testLabels,y=md2_fit,prop.chisq=FALSE,prop.c=FALSE)

# weighted knn (k=7, distance=2)
md3<-kknn(Species~., train=train,test=iris.test,k=7,distance=2,kernel="triangular")
md3
# to see results for weighted knn
md3_fit<-fitted(md3)
md3_fit
# accuracy of weighted knn
CrossTable(x=testLabels,y=md3_fit,prop.chisq=FALSE,prop.c=FALSE)

