# lec16_1_nn.r
# Neural network

# require mxnet
install.packages("https://github.com/jeremiedb/mxnet_winbin/raw/master/mxnet.zip",repos = NULL)
library(mxnet)

# If you have Error message "no package called XML or DiagrmmeR", then install
install.packages("XML")
install.packages("DiagrammeR")
#library(XML)
#library(DiagrammeR)

#devtools::install_github("rich-iannone/DiagrammeR")

#install.packages('devtools')
#library(devtools)

# set working directory
setwd("D:/tempstore/moocr/wk16")

# read csv file
iris<-read.csv("iris.csv")
attach(iris)
# change to numeric from character variable : Species
iris[,5] = as.numeric(iris[,5])-1
table(Species)
# check the data
head(iris, n=10)

# split train & test dataset
# training (n=100)/ test data(n=50) 
set.seed(1000,sample.kind="Rounding")
N<-nrow(iris)
tr.idx<-sample(1:N, size=N*2/3, replace=FALSE)

# split train data and test data
train<-data.matrix(iris[tr.idx,])
test<-data.matrix(iris[-tr.idx,])

# feature & Labels
train_feature<-train[,-5]
trainLabels<-train[,5]
test_feature<-test[,-5]
testLabels <-test[,5]

# Build nn model
# first layers
require(mxnet)
my_input = mx.symbol.Variable('data')
fc1 = mx.symbol.FullyConnected(data=my_input, num.hidden = 200, name='fc1')
relu1 = mx.symbol.Activation(data=fc1, act.type='relu', name='relu1')

# second layers
fc2 = mx.symbol.FullyConnected(data=relu1, num.hidden = 100, name='fc2')
relu2 = mx.symbol.Activation(data=fc2, act.type='relu', name='relu2')

# third layers
fc3 = mx.symbol.FullyConnected(data=relu2, num.hidden = 3, name='fc3')

# softmax
softmax = mx.symbol.SoftmaxOutput(data=fc3, name='sm')

# training
mx.set.seed(123, sample.kind="Rounding")
device <- mx.cpu()
model <- mx.model.FeedForward.create(softmax,
                                     optimizer = "sgd",
                                     array.batch.size=25,
                                     num.round = 500, learning.rate=0.1,
                                     X=train_feature, y=trainLabels, ctx=device,
                                     eval.metric = mx.metric.accuracy,
                                     array.layout = "rowmajor",
                                     epoch.end.callback=mx.callback.log.train.metric(100))
graph.viz(model$symbol)

# testing
predict_probs <- predict(model, test_feature, array.layout = "rowmajor")
predicted_labels <- max.col(t(predict_probs)) - 1
table(testLabels, predicted_labels)
sum(diag(table(testLabels, predicted_labels)))/length(predicted_labels)
