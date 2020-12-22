# lec16_3_tm.R
# Install package NLP, tm, wordcloud

# set working directory
setwd("D:/tempstore/moocr")

# Natural language processing
install.packages('NLP')
# text mining package
install.packages('tm')
# visualizing
install.packages('wordcloud')
# color displaying
install.packages('RColorBrewer')

# set library (set in order)
library(NLP)
library(tm)
library(RColorBrewer)
library(wordcloud)

# 20 new articles from Reuter- 21578 data set
data(crude)
# To know abour crude data
help(crude)

# information about the first file in crude data
str(crude[[1]])
content(crude[[1]])
meta(crude[[1]])
#lapply(crude, content)

# inspect function
inspect(crude[1:3]) 
inspect(crude[[1]]) 

# 1. remove punctuation in documnet
crude<-tm_map(crude, removePunctuation)
content(crude[[1]])

# 2. remove numbers
crude<-tm_map(crude, removeNumbers)
content(crude[[1]])

# 3. remove stopwords
crude<-tm_map(crude, function(x) removeWords(x,stopwords()))
content(crude[[1]])

stopwords()

# 4. contruct term-doucument matrix 
tdm<-TermDocumentMatrix(crude)
inspect(tdm)

#inspect(tdm[ , c("127", "144", "191", "194")])
#inspect(tdm[c("price", "prices", "texas"), c("127", "144", "191", "194")])

# 5. read tdm as a matrix
m<-as.matrix(tdm)
head(m)
# 6. sorting in high frequency to low frequency 
v<-sort(rowSums(m), decreasing=TRUE)
v[1:10]
# 7. match with freq and word names
d<-data.frame(word=names(v), freq=v)
head(d)
d[957:962, ]

# 7. plot a word cloud
# wordcloud(d$word, d$freq)
help(wordcloud)

# 7-1. Now lets try it with frequent words plotted first
# par(mfrow = c(1, 1),mar=c(1,2,3,1))
wordcloud(d$word,d$freq,c(8,.3),2,,FALSE,.1)

# 7-2. color plot with frequent words plotted first
pal <- brewer.pal(9,"BuGn")
pal <- pal[-(1:4)]
wordcloud(d$word,d$freq,c(8,.3),2,,FALSE,,.15,pal)

