# lec5_2.r
# Grapic using ggplot2 

# set working directory
setwd("D:/tempstore/moocr")

# library
install.packages('ggplot2')
library(ggplot2)

# Read in R : autompg data
car<-read.csv("autompg.csv")
head(car)
str(car)

# subset of car : cyl (4,6,8)
car1<-subset(car, cyl==4 | cyl==6 | cyl==8)
attach(car1)

# 5-1 ggplot2 for scatterplot 
# Color and shape display by factor (categorical variable)
# check the variable type(integer, numeric, factor) and define it
str(car1)
car1$cyl<-as.factor(car1$cyl)

# Now, you can draw one of plot using ggplot
par(mfrow = c(1, 1))
ggplot(car1, aes(x=wt, y=disp, color=cyl, shape=cyl)) + 
  geom_point(size=3, alpha=0.6)

# mapping (continuous variable : mpg) on the scatterplot for wt and disp
ggplot(car1, aes(x=wt, y=disp, color=mpg, size=mpg)) + 
  geom_point(alpha=0.6)

# 5-2-1 : geom_bar : asethetic mapping (4,6,8 cyl)
p1<-ggplot(car1, aes(factor(cyl), fill=factor(cyl)))
p1
# barplot define
p1<-p1 + geom_bar(width=.5)
p1
# output by origin(1,2,3)
p1<-p1 + facet_grid(. ~ origin)
p1
# 5-2-1 : same plot with the above
ggplot(car1, aes(factor(cyl), fill=factor(cyl)))+ geom_bar(width=.5)+ facet_grid(. ~ origin)


# 5-2-2 : geom_bar : asethetic mapping (4,6,8 cyl)
p <- ggplot(data=car1, aes(factor(cyl)))
p + geom_bar(aes(fill=factor(origin)), colour="black")

# for Korean title
# 5-2-2 : geom_bar : asethetic mapping (4,6,8 cyl)
par(family="³ª´®°íµñ", cex=1.3)
p <- ggplot(data=car1, aes(factor(cyl)))
p<-p + geom_bar(aes(fill=factor(origin)), colour="black")
p<-p+ggtitle("ÀÚµ¿Â÷µ¥ÀÌÅÍ")
p


# 5-3 ggplots for scatterplot with regression line
# step1 : # Use hollow circles
ggplot(car1, aes(x=wt, y=mpg))+geom_point(shape=1)

# step2 :  # Add linear regression line 
# by default includes 95% confidence region
ggplot(car1, aes(x=wt, y=mpg)) + geom_point(shape=1) + geom_smooth(method=lm)  

# excluding 95% confidence region
ggplot(car1, aes(x=wt, y=mpg)) +
  geom_point(shape=1) +  geom_smooth(method=lm, se=FALSE) 

# step3: Add a loess smoothed fit curve with confidence region
# geom_smooth() use loess 
ggplot(car1, aes(x=wt, y=mpg)) + geom_point(shape=1) + geom_smooth(method="loess") 



