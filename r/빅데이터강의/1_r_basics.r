# 2020.10.16 교육 1

# 매트릭스
x <- 1:4
y <- 5:8
z <- matrix(1:20, nrow = 4, ncol = 5)
m1 <- cbind(x, y)
m1

m2 <- rbind(x, y)
m2

m3 <- rbind(m2, x)
m3

m4 <- cbind(z, x)
m4

z <- matrix(1:20, nrow = 4, ncol = 5) #열부터 채워짐
z

# []는 index를 나타냄
z[2, 3] #2행의 3열
z[2, ] #2행의 모두

z[2, 1:3]

z[1, c(1, 2, 4)]

z[, c(1, 4)]


# array: 배열/행렬
# cf) 매트릭스를 행렬이라고 표현하는 사람도 많음 

y <- c(1, 2, 3, 4, 5, 6)
array(y, dim = c(2, 2, 3)) #2*2행렬 3개
# array 숫자를 다 쓰면 처음부터 다시 사용

x <- array(1:24, c(3, 2, 4))
x


# 데이터프레임
# 다중형 데이터 세트: data.frame(변수명1, 변수명2, ..., 변수명n)

# data.frame 구성을 위한 변수 생성
id <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
sex <- c("F", "M", "F", "M", "M", "F", "F", "F", "M", "F")
age <- c(50, 40, 28, 50, 27, 23, 56, 47, 20, 38)
area <- c("서울", "경기", "제주", "서울", "서울", "서울", "경기", "서울", "인천", "경기")

dataframe_ex <- data.frame(id, sex, age, area)

dataframe_ex


# 리스트: 다중형, 1차원 데이터
list1 <- list(c(1, 2, 3), "Hello")
list1


# 함수: 반복 작업을 수행하는 코드를 모아 이름을 붙인 것


# 데이터 실습_YGMN_CNSMP
setwd("~/Bigdata/extra/data")

df_young <- read.csv("TC_GS_YGMN_CNSMP.csv", fileEncoding = "UTF-8")

head(df_young, 81)
dim(df_young)
ncol(df_young)     
colnames(df_young)

# 서점 데이터
df <- read.csv("TC_GS_AREA_BOOKST.csv", fileEncoding = "UTF-8")

str(df)
head(df)
head(df$주소)

# 아래 것만 할 때, 객체가 안 찾아지면 "객체 = c()" 하자
addr_split = c()

for(i in c(1:length(df$주소))){
  addr_split[i] <- strsplit(df$주소[i], split= " ")[[1]][2]
}

library(dplyr)

addr_count <- addr_split %>%
  table() %>% # 집계
  data.frame()

addr_count

install.packages("treemap")
library(treemap)

treemap(addr_count, index = ".", vSize = "Freq", title = "경기도 시별 서점 분포")


# 새로운 데이터 사용_경기도 시도별 인구
# 시만 찾아야 하는데 수원시 권선구 같은 값이 있어서 전처리하기
df_person <- read.csv("TC_GS_CTY_POPLTN.csv", fileEncoding = "UTF-8")

str(df_person)
summary(df_person)

city_df <- df_person %>%
  group_by(시군구명) %>% #시 이름으로 그룹화
  summarise(m_pop = mean(유동인구지수.현황.)) #시별 평균 m_pop 변수에 저장

str(city_df)

library(ggplot2)

ggplot(data = city_df, aes(x = 시군구명, y = m_pop, fill = rainbow(length(시군구명)))) +
  geom_bar(stat = "identity") +
  ggtitle("시별 유동인구 현황")

ggplot(data = city_df, aes(x = 시군구명, y = m_pop, fill = rainbow(length(시군구명)))) +
  geom_bar(stat = "identity") +
  coord_flip() +
  ggtitle("시별 유동인구 현황")

ggplot(data = city_df, aes(x = reorder(시군구명, m_pop), y = m_pop, fill = rainbow(length(시군구명)))) +
  geom_bar(stat = "dentity") +
  coord_flip() +
  ggtitle("시별 유동인구 현황") +
  labs(x = "시", y = "인원") +
  theme(plot.title = element_text(size = 17, face = "bold, color = "blue"", hjust = 0.5))


# 남녀 소비패턴 데이터
df_cmp <- read.csv("TC_GS_CTY_POPLTN.csv", fileEncoding = "UTF-8")

summary(df_cmp)

df_cmp = c()

for(i in c(1:length(df_cmp$시군구명))){
  df_cmp$시군구명[i] <- strsplit(df_cmp$시군구명[i], split = " ")[[1]][1]
}



cs_df <- df_cmp %>%
  group_by(시군구명, 성별코드) %>%
  summarise(m_spend = mean(총결제금액))

# 통계량 알아보기 / t검정

str

# 주행속도와 제동거리 사이 회귀모델 구하기
head(cars)
plot(dist~speed, data = cars)

model <- lm(dist~speed, cars)
model

abline(model)
coef(model)[1]
coef(model)[2]

b <- coef(model)[1]
W <- coef(model)[2]
speed <- 30
dist <- W*speed + b
dist

speed <- cars[, 1] #주행속도
pred <- W * speed + b
pred

compare <- data.frame(pred, cars[, 2], pred-cars[, 2])
colnames(compare) <- c()


# 2020.10.17 교육 2
# 로지스틱 회귀분석
