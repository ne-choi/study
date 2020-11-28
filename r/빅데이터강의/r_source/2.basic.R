#2-1 데이터형 실습
x<-5
x
y<-3
y
z<-x/y
z
c<-2+5i
c
str<-"Hello"
str
kind<-factor(c('male','female'))
kind
lo<-TRUE
lo
n1<-5/0
n1

#2-2 연산자 실습
2+5*4
3>0 
7<=5
3>0 & 7<=5
!5
isTRUE(!5)

#2-3데이터셋의 기본 정보 확인하기
df_young <- read.csv("TC_GS_AREA_BOOKST.csv",header=T,fileEncoding="CP949",encoding="UTF-8")
df_young <- read.table("TC_GS_AREA_BOOKST.csv",header=T,sep=',',fileEncoding="CP949",encoding="UTF-8")
dim(df_young)
head(df_young)
