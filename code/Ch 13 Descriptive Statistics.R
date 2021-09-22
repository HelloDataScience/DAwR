
# 13장 기술통계

# 13.2 실습 데이터셋 준비
# 관련 패키지 호출
library(tidyverse)

# 현재 작업 경로 확인
getwd()

# data 폴더로 작업 경로 변경
setwd(dir = './data')

# 현재 작업 경로에 포함된 폴더명과 파일명을 문자형 벡터로 출력
list.files()

# RDS 파일을 읽고 데이터프레임 apt 생성
apt <- readRDS(file = 'APT_Dataset_Gangnam_2020.RDS')

# apt 구조 확인
str(object = apt)


# 13.3.1 평균
# 숫자형 벡터의 평균 반환
mean(x = apt$거래금액)

# NA가 포함된 벡터의 평균을 계산하면 항상 NA를 반환
mean(x = apt$kaptdaCnt)

# NA를 제거하고 평균 반환
mean(x = apt$kaptdaCnt, na.rm = TRUE)


# 13.3.2 절사평균
# 5% 절사평균 반환
mean(x = apt$거래금액, trim = 0.05)

# 10% 절사평균 반환
mean(x = apt$거래금액, trim = 0.10)


# 13.3.3 중위수
median(x = apt$거래금액)


# 13.3.4 분위수와 백분위수
# 거래금액의 10백분위수 반환
quantile(x = apt$거래금액, probs = 0.1)

# 거래금액의 90백분위수 반환
quantile(x = apt$거래금액, probs = 0.9)

# 거래금액의 10백분위수와 90백분위수 반환
quantile(x = apt$거래금액, probs = c(0.1, 0.9))


# 13.3.5 사분위수
quantile(x = apt$거래금액)


# 13.4.1 범위
# 거래금액의 최솟값 반환
min(apt$거래금액)

# 거래금액의 최댓값 반환
max(apt$거래금액)

# 거래금액의 범위 반환: 최솟값과 최댓값을 동시에 반환
range(apt$거래금액)

# diff() 함수는 벡터 원소 간 차이를 반환
range(apt$거래금액) %>% diff()


# 13.4.2 사분범위
IQR(x = apt$거래금액)

# 13.4.3 분산
var(x = apt$거래금액)

# 13.4.4 표준편차
sd(x = apt$거래금액)

# 13.5.1 공분산
cov(x = apt$전용면적, y = apt$거래금액)

# 13.5.2 상관계수
cor(x = apt$전용면적, y = apt$거래금액)


## End of Document
