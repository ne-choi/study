# lec13_2_clus.R
# Clustering
# Hierarchical Clustering
# Linkage method, Dendrogram

# needs "lattice", "DAAG" package for loading dataset
# install.packages("lattice")
#install.packages("DAAG")
library(lattice)
#library(DAAG)

# load data in DAAG package
# the wages of Lancashire cotton factory workers in 1833
#help("wages1833")
#head(wages1833,n=10)

# set working directory
setwd("D:/tempstore/moocr/wk13")

# read csv file
wages1833<-read.csv(file="wages1833.csv")
head(wages1833)

# remove observations with the missing values
dat1<-wages1833
dat1<-na.omit(dat1)
str(dat1)
#data<-na.omit("wages1833")

# calculate distance between each nodes
dist_data<-dist(dat1)

# prepare hierarchical cluster
# complete linkage method
hc_a <- hclust(dist_data, method = "complete")
plot(hc_a, hang = -1, cex=0.7, main = "complete")

# average linkage method
# check how different from complete method
hc_c <- hclust(dist_data, method = "average")
plot(hc_c, hang = -1, cex=0.7, main = "average")

# Ward's method
hc_c <- hclust(dist_data, method = "ward.D2")
plot(hc_c, hang = -1, cex=0.7, main = "Ward's method")

