# lec6_3.r
# Data exploration - graphics

# set working directory
setwd("D:/tempstore/moocr")

### student math grade data ####

stud<-read.csv("stud_math.csv")

head(stud)
dim(stud)
str(stud)

attach(stud)

# 1. histogram with color and title, legend
par(mfrow=c(2,2))
hist(G1, breaks = 10, col = "lightblue", main="Histogram of Grade 1" )
hist(G2, breaks = 10, col = "green", main="Histogram of Grade 2" )
hist(G3, breaks = 10, col = "coral", main="Histogram of Grade 3" )

# 2. boxplot
par(mfrow=c(1,2))
boxplot(G3~address, boxwex = 0.5, col = c("yellow", "coral"), main="G3 by (Urban, Rural)")
boxplot(G3~traveltime, boxwex = 0.5, col = c("red","orange","yellow","green"), main="G3 by traveltime")

# 3. xyplot : lattice package 
library(lattice)
xyplot(G3 ~ traveltime | sex , data = stud, pch=16, main = "G3 ~ traveltime | sex ")

# data (G3=0)
s1<-subset(stud, G3==0)
#ggplot(data=s1, aes(factor(s1$address)))+geom_bar(aes(fill=factor(s1$sex)), width=.4, colour="black")+ggtitle("G3=0")
#ggplot(data=s1, aes(factor(s1$internet)))+geom_bar(aes(fill=factor(s1$sex)), width=.4, colour="black")+ggtitle("G3=0")

# 4. scatterplot : ggplot2 package
library(ggplot2)
# scatterplot for G1 and G3 by sex
ggplot(stud, aes(x=G1, y=G3, color=sex, shape=sex)) + 
  geom_point(size=2)

# 5. bar chart : ggplot2 package
# bar chart for romantic by sex
ggplot(data=stud, aes(factor(romantic)))+geom_bar(aes(fill=factor(sex)), width=.4, colour="black")+ ggtitle("Romantic by sex")
# bar chart for internet use by (Urban, Rural)
ggplot(data=stud, aes(factor(internet)))+geom_bar(aes(fill=factor(address)), width=.4, colour="black")+ggtitle("Internet use by (Urban, Rural)")

# 6. pariwise plot
# new variable lists
vars1<-c("G1", "G2", "G3")
# pariwise plot
pairs (stud[vars1], main = "Student Math Data",
       pch = 21,bg = c ("red","green3")[unclass(stud$sex)])


