
# 12장 데이터프레임 병합

# 12.2 실습 데이터셋 준비
# 관련 패키지 호출
library(tidyverse)

# 현재 작업 경로 확인
getwd()

# data 폴더로 작업 경로 변경
setwd(dir = './data')

# 현재 작업 경로에 포함된 폴더명과 파일명을 문자형 벡터로 출력
list.files()

# RDS 파일을 읽고 데이터프레임 price로 생성
price <- readRDS(file = 'APT_Price_Gangnam_2020.RDS')

# price의 구조 확인
str(object = price)


# 텍스트 파일명으로 fileName을 생성
fileName <- 'APT_Detail_Gangnam_2020.csv'

# 문자 인코딩 방식 확인
guess_encoding(file = fileName)

# 텍스트 파일을 읽고 데이터프레임 detail 생성
detail <- read.csv(file = fileName, fileEncoding = 'UTF-8')

# detail의 구조 확인
str(object = detail)


# 12.3 외래키 확인 및 전처리
# detail의 컬럼별 결측값 개수확인
sapply(X = detail, FUN = function(x) {
  x %>% is.na() %>% sum() %>% return()
})

# 외래키로 사용될 컬럼의 일부 원소만 출력
head(x = price$도로명주소, n = 10)
head(x = detail$doroJuso, n = 10)


# 12.4.1 duplicated() 함수 동작 이해하기
# 시드 고정
set.seed(seed = 1234)

# 1~5를 10번 복원추출하고 실수형 벡터 nums 생성
nums <- sample(x = 5, size = 10, replace = TRUE)

# nums를 출력
print(x = nums)

# nums의 처음부터 끝까지 원소별 중복 여부를 TRUE 또는 FALSE로 반환
duplicated(x = nums)

# nums의 원소별 중복 여부를 역순으로 변경
duplicated(x = nums, fromLast = TRUE)

# nums에 중복된 원소 개수 확인
duplicated(x = nums) %>% sum()


# 12.4.2 아파트 실거래 데이터에서 중복 원소 확인하기
duplicated(x = detail$doroJuso) %>% sum()


# 12.5 데이터프레임 병합 실습
# price의 도로명주소과 detail의 doroJuso가 같은 행을
# 하나로 병합하여 데이터프레임 apt 생성
apt <- left_join(x = price, 
                 y = detail, 
                 by = c('도로명주소' = 'doroJuso'))

# apt의 구조 확인
str(object = apt)

# apt에서 kaptCode와 kaptName을 삭제하고 apt에 재할당
apt %>% select(-kaptCode, -kaptName) -> apt

# apt를 RDS 파일로 저장
saveRDS(object = apt, file = 'APT_Dataset_Gangnam_2020.RDS')


## End of Document
