# lec7_4.r
# two-way ANOVA

# set working directory
setwd("D:/tempstore/moocr")

# data(chol_ex.csv) : A study was performed to test the efficiency of a new drug developed 
# to increase high-density lipoprotein (HDL) cholesterol levels in patients. 
# 18 volunteers were split into 3 groups (Placebo/5 mg/10 mg) and 
# the difference in HDL levels before and after the treatment was measured. 
# The 18 volunteers were also categorized into two age groups (18-39/ กร40)

dat<-read.csv(file="chol_ex.csv")
head(dat)
dim(dat)
str(dat)
attach(dat)

# two-way ANOVA, 
a6 <- aov(value ~ drug + age)
summary(a6)

# two-way ANOVA with interaction
a7 <- aov(value ~ drug + age+ drug*age)
summary(a7)

# post-hoc analysis Tukey
posthoc <- TukeyHSD(a6, 'drug', conf.level=0.95)
posthoc

# two-way ANOVA
par(mfrow=c(1,2))
boxplot(value ~ drug, boxwex = 0.7, main="HDL by drug dose", col = c("yellow","orange", "green"))
boxplot(value ~ age, boxwex = 0.5, main="HDL by Age", col = c("blue", "coral"))

# tapply - give FUN value by drug
round(tapply(value, drug, mean),2)

# tapply - give FUN value by age
round(tapply(value, age, mean),2)

# interaction plot
par(mfrow=c(1,2))
interaction.plot(drug, age, value)
interaction.plot(age, drug, value)

# Create an interaction plot for the HDL data
par(mfrow=c(1,2))
interaction.plot(dat$drug, dat$age, dat$value)
interaction.plot(dat$age, dat$drug, dat$value)

# two-way ANOVA model with interaction
results = lm(value ~ drug + age + drug*age, data=dat)
anova(results)
