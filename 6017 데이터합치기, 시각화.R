
##데이터 합치기 

##1.가로(수평)로 합치기 : 기존데이터에 변수(열)을 추가

###id기준으로 합치기 
#중간고사 데이터 생성 
test1<- data.frame(id= c(1,2,3,4,5),
                   midterm= c(60,80,70,90,85))

#기말고사 데이터 생성 
test2<- data.frame(id= c(1,2,3,4,5),
                   final= c(70,83,65,95,80))

test1
test2

total<- left_join(test1,test2, by ="id")
total


###다른데이터를 활용해 변수 추가하기 (각 반 학생들의 시험정보를 담은 exam데이터를 분석하고 있는데, 추가로 반별로 담임교사 명단을 얻었다고 가정)


#반별 담임교사 데이터 프레임 생성하기 
name <- data.frame(class = c(1, 2, 3, 4, 5),
                   teacher = c("kim", "lee", "park", "choi", "jung"))
name


#CLASS  변수를 기준으로 삼아 name의 teacher 변수를 exam에 추가
exam_new <- left_join(exam,name,bY="class")
exam_new


##2.세로(수직)로 합치기: 기존데이터에 행을 추가 / (수)직-행 버스로 외우기 #bind_rows() 

#학생 1-5번 시험 데이터 생성
group_a <- data.frame(id=c(1:5),
                      test=c(60,80,70,90,85))

group_b <- data.frame(id=c(6:10),
                      test=c(70,83,65,95,80))

group_a
group_b
#합칠때는 두 데이터의 변수명이 모두 같아야함 

group_new <- bind_rows(group_a,group_b)
group_new



#예제
#1)데이터프레임 생성
fuel <- data.frame(fl=c("c","d","e","p","r"),
                   price_fl=c("2.35","2.38","2.11","2.76","2.22"),
                   stringsAsFactors = F)
fuel
#2) 
mpg <- left_join(mpg, fuel, by = "fl")
mpg

mpg %>%
  select(model, fl, price_fl) %>%       # model, fl, price_fl 추출
  head(5)


## -------------------------------------------------------------------- ##
#데이터 시각화 
## 1. 산점도(geom_point): 두 변수간의 상관관계 

library(ggplot2)
# 1) x축 displ, y축 hwy로 지정해 배경 생성
ggplot(data = mpg, aes(x=displ,y=hwy))

# 2) 그래프 유형을 지정하는 함수 추가하기  (ggplot은 '+'로 함수를 연결함)
#산점도는 geom_point()를 이용함
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point()       
ggplot(data=mpg)

# 3) 축범위 설정
# x축:xlim(축이시작하는 값, 축이 끝나는 값) / y축: ylim( , ) 이용)
#3-1) x축 범위를 3~6으로 지정
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point()   + xlim(3,6)

#3-2) x축 범위를 3~6으로 지정

#t상자그림: boxplot 데이터의 분포(4분위수를 기준으로 주로분포)














#막대그래프 : barchart, 여러집단간의 차이ㅏ
library(dplyr)
df_mpg <- mpg %>%
  group_by(drv) %>% 
  summarise(mean_hwy=mean(hwy))
df_mpg

#평균막대그래프: 데이터를 요약한 평균표를 먼저 만든 후 평균표를 이용해 그래프
#빈도막대그래프: 별도로 표를 만들지 않고 원자료를 이용해 바로 그래프 생성

ggplot(data=df_mpg, aes(x=drv,y=mean_hwy))+geom_col()




ggplot(data=df_mpg, aes(x=reorder(drv,-mean_hwy),y=mean__hwy)+geom_col()

       
       
       
#시계열 데이터

선 그래프
head(
  
  'fdfds;fdslflll'
)
       
-----------------------------
library(ggplot2)
as.data.frame(ggplot2::midwest)
midwest %>% 
  mutate(minor=poptotal-popadults,
         mp=(minor/poptotal)*100) %>%
    arrange(desc(county)) %>% 
  head()

midwest %>% mutate(grade=ifelse(mp>=40,"large",ifelse(mp<30,"small","middle")))
group_by(county)
\\

-------------\\\
