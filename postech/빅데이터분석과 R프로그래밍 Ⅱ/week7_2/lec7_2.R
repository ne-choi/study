# lec7_2.r 

# paired t-test for two sample means

# set working directory
setwd("D:/tempstore/moocr")

## example 1: blood pressure data
bp<-read.csv("bp.csv") 
attach(bp)

# paired t-test (two-sided)
t.test(bp_pre, bp_post, mu=0,  paired=T)

# paired t-test (one-sided)
t.test(bp_pre, bp_post, mu=0, alternative="greater", paired=T)

# paired t-test (two-sided, 90% confidence interval)
t.test(bp_pre, bp_post, mu=0, alternative="two.sided", paired=T, conf.level=.90)

## example 2: Very Low-calroie diet 
diet<-read.csv("weight.csv") 
attach(diet)

# paired t-test (default=two-sided, 95% confidence interval)
t.test(wt_pre, wt_post, mu=0,  paired=T)

# to get 90% confidence interval in paired t-test
t.test(wt_pre, wt_post, mu=0, alternative="two.sided", paired=T, conf.level=.90)








