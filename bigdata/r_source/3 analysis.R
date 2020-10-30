#3-1 경기도 시별 서점 분포현황 분석
df<-read.csv("TC_GS_AREA_BOOKST.csv",fileEncoding = "UTF-8")
str(df)
head(df)
head(df$주소)

#oo시 문자열 추출하기 
for ( i in c(1:length(df$주소) ) ){
   addr_split[i] <- strsplit(df$주소[i],split=" ")[[1]][2]
}

#시별 서점수 집계하기
install.packages("dplyr")
library(dplyr)
addr_count <- addr_split %>% 
  table() %>% 
  data.frame()
head(addr_count)

#트리맵 그리기
install.packages("treemap")
library(treemap)
treemap(addr_count, index='.', vSize="Freq",title="경기도 시별 서점 분포")

#3-2 경기도 시별 유동 인구현황 분석
df_person<-read.csv("TC_GS_CTY_POPLTN.csv",fileEncoding = "UTF-8")
str(df_person)
summary(df_person)

#데이터 전처리
for ( i in c(1:length( df_person$시군구명) ) ){
  df_person$시군구명[i] <- strsplit(df_person$시군구명[i],split=" ")[[1]][1]
  
}

#시별 데이터 집계하기
library(dplyr)
city_df <- df_person%>%
  group_by(시군구명) %>%
  summarise(m_pop=mean(유동인구지수.현황.))
str(city_df )


#그래프 그리기
install.packages("ggplot2")
library(ggplot2)


ggplot(data=city_df, aes(x=시군구명, y=m_pop, fill=rainbow(length(시군구명)))) +
  geom_bar(stat='identity') +
  coord_flip()+
  ggtitle("시별 유동인구 현황")

ggplot(data=city_df, aes(x=reorder(시군구명,m_pop), y=m_pop, fill=rainbow(length(시군구명)))) +
  geom_bar(stat='identity') +
  coord_flip()+
  ggtitle("시별 유동인구 현황") +
  labs(x='시',y='인원') +
  theme(plot.title=element_text(size=17, face='bold', color='blue',hjust=0.5))

#3-3 남녀별 소비패턴이 차이가 나는가?
df_cmp <- read.csv("TP_MWMN_ACCTO_CNSMP_PTTRN.csv",fileEncoding = "UTF-8")
head(df_cmp)
str(df_cmp)
summary(df_cmp)

#데이터 전처리 : 시 이름으로 정리
for ( i in c(1:length( df_cmp$시군구명) ) ){
  df_cmp$시군구명[i] <- strsplit(df_cmp$시군구명[i],split=" ")[[1]][1]
}

# 시별, 남녀별 그룹화
library(dplyr)
cs_df <- df_cmp%>%
  group_by(시군구명, 성별코드) %>%
  summarise(m_spend=mean(총결제금액))
str(cs_df )

ggplot(data=cs_df, aes(x=시군구명, y=m_spend, fill=성별코드)) +
  geom_col(position="dodge") +
  ggtitle("시별 남녀별 소비현황") +
  labs(x='시',y='소비평균') +
  theme(plot.title=element_text(size=17, face='bold', color='blue',hjust=0.5),
        axis.text.x = element_text(face='bold',angle = 90, hjust = 1, vjust = 0.5 ))

#성별로 집계하기
sex_df <- df_cmp%>%
  group_by(성별코드) %>%
  summarise(m_spend=mean(총결제금액))
str(sex_df )

rate <-c(sex_df$m_spend[1],sex_df$m_spend[2])
rate <-round(rate/(rate[1]+rate[2]),2)
names(rate)<-c("남성","여성")
pie(rate, col=round(rate*5),labels = paste(names(rate),round(rate*100),'%'))

ggplot(data=cs_df,aes(x=성별코드, y=m_spend, fill=성별코드)) +geom_boxplot()
boxplot(cs_df$m_spend)$stats
       
install.packages("psych")
library(psych)
man <- df_cmp %>% select(성별코드, 총결제금액) %>%
  filter(성별코드=="M" )
woman <- df_cmp %>% select(성별코드, 총결제금액) %>%
  filter(성별코드=="F" )

describe(man$총결제금액)
describe(woman$총결제금액)

t.test(data=df_cmp, 총결제금액~성별코드, var.equal=T)

