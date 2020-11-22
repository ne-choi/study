# lec4_2.r : Basic Graphics II

# set working directory
setwd("D:/tempstore/moocr")

brain<-read.csv(file="brain2210.csv")

head(brain)
dim(brain)

attach(brain)

# 2. boxplot
par(mfrow=c(1,2))
# 2-1 boxplot for all data
boxplot(brain$wt, col=c("coral"))
# 2-2 boxplot by group variable (female, male)
boxplot(brain$wt~brain$sex, col = c("green", "orange"))


# 2-3 horizontal boxplot
par(mfrow=c(1,1))
boxplot(brain$wt~brain$sex, boxwex=0.5, horizontal=TRUE, col = c("grey", "red"))

# 2-4 box width boxwex (width of box)
par(mfrow=c(1,2))
boxplot(brain$wt, boxwex = 0.25, col=c("coral"),  main="Boxplot for all data")
boxplot(brain$wt, boxwex = 0.5, col=c("coral"), main="Boxplot for all data")

# 2-5 add text (n) over a boxplot
par(mfrow=c(1,2))
a<-boxplot(brain$wt~brain$sex, col = c("green", "orange"))
text(c(1:nlevels(brain$sex)), a$stats[nrow(a$stats),]+30, paste("n = ",table(brain$sex),sep=""))

# example : add text (standard deviation) over  a boxplot
brainf<-subset(brain,brain$sex=='f')
brainm<-subset(brain,brain$sex=='m')

sdout<-cbind(sd(brainf$wt),sd(brainm$wt))
b<-boxplot(brain$wt~brain$sex, col = c("green", "orange"))
text(c(1:nlevels(brain$sex)), b$stats[nrow(b$stats),]+30, cex=0.8, paste("sd = ",round(sdout, 2),sep="")  )

# use autompg data (lec3_3.R)
car<-read.csv("autompg.csv")
head(car)

attach(car)

# 3. bar plot with cyliner count (lec3_3.R)
# par(mfrow=c(1,1))
table(car$cyl)
freq_cyl<-table(cyl)
names(freq_cyl) <- c ("3cyl", "4cyl", "5cyl", "6cyl",
                      "8cyl")
barplot(freq_cyl, col = c("lightblue", "mistyrose", "lightcyan",
                          "lavender", "cornsilk"))
# 4. pie chart
# You can also custom the labels:
freq_cyl<-table(cyl)
names(freq_cyl) <- c ("3cyl", "4cyl", "5cyl", "6cyl", "8cyl")
# 4-1 pie chart
pie(freq_cyl)

# 4-2 pie chart clockwise
pie(freq_cyl, labels = c("3cyl", "4cyl", "5cyl", "6cyl","8cyl"),
    clockwise = TRUE)

# 4-3 pie chart of subset
# subset with cylinder (4,6,8) - refresh creating subset data lec3_2.R
car1<-subset(car, cyl==4 | cyl==6 | cyl==8)
table(car1$cyl)

freq_cyl1<-table(car1$cyl)
pie(freq_cyl1, labels = c("4cyl","6cyl","8cyl"),
    clockwise = TRUE)





