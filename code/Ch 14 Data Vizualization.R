
# 14장 데이터 시각화

# 14.2.1 ggplot2 패키지 함수 사용 예제
# 관련 패키지 호출
library(tidyverse)

# iris의 Sepal.Length와 Sepal.Width로 산점도 그리기
ggplot(data = iris, 
       mapping = aes(x = Sepal.Length, 
                     y = Sepal.Width,
                     fill = Species)) + 
  geom_point(shape = 21, size = 3) + 
  coord_cartesian(xlim = c(4, 8)) + 
  theme_bw()

# 14.3.1 실습 데이터셋 준비 
# 현재 작업 경로 확인
getwd()

# data 폴더로 작업 경로 변경
setwd(dir = './data')

# 현재 작업 경로에 포함된 폴더명과 파일명을 문자형 벡터로 출력
list.files()

# RDS 파일을 읽고 데이터프레임 apt 생성
apt <- readRDS(file = 'APT_Dataset_Gangnam_2020.RDS')


# 14.2.2 한글 폰트 추가
# 관련 패키지 호출
library(showtext)

# 구글폰트에서 Nanum Gothic과 Gamja Flower 설치
font_add_google(name = 'Nanum Gothic', family = 'NanumGothic')
font_add_google(name = 'Gamja Flower', family = 'GamjaFlower')

# 설치한 구글폰트를 사용하도록 설정
showtext_auto()


# 14.4.1 히스토그램 기본형 그리기
ggplot(data = apt, mapping = aes(x = 거래금액)) + 
  geom_histogram()

# 14.4.2 히스토그램 막대 간격과 채우기 및 테두리 색 설정
# 거래금액의 최솟값과 최댓값 확인
range(apt$거래금액)

# 최솟값보다 작고 최댓값보다 큰 막대 간격 설정
breaks <- seq(from = 0, to = 70, by = 2)

# 막대 간격과 채우기 및 테두리 색 추가한 히스토그램 그리기
ggplot(data = apt, mapping = aes(x = 거래금액)) + 
  geom_histogram(breaks = breaks, color = 'gray30', fill = 'pink')


# 14.4.3 히스토그램 제목 및 완성된 테마 추가
ggplot(data = apt, mapping = aes(x = 거래금액)) + 
  geom_histogram(breaks = breaks, color = 'gray30', fill = 'pink') + 
  labs(title = '거래금액 히스토그램', x = '거래금액', y = '빈도수') + 
  theme_bw(base_family = 'GamjaFlower')


# 14.4.4 히스토그램 테마 수정하기
ggplot(data = apt, mapping = aes(x = 거래금액)) + 
  geom_histogram(breaks = breaks, color = 'gray30', fill = 'pink') + 
  labs(title = '거래금액 히스토그램', x = '거래금액', y = '빈도수') + 
  theme_bw(base_family = 'GamjaFlower') + 
  theme(plot.title = element_text(size = 14, hjust = 0.5),
        panel.grid = element_blank())

# 사용자 테마 설정
mytheme <- theme_bw(base_family = 'GamjaFlower') + 
  theme(plot.title = element_text(size = 14, hjust = 0.5),
        panel.grid = element_blank())


# 14.5.1 일변량 상자 수염 그림
ggplot(data = apt, mapping = aes(y = 단위금액)) + 
  geom_boxplot(color = 'gray30', fill = 'pink', 
               outlier.color = 'darkred', outlier.fill = 'red', 
               outlier.shape = 21, outlier.size = 3, 
               outlier.stroke = 2, outlier.alpha = 0.5) + 
  labs(title = '단위금액 상자 수염 그림') + 
  mytheme


# 14.5.2 이변량 상자 수염 그림
# codeHeatNm이 결측값이 아닌 행만 남겨서 apt1 생성
apt1 <- apt %>% filter(!is.na(x = codeHeatNm))

# apt1의 codeHeatNm별 단위금액의 상자 수염 그림 그리기
ggplot(data = apt1, mapping = aes(x = codeHeatNm, y = 단위금액)) +
  geom_boxplot(color = 'gray30', fill = 'pink', 
               outlier.color = 'darkred', outlier.fill = 'red',
               outlier.shape = 21, outlier.size = 3,
               outlier.stroke = 2, outlier.alpha = 0.5) +
  labs(title = '단위금액 상자 수염 그림', x = '난방방식') +
  mytheme


# 14.5.3 색 바꾸고 범례 추가하기
ggplot(data = apt1, mapping = aes(x = codeHeatNm, y = 단위금액)) +
  geom_boxplot(mapping = aes(fill = codeHeatNm), color = 'gray30', 
               outlier.color = 'darkred', outlier.fill = 'red',
               outlier.shape = 21, outlier.size = 3,
               outlier.stroke = 2, outlier.alpha = 0.5) +
  labs(title = '단위금액 상자 수염 그림', x = '난방방식') +
  mytheme


# 14.5.4 범례 제거하기
ggplot(data = apt1, mapping = aes(x = codeHeatNm, y = 단위금액)) +
  geom_boxplot(mapping = aes(fill = codeHeatNm), color = 'gray30', 
               outlier.color = 'darkred', outlier.fill = 'red',
               outlier.shape = 21, outlier.size = 3,
               outlier.stroke = 2, outlier.alpha = 0.5) +
  labs(title = '단위금액 상자 수염 그림', x = '난방방식') +
  mytheme + 
  theme(legend.position = 'none')


