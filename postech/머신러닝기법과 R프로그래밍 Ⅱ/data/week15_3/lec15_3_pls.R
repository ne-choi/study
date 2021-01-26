# lec15_3_pls.r
# Partial Least Square
# package : pls

# install package for Partial Least Square 
install.packages('pls')
library(pls)

# set working directory
setwd("D:/tempstore/moocr/wk15")

# example PLS with gasoline data
data(gasoline)
help("gasoline")

attach(gasoline)

# descriptive statistics
par(mfrow=c(1,1))
hist(octane, col=3)
summary(octane)

# pls function
help(plsr)

# train and test set
gasTrain <- gasoline[1:50, ]
gasTest <- gasoline[51:60, ]

# 1.check how many principal components
ga.pca<-prcomp(gasoline$NIR,center=T,scale.=F)
ga.pca
summary(ga.pca)
plot(ga.pca,type="l")

# pls model by training set (find LV by leave-one-out) 
# 1. start with 10 component PLS model
gas1 <- plsr(octane ~ NIR, ncomp = 10, data = gasTrain, validation = "LOO")

summary(gas1)

# 2. to choose the number of components
plot(RMSEP(gas1), legendpos = "topright", pch=46, cex=1.0, main="Cross-validation for # of LV")
# for gasoline data, # of LV=2

# 3. Display the PLS model with LV=2
# scatterplot with true and predicted
plot(gas1, ncomp = 2, asp = 1, line = TRUE, cex=1.5,main="Measured vs Predicted", xlab="Measured" )

# Check explained variances proportion for X
explvar(gas1)

# 4. predicted Y for test data
ypred<-predict(gas1, ncomp = 2, newdata = gasTest)

y<-gasoline$octane[51:60]

# check : RMSEP for test data
sqrt((sum(y-ypred)^2)/10)

# 5. compare with the one from #4 : RMSEP for test data
RMSEP(gas1, newdata = gasTest)

# output of y and predicted y
out1<-cbind(y, ypred)
# data exporting
write.csv(out1,file="out1.csv", row.names = FALSE)


