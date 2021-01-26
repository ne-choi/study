# lec4_3.r : Basic Graphics III

# set working directory
setwd("D:/tempstore/moocr")

# autompg data
car<-read.csv("autompg.csv")
head(car)
str(car)

attach(car)

# 5 scatterplot with two variable (x, y) 

# 5-1 simple plot from lec1.r
par(mfrow=c(1,1))
x2<-c(1,4,9)
y2<-2+x2
plot(x2, y2)

# 5-2 another simple plot
par(mfrow=c(2,1))
x<-seq(0, 2*pi, by=0.001)
y1<-sin(x)
plot(x,y1, main="sin curve (0:2*pi)")

y2<-cos(x)
plot(x,y2,main="cosine curve (0:2*pi)" )

# scatterplot of autompg data (lec3_3.R)
# 5-3 autompg data (relationship between wt and mpg)
par(mfrow=c(2,1))
plot(wt, mpg)
plot(hp, mpg)

# 5-4 scatterplot coloring group variable
par(mfrow=c(2,1), mar=c(4,4,2,2))
plot(disp, mpg, col=as.integer(car$cyl))
plot(wt, mpg,  col=as.integer(car$cyl))

# 5-5 Conditioning plot : seperating scatterplot by factor(group) variable
car1<-subset(car, cyl==4 | cyl==6 | cyl==8)
coplot(car1$mpg ~ car1$disp | as.factor(car1$cyl), data = car1,
       panel = panel.smooth, rows = 1)

# 5-6 cross-tab Plot to see how explanatory variables are related each othe
pairs(car1[,1:6], col=as.integer(car1$cyl), main = "autompg")

# 5-7 scatterplot with best fit lines
par(mfrow=c(1,1))
plot(wt, mpg,  col=as.integer(car$cyl), pch=19)
# best fit linear line
abline(lm(mpg~wt), col="red", lwd=2, lty=1)

# lowess : smoothed line, nonparmetric fit line (locally weighted polynomial regression)
lines(lowess(wt, mpg), col="red", lwd=3, lty=2)
help(lowess)


