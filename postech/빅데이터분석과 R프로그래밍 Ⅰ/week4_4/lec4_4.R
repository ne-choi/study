# lec4_4.r : Graphics and layout

# set working directory
setwd("D:/tempstore/moocr")

# autompg data
car<-read.csv("autompg.csv")
head(car)

attach(car)

# 6. scatterplot of wt and mpg
par(mfrow=c(1,1))
plot(wt, mpg, main = "abline on the scatterplot")
# horizontal
abline(h = 20)
abline(h = 30)
# vertical
abline(v = 3000, col="blue")

# y = a + bx
abline(a = 40, b = -0.0076, col="red")
# linear model coefficients, lty (line type), lwd (line with)
# linear model (mpg=f(wp))
z <- lm(mpg ~ wt, data = car)
z
abline(z, lty = 2, lwd = 2, col="green")


# layout
# 2*2 mulitple plot
par(mfrow=c(2,2))
plot(wt, mpg)
plot(disp, mpg)
plot(hp, mpg)
plot(accler, mpg)

# 2*2 mulitple plot adjusting margin
par(mfrow=c(2,2), mar=c(4,4,2,2))
plot(wt, mpg)
plot(disp, mpg)
plot(hp, mpg)
plot(accler, mpg)

# top 1 plot, bottom 2 plot
(m <- matrix(c(1, 1, 2, 3), ncol = 2, byrow = T))
layout(mat = m)
plot(car$wt, car$mpg, main = "scatter plot of autompg", pch = 19, col = 4)
hist(car$wt)
hist(car$mpg)

# legend
# scatterplot coloring group variable (lec4_3.R)
par(mfrow=c(1,1), mar=c(4,4,4,4))
plot(wt, mpg,  col=as.integer(car$cyl))
labels = c("3cyl", "4cyl", "5cyl", "6cyl","8cyl")
legend(4000, 45, legend = labels, pch = 1, col =c(3,4,5,6,8), lty =1)
