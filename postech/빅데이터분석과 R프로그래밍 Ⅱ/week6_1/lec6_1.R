# lec6_1.r
# Data management : merge, sorting, subset 

# set working directory
setwd("D:/tempstore/moocr")

# practice data
dat1<-read.csv(file="data1.csv")
dat2<-read.csv(file="data2.csv")

# data merging
dat12<-merge(dat1, dat2, by="ID")

# add more data (combine in a row)
dat3<-read.csv(file="data3.csv")
dat123<-rbind(dat12, dat3)
dat123

# export to csv file
# write.csv(dat12,file="data12.csv", row.names = FALSE)

# data sorting
dats1<-dat12[order(dat12$age),]
dats1
dats2<-dat12[order(dat12$gender, dat12$age), ]
dats2

# data subset (selecting data)
#newdat<-dat12[which(dat12$gender=="F" & dat12$age>15),]
newdat<-subset(dat12, dat12$gender=="F" & dat12$age>15)
newdat

# excluding variables
exdat<-dat12[!names(dat12) %in% c("age","gender")]
exdat


