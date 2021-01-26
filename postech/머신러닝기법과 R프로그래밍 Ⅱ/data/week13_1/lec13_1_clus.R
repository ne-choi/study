# lec13_1_clus.R
# Clustering
# Distance measure

# similarity measures - distance
m1 <- matrix(
  c(150, 50, 130, 55, 80, 80, 100, 85, 95, 91),
  nrow = 5,
  ncol = 2,
  byrow = TRUE)
# m1 is a matrix
m1
is.data.frame(m1)
# m1 is defined as dataframe
m1<-as.data.frame(m1)

# 1. Euclidean distance
D1 <- dist(m1) 
D1

help("dist")

# 2. Minkowski distance
D2<- dist(m1, method="minkowski", p=3) 
D2

# 3. correlation coefficient
m2 <- matrix(
  c(20, 6, 14, 30, 7, 15, 46, 4, 2),
  nrow = 3,
  ncol = 3,
  byrow = TRUE)
m2

# correlation between Obs1~Obs2
cor(m2[1,],m2[2,]) 
# correlation between Obs1~Obs3
cor(m2[1,],m2[3,])


