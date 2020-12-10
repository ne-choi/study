#lec13_3_clus.R
# Clustering
# Non-hierarchical Clustering

# install package & set library
# install.packages("DAAG")
#library(DAAG)

# set working directory
setwd("D:/tempstore/moocr/wk13")

# read csv file
wages1833<-read.csv(file="wages1833.csv")
head(wages1833)

# preprocessing
dat1<-wages1833
dat1<-na.omit(dat1)
head(dat1, n=5)

# to choose the optimal k
install.packages("factoextra")
library(factoextra)
fviz_nbclust(dat1, kmeans, method = "wss")

fviz_nbclust(dat1, kmeans, method = "gap_stat")

# compute kmeans
set.seed(123,sample.kind="Rounding")
km <- kmeans(dat1, 3, nstart = 25)
km

km <- kmeans(dat1, 3, nstart=10)
km

km <- kmeans(dat1, 3)
km

# visualize
fviz_cluster(km, data = dat1, 
             ellipse.type="convex", 
             repel = TRUE)

# compute PAM
library("cluster")
pam_out <- pam(dat1, 3)
pam_out

# freq of each cluster
table(pam_out$clustering)

# visualize
fviz_cluster(pam_out, data = dat1,
             ellipse.type="convex", 
             repel = TRUE)


