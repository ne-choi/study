# lec14_2_ass.r
# Association Rule
# Market basket analysis

# set working directory
setwd("D:/tempstore/moocr/wk14")

# association rule analysis package
# install.packages("arules")
library(arules)

#association rule analysis
data("Groceries")

summary(Groceries)

# Bar chart for item with support>=5%
itemFrequencyPlot(Groceries,supp=0.05,main="item for support>=5%", col="green", cex=0.8)

# Bar chart for the top support 20 items
itemFrequencyPlot(Groceries,topN=20,main="support top 20 items", col="coral", cex=0.8)

# Association rule with support>5%, confidence>20% in minimum length 2
Grocery_rule<-apriori(data=Groceries,
                      parameter = list(support=0.05,
                                       confidence = 0.20,
                                       minlen = 2))
Grocery_rule

#analyzing result
summary(Grocery_rule)
inspect(Grocery_rule)

# sorting by Lift
inspect(sort(Grocery_rule,by="lift"))
# inspect(sort(Grocery_rule, by="support"))

# searching association for interesting items
rule_interest<-subset(Grocery_rule, items %in% c("yogurt","whole milk"))
inspect(rule_interest)

rule_interest3<-subset(Grocery_rule, items %pin% c("yogurt"))
inspect(rule_interest3)

rule_interest5<-subset(Grocery_rule, items %pin% c("other") & confidence>0.25)
inspect(rule_interest5)




# save as dataframe
Grocery_rule_df<-as(Grocery_rule,"data.frame")
Grocery_rule_df

#saving results as csv file
write(Grocery_rule, file="Grocery_rule.csv",
      sep=",",
      quote=TRUE,
      row.names=FALSE)



