# lec6_4.r
# Normality test, confidence interval

# set working directory
setwd("D:/tempstore/moocr")

### student math grade data ####

stud<-read.csv("stud_math.csv")

head(stud)
dim(stud)
str(stud)

attach(stud)

# 1-2 Testing for normality
# multiple plot (2 by 2)
par(mfrow=c(2,2))
#Quantile plot
qqnorm(G1)
qqline(G1, col = 2, cex=7)

qqnorm(G2)
qqline(G2, col = 2, cex=7)

qqnorm(G3)
qqline(G3, col = 2, cex=7)

#Shapiro-Wilks test
shapiro.test(G3)

#ks.test(G3, "pgamma",3,2)

#Anderson-Darling test require installing package "nortest"
install.packages('nortest')
library(nortest)
ad.test(G3)

# data simulation
# Simulation examples
runif(5,min=1,max=5)
rnorm(5,mean=5,sd=1)
rgamma(5,shape=3,rate=2)
rbinom(5,size=100,prob=.2)

# from normal distribution
x<-rnorm(1000)
plot(density(x),xlim=c(-5,10))

# confidence interval of normal distribution
nreps <- 100
ll <- numeric(nreps)
ul <- numeric(nreps)
n <- 100
mu <- 500
sigma <- 100
for(i in 1:nreps) {
  set.seed(i)
  x <- rnorm(n, mu, sigma)
  ll[i] <- mean(x) - qnorm(0.975)*sqrt(sigma^2/n)
  ul[i] <- mean(x) + qnorm(0.975)*sqrt(sigma^2/n)
}

# Draw 95% confidence interval
par(mfrow=c(1,1))
plot(1:100, ylim=c(min(ll), max(ul)),
     ylab="95% Confidence Interval", xlab="iterations")

for(i in 1:100) lines(c(i, i), c(ll[i], ul[i]))
abline(h=mu, col="red", lty=2, lwd=3)


