# lec15_2_pcr.r
# Multivariate analysis
# Principle Component regression

# set working directory
setwd("D:/tempstore/moocr/wk15")

# wine data
wine<-read.csv(file="wine_aroma.csv")
attach(wine)
head(wine)

# Check correlation
cor(wine[1:9])

# 1. PCA(center=T->mean=0, scale.=T->variance=1)
wi.pca<-prcomp(wine[1:9],center=T,scale.=F)
# wi.pca<-prcomp(wine[1:9],center=T,scale.=T)
wi.pca
summary(wi.pca)

# wi.pca is the weight to get 1st-8th principal compoenents 

# 2.scree plot : to choose the number of components
plot(wi.pca,type="l")

# 3. calculate component=x_data%*% PCA weight
PRC<-as.matrix(wine[,1:9])%*%wi.pca$rotation
head(PRC)

# 4. Principal component regression
# make data with components
wine.pc<-cbind(as.data.frame(PRC),Aroma)
head(wine.pc)

# regression(PC1-PC4)
fit1<-lm(Aroma~PC1+PC2+PC3+PC4, data=wine.pc)
fit1
summary(fit1)

# regression(PC1-PC9)
fit2<-lm(Aroma~., data=wine.pc)
fit2
summary(fit2)

# residual diagnostic plot
layout(matrix(c(1,2,3,4),2,2)) # optional 4 graphs/page 
plot(fit2)

# Multiple regression with the raw data
fit3<-lm(Aroma ~., data=wine)
summary(fit3)

# residual diagnostic plot 
layout(matrix(c(1,2,3,4),2,2)) # optional 4 graphs/page 
plot(fit3)

#measuring accuracy
# fit1_pred<-predict(fit1,newdata=wine.pc)


