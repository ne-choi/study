# lec3_3.r
# Data handling
# Data analysis with autompg.csv

# data manipulation package
# select, filter, group by, summarise in dplyr package 
install.packages("dplyr")
library(dplyr)

# set working directory
# change working directory 
setwd("D:/tempstore/moocr")

# Read txt file with variable name
# http://archive.ics.uci.edu/ml/datasets/Auto+MPG

# 1. Data reading in R
car<-read.csv(file="autompg.csv")
attach(car)

# Change to tbl_df class
#car<-tbl_df(car)

# 2. data checking 
head(car)
dim(car)
str(car)

# 3. Summary
summary(car)

# Basic statistics

# 4. frequency
table(origin)
table(year)

# 5. mean and standard deviation
mean(mpg)
mean(hp)
mean(wt)



