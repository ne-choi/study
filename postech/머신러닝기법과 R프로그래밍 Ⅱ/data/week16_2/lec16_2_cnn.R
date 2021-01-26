# lec16_2_cnn.r
# Convolutional Neural Network
# Require mxnet package
# install.packages("https://github.com/jeremiedb/mxnet_winbin/raw/master/mxnet.zip",repos = NULL)
library(mxnet)

# If you have Error message "no package called XML or DiagrmmeR", then install
#install.packages("XML")
#install.packages("DiagrammeR")
#library(XML)
#library(DiagrammeR)

# set working directory
setwd("D:/tempstore/moocr/wk16")

# Load MNIST mn1
# 28*28, 1 channel images
mn1 <- read.csv("mini_mnist.csv")
set.seed(123,sample.kind="Rounding")
N<-nrow(mn1)
tr.idx<-sample(1:N, size=N*2/3, replace=FALSE)

# split train data and test data
train_data<-data.matrix(mn1[tr.idx,])
test_data<-data.matrix(mn1[-tr.idx,])

test<-t(test_data[,-1]/255)
features<-t(train_data[,-1]/255)
labels<-train_data[,1]

# data preprocession
features_array <- features
dim(features_array) <- c(28,28,1,ncol(features))
test_array <- test
dim(test_array) <- c(28,28,1,ncol(test))

ncol(features)
table(labels)

# Build cnn model
# first conv layers
my_input = mx.symbol.Variable('data')
conv1 = mx.symbol.Convolution(data=my_input, kernel=c(4,4), stride=c(2,2), pad=c(1,1), num.filter = 20, name='conv1')
relu1 = mx.symbol.Activation(data=conv1, act.type='relu', name='relu1')
mp1 = mx.symbol.Pooling(data=relu1, kernel=c(2,2), stride=c(2,2), pool.type='max', name='pool1')

# second conv layers
conv2 = mx.symbol.Convolution(data=mp1, kernel=c(3,3), stride=c(2,2), pad=c(1,1), num.filter = 40, name='conv2')
relu2 = mx.symbol.Activation(data=conv2, act.type='relu', name='relu2')
mp2 = mx.symbol.Pooling(data=relu2, kernel=c(2,2), stride=c(2,2), pool.type='max', name='pool2')

# fully connected
fc1 = mx.symbol.FullyConnected(data=mp2, num.hidden = 1000, name='fc1')
relu3 = mx.symbol.Activation(data=fc1, act.type='relu', name='relu3')
fc2 = mx.symbol.FullyConnected(data=relu3, num.hidden = 3, name='fc2')

# softmax
sm = mx.symbol.SoftmaxOutput(data=fc2, name='sm')

# training
mx.set.seed(100,sample.kind="Rounding")
device <- mx.cpu()
model <- mx.model.FeedForward.create(symbol=sm, 
                                     optimizer = "sgd",
                                     array.batch.size=30,
                                     num.round = 70, learning.rate=0.1,
                                     X=features_array, y=labels, ctx=device,
                                     eval.metric = mx.metric.accuracy,
                                     epoch.end.callback=mx.callback.log.train.metric(100))
graph.viz(model$symbol)

# test
predict_probs <- predict(model, test_array)
predicted_labels <- max.col(t(predict_probs)) - 1
table(test_data[, 1], predicted_labels)
sum(diag(table(test_data[, 1], predicted_labels)))/length(predicted_labels)

