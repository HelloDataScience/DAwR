
# 11장 데이터프레임 전처리

# 11.1.1 파이프 연산자
# iris$Species의 빈도수 확인
table(iris$Species)

# 함수를 중첩하여 상대도수확인
prop.table(x = table(iris$Species))

# 관련 패키지 호출
library(tidyverse)

# 파이프 연산자를 사용하여 상대도수 확인
iris$Species %>% table() %>% prop.table()


# 11.1.2 dplyr 패키지 함수 사용 예제
iris %>% 
  select(Sepal.Length, Species) %>% 
  filter(Sepal.Length >= 5.2) %>% 
  group_by(Species) %>% 
  summarise(Count = n()) %>% 
  mutate(Pcnt = Count / sum(Count)) %>% 
  arrange(desc(x = Pcnt))


# 11.2. 실습 데이터셋 준비
# 관련 패키지 호출
library(tidyverse)

# 텍스트 데이터를 포함하는 링크로 문자형 벡터 url 생성
url <- 'https://bit.ly/APT_Price_Gangnam_2020'

# 문자 인코딩 방식 확인
guess_encoding(file = url)

# csv 파일을 읽고 데이터프레임 price 생성
price <- read.csv(file = url, fileEncoding = 'UTF-8')

# price의 구조 확인
str(object = price)

# 현재 작업 경로에 포함된 폴더명과 파일명 출력
# 만약 APT_Price_Gangnam_2020.csv 파일이 없으면 
# 작업 경로를 data 폴더로 변경해야 함!!!
list.files()

# APT_Price_Gangnam_2020.csv 파일명으로 fileName 생성
fileName <- 'APT_Price_Gangnam_2020.csv'

# 문자 인코딩 방식 확인
guess_encoding(file = fileName)

# csv 파일을 읽고 데이터프레임 price 생성
price <- read.csv(file = fileName, fileEncoding = 'UTF-8')

# price의 구조 확인
str(object = price)


# 11.3 컬럼 선택 및 삭제
# price에서 아파트, 거래금액 컬럼만 선택
price %>% select(아파트, 거래금액) %>% head()

# price에서 8, 2번째 컬럼만 선택
price %>% select(8, 2) %>% tail()

# price에서 일련번호 컬럼 삭제한 결과를 price에 재할당
price %>% select(-일련번호) -> price
str(object = price)


# 11.4 컬럼명 변경
price %>% 
  rename(아파트명 = 아파트, 아파트주소 = 도로명주소) %>% 
  head()


# 11.5 조건에 맞는 행 선택(필터링)
# price에서 거래금액이 60억 이상인 행만 선택
price %>% filter(거래금액 >= 600000)

# price에서 거래금액이 60억 미만이고, 
# 층이 60 이상인 행만 선택
price %>% filter(거래금액 < 600000, 층 >= 60)


# 11.6 인덱스로 행 선택 및 삭제
# price에서 1~5번 행만 선택
price %>% slice(1:5)

# price에서 1부터 10까지 홀수행만 선택
price %>% slice(seq(from = 1, to = 10, by = 2))


# 11.7 컬럼의 자료형 변환
# 아파트 컬럼을 범주형 벡터로 변환
price %>% mutate(아파트 = as.factor(x = 아파트)) %>% str()


# 11.8 기존 컬럼 변경 및 새로운 컬럼 생성
# 거래금액을 전용면적으로 나눈 단위금액 컬럼 생성
price %>% mutate(단위금액 = 거래금액 / 전용면적) -> price
head(x = price)

# 거래금액을 만원에서 억원으로 단위를 변경하고,
# 단위금액에 3.3을 곱하여 price에 재할당
price %>% 
  mutate(거래금액 = 거래금액 / 10000,
         단위금액 = round(x = 단위금액 * 3.3, digits = 0)) -> price
head(x = price)

# 단위금액이 1억 이상이면 '1억 이상', 아니면 '1억 미만'인
# 값을 갖는 금액구분 컬럼을 생성하고 price에 재할당
price %>% 
  mutate(금액구분 = ifelse(test = 단위금액 >= 10000, 
                           yes = '1억 이상',
                           no = '1억 미만')) -> price
head(x = price)

# ifelse() 함수 중첩
price %>% 
  mutate(금액구분2 = ifelse(test = 단위금액 >= 10000, 
                            yes = '1억 이상',
                            no = ifelse(test = 단위금액 >= 5000,
                                        yes = '5천 이상',
                                        no = '5천 미만'))) %>% 
  head()

# case_when() 함수 사용
price %>% 
  mutate(금액구분2 = case_when(단위금액 >= 10000 ~ '1억 이상',
                               단위금액 >= 5000 ~ '5천 이상',
                               단위금액 >= 0 ~ '5천 미만')) %>% 
  head()


# 11.9 집계 함수로 데이터 요약
# 월별 거래건수 및 평균금액을 갖는 데이터프레임 생성
price %>% 
  group_by(월) %>% 
  summarise(거래건수 = n(), 평균금액 = mean(x = 거래금액))


# 11.10 데이터프레임 형태 변환
# 아파트, 금액구분 기준으로 그룹을 설정하고,
# 매매건수를 계산한 Long type의 elong 생성
price %>% 
  group_by(아파트, 금액구분) %>% 
  summarise(매매건수 = n()) -> elong

# elong의 마지막 여섯 행만 출력
tail(x = elong)

# Long type을 Wide type으로 변환하여 widen 생성
elong %>% 
  spread(key = 금액구분, value = 매매건수, fill = 0) -> widen

# widen의 마지막 여섯 행만 출력
tail(x = widen)

# Wide type을 Long type으로 변환하고 마지막 여섯 행만 출력
widen %>% 
  gather(key = 금액타입, value = 거래건수, 2:3, na.rm = FALSE) %>% 
  tail()


# 11.11 오름차순 및 내림차순 정렬
# price에서 일부 컬럼만 선택하고 데이터프레임 df 생성
df <- price %>% select(아파트, 전용면적, 층, 거래금액, 단위금액)

# 거래금액으로 내림차순 정렬하고 처음 여섯 행만 출력
df %>% arrange(desc(x = 거래금액)) %>% head()

# 층, 거래금액으로 내림차순 정렬하고 처음 여섯 행만 출력
# desc() 함수에는 컬럼명을 하나만 지정해야 함!
df %>% arrange(desc(x = 층, 거래금액)) %>% head()

# 층, 거래금액으로 내림차순 정렬하고 처음 여섯 행만 출력
# 이번에는 정상적으로 정렬된 것을 확인
df %>% arrange(desc(x = 층), desc(x = 거래금액)) %>% head()

# 층은 내림차순, 거래금액은 오름차순으로 정렬하고 
# 처음 여섯 행만 출력
df %>% arrange(desc(x = 층), 거래금액) %>% head()


# 현재 작업 경로 확인
getwd()

# 필요시 data 폴더로 작업 경로 변경
setwd(dir = './data')

# price를 RDS 파일로 저장
saveRDS(object = price, file = 'APT_Price_Gangnam_2020.RDS')


## End of Document
