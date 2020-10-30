#1. 주행속도와 제동거리 사이의 회귀모델 구하기

head(cars)
plot(dist~speed, data=cars)             # 산점도를 통해 선형 관계 확인

model <- lm(dist~speed, cars)           # 회귀모델 구하기
model

abline(model)                           # 회귀선을 산점도 위에 표시
coef(model)[1]                          # b 값 출력
coef(model)[2]                          # W 값 출력

#2 주행속도에 따른 제동거리 구하기

b <- coef(model)[1]
W <- coef(model)[2]

speed <- 30                                 # 주행속도
dist <- W*speed + b                 
dist                                        # 제동거리

speed <- 35                                 # 주행속도
dist <- W*speed + b                 
dist                                        # 제동거리

speed <- 40                                 # 주행속도
dist <- W*speed + b                 
dist                                        # 제동거리



#3 예상 제동거리, 실제 제동거리, 오차 구하기
speed <- cars[,1]                           # 주행속도
pred <- W * speed + b
pred                                        # 예상 제동거리 

compare <- data.frame(pred, cars[,2], pred-cars[,2])
colnames(compare) <- c('예상','실제','오차')
head(compare)

#4-7 다중선형 회귀 분석
library(car)
head(Prestige)

newdata <- Prestige[,c(1:4)]                 # 회귀식 작성을 위한 데이터 준비
plot(newdata, pch=16, col="blue",            # 산점도를 통해 변수 간 관계 확인
     main="Matrix Scatterplot")

mod1 <- lm(income ~ education + prestige +   # 회귀식 도출
             women, data=newdata)
summary(mod1)

# 4-8 다중 선형모델에서의 변수 선택
library(MASS)                       # stepAIC() 함수 제공
newdata2 <- Prestige[,c(1:5)]       # 모델 구축에 사용할 데이터셋 생성 
head(newdata2)                      
mod2 <- lm(income ~ education + prestige + 
             women + census, data= newdata2)
mod3 <- stepAIC(mod2)               # 변수 선택 진행
mod3                                # 변수 선택 후 결과 확인
summary(mod3)       

#4-9 로지스틱 회귀
iris.new <- iris
iris.new$Species <- as.integer(iris.new$Species)    # 범주형 자료를 정수로 변환
head(iris.new)
mod.iris <- glm(Species ~., data= iris.new)         # 로지스틱 회귀모델 도출
summary(mod.iris)      

#4-10 로지스틱 회귀모델을 이용한 예측
# 예측 대상 데이터 생성(데이터프레임)
unknown <- data.frame(rbind(c(5.1, 3.5, 1.4, 0.2)))
names(unknown) <- names(iris)[1:4]
unknown                            # 예측 대상 데이터

pred <- predict(mod.iris, unknown) # 품종 예측 
pred                               # 예측 결과 출력 
round(pred,0)                      # 예측 결과 출력(소수 첫째 자리에서 반올림) 

# 실제 품종명 알아보기
pred <- round(pred,0)
pred
levels(iris$Species)
levels(iris$Species)[pred]           

#4-11 다수의 데이터 예측
test <- iris[,1:4]                     # 예측 대상 데이터 준비
pred <- predict(mod.iris, test)        # 모델을 이용한 예측
pred <- round(pred,0)                   
pred                                   # 예측 결과 출력
answer <- as.integer(iris$Species)     # 실제 품종 정보
pred == answer                         # 예측 품종과 실제 품종이 같은지 비교
acc <- mean(pred == answer)            # 예측 정확도 계산
acc


#4-1 KNN
library(class)

# 훈련용 데이터와 테스트용 데이터 준비
tr.idx <- c(1:25,51:75, 101:125)      # 훈련용 데이터의 인덱스
ds.tr <- iris[tr.idx, 1:4]            # 훈련용 데이터셋  
ds.ts <- iris[-tr.idx, 1:4]           # 테스트용 데이터셋  
cl.tr <- factor(iris[tr.idx, 5])      # 훈련용 데이터셋의 그룹(품종) 정보
cl.ts <- factor(iris[-tr.idx, 5])     # 테스트용 데이터셋의 그룹(품종) 정보

pred <- knn(ds.tr, ds.ts, cl.tr, k=3, prob=TRUE) 
pred

acc <- mean(pred==cl.ts)              # 예측 정확도
acc

table(pred,cl.ts)                     # 예측값과 실제값 비교 통계

#4-2 k-means 클러스터링
mydata <- iris[,1:4]    # 데이터 준비

fit <- kmeans(x=mydata, centers=3)
fit
fit$cluster  # 각 데이터에 대한 군집 번호
fit$centers  # 각 군집의 중심점 좌표

# 차원 축소 후 군집 시각화
library(cluster) 
clusplot(mydata, fit$cluster, color=TRUE, shade=TRUE, 
         labels=2, lines=0)

# 데이터에서 두 번째 군집의 데이터만 추출
subset(mydata, fit$cluster==2)

#4-3 k-fold 교차검증
install.packages("cvTools")
library(cvTools)                       # cvFolds() 함수 지원

k = 10                                 # 10-fold
folds <- cvFolds(nrow(iris), K=k)      # 폴드 생성

acc <- c()                             # 폴드별 예측 정확도 저장용 벡터
for (i in 1:k) {
  ts.idx <- folds$which == i           # 테스트용 데이터의 인덱스
  ds.tr <- iris[-ts.idx, 1:4]          # 훈련용 데이터셋  
  ds.ts <- iris[ts.idx, 1:4]           # 테스트용 데이터셋  
  cl.tr <- factor(iris[-ts.idx, 5])    # 훈련용 데이터셋의 그룹(품종) 정보
  cl.ts <- factor(iris[ts.idx, 5])     # 테스트용 데이터셋의 그룹(품종) 정보
  
  pred <- knn(ds.tr, ds.ts, cl.tr, k = 5) 
  acc[i] <- mean(pred==cl.ts)          # 예측 정확도
}
acc                                    # 폴드별 예측 정확도
mean(acc)                              # 폴드평균 예측 정확도


# 4-12 결정 트리 함수의 사용터 #
iris

library(rpart)
r = rpart(Species~., data = iris)
printcp(r)  # 학습된 결정 트리에 대한 자세한 정보


par(mfrow = c(1, 1), xpd = NA)
plot(r)
text(r, use.n = TRUE)


p = predict(r, iris, type = 'class')
table(p, iris$Species)


r_prior = rpart(Species~., data = iris, parms = list(prior = c(0.1, 0.1, 0.8)))
plot(r_prior)
text(r_prior, use.n = TRUE)

# 예측
newd = data.frame(Sepal.Length = c(5.11, 7.01, 6.32), Sepal.Width = c(3.51, 3.2, 3.31), Petal.Length = c(1.4, 4.71, 6.02), Petal.Width = c(0.19, 1.4, 2.49))

# 출력
print(newd) 

predict(r, newdata = newd)



# 4-13 결정 트리의 해석 #
summary(r)


library(rpart.plot)
rpart.plot(r)
rpart.plot(r, type = 4)

