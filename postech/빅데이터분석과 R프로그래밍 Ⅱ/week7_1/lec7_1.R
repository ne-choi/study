# lec7_1.r 
# t-test for two sample means

# set working directory
setwd("D:/tempstore/moocr")

### student math grade data ####
stud<-read.csv("stud_math.csv",stringsAsFactors = TRUE)

head(stud)
dim(stud)
str(stud)

attach(stud)

# 1. single t-test : to test whether or not mean of G3 is 10
t.test(G3, mu=10)

# 2. two sample t-test
## example 1 
# to test whether or not mean of G3 is same between Urban and Rural 
t.test(G3~address, data=stud)
boxplot(G3~address, boxwex = 0.5, col = c("yellow", "coral"))

# alternative H : mu(Rural)< mu(Urban)
t.test(G3~address, data=stud, alternative = c("less"))

help(t.test)

## example 2 
# to test whether or not mean of G3 is equal for activities 
t.test(G3~activities, data=stud)
boxplot(G3~activities, boxwex = 0.5, col = c("blue", "red"))
t.test(G3~internet, data=stud)

# 3. Non-parametric method
# Wilcoxon signed-rank test

# wilcox.test(G3, mu=10)
wilcox.test(G3~address)
help(wilcox.test)

