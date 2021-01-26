# lec5_3.r
# 3D-plot, Heatmap

# set working directory
setwd("D:/tempstore/moocr")

# install 3d scatterplot package
install.packages('scatterplot3d')
library(scatterplot3d)

# 5-3 3D scatterplot with data trees
data(trees)

par(mfrow = c(1, 1))
s3d <- scatterplot3d(trees, type="h", highlight.3d=TRUE,
                     angle=55, scale.y=0.7, pch=16, main="scatterplot3d - 5")

# to know about data "trees"
help(trees)
head(trees)
# export to csv file
write.csv(trees,file="trees.csv", row.names = FALSE)

# Now adding some points to the "scatterplot3d"
#s3d$points3d(seq(10,20,2), seq(85,60,-5), seq(60,10,-10),col="blue", type="h", pch=16)

# Now adding a regression plane to the "scatterplot3d"
attach(trees)
my.lm <- lm(Volume ~ Girth + Height)
s3d$plane3d(my.lm, lty.box = "solid")


#############
# heatmap   #
#############

# heatmap 1 using autompg data
car<-read.csv("autompg.csv")
#head(car)
#dim(car)
attach(car)

par(mfrow=c(1, 1))
cor.x<-cor(car[,1:6])
heatmap(cor.x, symm=TRUE)

# heatmap 2 using USArrests data

# Crime rate by US State (1973)
# Arrests per 100,000 residents for assault, murder, and rape 
# in each of the 50 US states in 1973

help(USArrests)
head(USArrests)

cor(USArrests)
round(cor(USArrests), 2)

# subset excluding 3th variable UrbanPop
# matrix format for heatmap
x  <- as.matrix(USArrests[, -3])
result <- heatmap(x, scale="column", Colv=NA, cexCol=1,
                  main="Violent Crime Rates by US State (1973)")

row.names(USArrests)[result$rowInd[1:10]]
row.names(USArrests)[result$rowInd[35:50]]
