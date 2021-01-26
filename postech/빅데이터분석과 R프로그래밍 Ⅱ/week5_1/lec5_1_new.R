#lec5_1_new.r 
# lattice, ggplot2 packages

# set working directory
setwd("D:/tempstore/moocr")

###################################
# install lattice
####################################

install.packages('lattice')
library(lattice)

# to see several plot using lattice pacakge
demo(lattice)

# to see lattice manual
help(lattice)

# ethanol data in lattice
help("ethanol")

ethanol<-read.csv("ethanol.csv")

# checking ethanol data
head(ethanol)
dim(ethanol)
str(ethanol)

table(ethanol$C)

# basic xyplot
xyplot(NOx ~ E , data = ethanol, main = "Single Panel by xyplot")

# multi panel graph
xyplot(NOx ~ E | C , data = ethanol, main = "NOx ~ E | C ")

# multi panel graph for subset
xyplot(NOx ~ E | C , data = ethanol, subset = C > 8,
       main = "NOx ~ E | C , data = ethanol, subset = C > 8")