# 14.6.1 일변량 막대 그래프 그리기
ggplot(data = apt1, mapping = aes(x = codeHeatNm)) +
  geom_bar(mapping = aes(fill = codeHeatNm), color = 'gray30') + 
  labs(title = '난방방식 막대 그래프', x = '난방방식', y = '빈도수') +
  mytheme + 
  theme(legend.position = 'none')


# 14.6.2 이변량 막대 그래프 그리기
# apt1의 codeHeatNm 기준으로 빈도수를 계산하고 heatCnt 생성
apt1 %>% group_by(codeHeatNm) %>% summarise(freq = n()) -> heatCnt

# heatCnt의 구조 확인
str(object = heatCnt)

# heatCnt의 codeHeatNm별 freq의 크기로 막대 그래프 그리기 
ggplot(data = heatCnt, mapping = aes(x = codeHeatNm, y = freq)) + 
  geom_col(mapping = aes(fill = codeHeatNm), color = 'gray30') + 
  labs(title = '난방방식 막대 그래프', x = '난방방식', y = '빈도수') +
  mytheme + 
  theme(legend.position = 'none')


# 14.6.3 빈도수 추가하기
ggplot(data = heatCnt, mapping = aes(x = codeHeatNm, y = freq)) + 
  geom_col(mapping = aes(fill = codeHeatNm), color = 'gray30') + 
  coord_cartesian(ylim = c(0, 2500)) + 
  geom_text(mapping = aes(label = freq), 
            vjust = -1, size = 3) + 
  labs(title = '난방방식 막대 그래프', x = '난방방식', y = '빈도수') +
  mytheme + 
  theme(legend.position = 'none')


# 14.7.1 이변량 선 그래프 그리기
# apt1의 월별 평균단위금액을 계산하여 monthMean 생성
apt1 %>% 
  group_by(월) %>% 
  summarise(평균단위금액 = mean(단위금액)) -> monthMean

# monthMean의 구조 확인
str(object = monthMean)

# monthMean의 월별 평균단위금액으로 선 그래프 그리기
ggplot(data = monthMean, mapping = aes(x = 월, y = 평균단위금액)) + 
  geom_line(color = 'red', linetype = 1, size = 1) + 
  labs(title = '월별 평균단위금액 선 그래프') + 
  mytheme


# 14.7.2 데이터 처리 : 단위금액 컬럼의 평균을 갖는 데이터프레임 생성
# apt1을 월, codeHeatNm 기준으로 평균단위금액을 계산하여 monthMean2 생성
apt1 %>% 
  group_by(월, codeHeatNm) %>% 
  summarise(평균단위금액 = mean(단위금액), .groups = 'drop') -> monthMean2

# monthMean2의 구조 확인
str(object = monthMean2)

# monthMean2의 처음 여섯 행만 출력
head(x = monthMean2)


# 14.7.3 Long Type 데이터프레임으로 선 그래프 그리기
ggplot(data = monthMean2, mapping = aes(x = 월, y = 평균단위금액)) + 
  geom_line(color = 'red', size = 1) + 
  labs(title = '월별 평균단위금액 선 그래프') + 
  mytheme


# 14.7.4 Long Type 데이터프레임으로 선 그래프 그릴 때 group으로 묶기
# monthMean2의 월을 범주형으로 변환하고 monthMean2에 재할당
monthMean2 %>% mutate(월 = as.factor(x = 월)) -> monthMean2

# monthMean2의 월별 평균단위금액으로 선 그래프 그리기
# codeHeatNm으로 그룹을 지정해야 원하는 그래프를 그릴 수 있음
ggplot(data = monthMean2, mapping = aes(x = 월, y = 평균단위금액)) + 
  geom_line(mapping = aes(group = codeHeatNm, color = codeHeatNm), 
            size = 1) + 
  labs(title = '월별 평균단위금액 선 그래프') + 
  mytheme + 
  theme(legend.position = 'bottom')


# 14.8.1 이변량 산점도 그리기
ggplot(data = apt, mapping = aes(x = 전용면적, y = 거래금액)) + 
  geom_point(color = 'gray30', fill = 'gray80', shape = 21, 
             size = 2, alpha = 0.5, stroke = 0.5) + 
  labs(title = '전용면적과 거래금액의 산점도') + 
  mytheme


# 14.8.2 수직선/수평선으로 구역 나누기
ggplot(data = apt, mapping = aes(x = 전용면적, y = 거래금액)) + 
  geom_point(color = 'gray30', fill = 'gray80', shape = 21, 
             size = 2, alpha = 0.5, stroke = 1) + 
  geom_vline(xintercept = mean(x = apt$전용면적), 
             color = 'red', linetype = 2) + 
  geom_hline(yintercept = mean(x = apt$거래금액), 
             color = 'red', linetype = 2) + 
  labs(title = '전용면적과 거래금액의 산점도') + 
  mytheme


## End of Document
