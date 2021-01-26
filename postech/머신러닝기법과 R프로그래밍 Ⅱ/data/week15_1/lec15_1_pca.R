# lec15_1_pca.r
# Multivariate analysis
# Principle Component Analysis

# set working directory
setwd("D:/tempstore/moocr/wk15")

#input data(iris)
iris<-read.csv(file="iris.csv")
attach(iris)
head(iris)

#Check correlation
cor(iris[1:4])

# 1.PCA(center=T->mean=0, scale.=T->variance=1)
ir.pca<-prcomp(iris[,1:4],center=T,scale.=T)
ir.pca
summary(ir.pca)

# ir.pca is the weight to get 1st-4th principal compoenents 

# 2.scree plot : to choose the number of components
plot(ir.pca,type="l")

# either way to draw scree plot
screeplot(ir.pca)


# 3. calculate component=x_data%*% PCA weight
PRC<-as.matrix(iris[,1:4])%*%ir.pca$rotation
head(PRC)

# 4. classification using principal components
# make data with components
iris.pc<-cbind(as.data.frame(PRC), Species)
head(iris.pc)

# 5. support vector machine
# install.packages("e1071")
library (e1071)

# classify all data using PC1-PC4 using support vector machine
m1<- svm(Species ~., data = iris.pc, kernel="linear")
# m2<- svm(Species ~PC1+PC2, data = iris.pc, kernel="linear")
summary(m1)

# predict class for all data 
x<-iris.pc[, -5]
pred <- predict(m1, x)
# check accuracy between true class and predicted class
y<-iris.pc[,5]
table(pred, y)


