# lec7_3.r 
# ANOVA

# set working directory
setwd("D:/tempstore/moocr")

### student math grade data ####
stud<-read.csv("stud_math.csv")

head(stud)
dim(stud)
str(stud)

attach(stud)

# boxplot in lec6_3.R 
par(mfrow=c(1,2))
boxplot(G3~address, boxwex = 0.5, col = c("yellow", "coral"), main="G3 by (Urban, Rural)")
boxplot(G3~traveltime, boxwex = 0.5, col = c("red","orange","yellow","green"), main="G3 by traveltime")

# 1. ANOVA by address 
a1 <- aov(G3~address)
summary(a1)
# tapply - give FUN value by address
round(tapply(G3, address, mean),2)

# post-hoc analysis after ANOVA
#posthoc <- TukeyHSD(x=a1, 'address', conf.level=0.95)
#plot(posthoc)

# 2. ANOVA by traveltime 
traveltime<-as.factor(traveltime)
a2 <- aov(G3~traveltime)
summary(a2)

# tapply - give FUN value by address
round(tapply(G3, traveltime, mean),2)

# should be foctor for Tukey's Honest Significant Difference test
TukeyHSD(a2, "traveltime", ordered=TRUE)
plot(TukeyHSD(a2, "traveltime"))

# 4. ANOVA by romantic 
a4 <- aov(G3~romantic)
summary(a4)
# tapply - give FUN value by address
round(tapply(G3,romantic, mean),2)
# boxplot
boxplot(G3~romantic, boxwex = 0.5, col = c("yellow", "coral"), main="G3 by romantic")
# posthoc analysis
TukeyHSD(a4, "romantic", ordered=TRUE)
plot(TukeyHSD(a4, "romantic"))


 
