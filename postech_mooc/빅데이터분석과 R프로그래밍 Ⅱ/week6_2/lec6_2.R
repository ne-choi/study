# lec6_2.r
# Data exploration : Numerical summary statistics

# set working directory
setwd("D:/tempstore/moocr")

### student math grade data ####

stud<-read.csv("stud_math.csv")

head(stud)
dim(stud)
str(stud)

attach(stud)

# 1-1 Numeriacl analytics
summary(stud)
mean(G3)
sd(G3)
sqrt(var(G3))

# creating interested variable list
vars<-c("G1", "G2", "G3")
head(stud[vars])
summary(stud[vars])

# sapply function
sapply(stud[vars], mean)

# descriptive statistics using "psych" package
install.packages("psych")
library(psych)
# require "psych" for "describe" function
describe(stud[vars])

# categorical data
table(health)

health_freq<-table(health)
names(health_freq) <- c ("very bad", "bad", "average", "good",
                      "very good")
barplot(health_freq, col=3)

# 2*2 contingency table
table(health,studytime)

##################

#chisq.test(health,studytime)

