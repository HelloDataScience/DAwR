
library(tidyverse)
ggplot(data = iris, 
       mapping = aes(x = Sepal.Length, 
                     y = Sepal.Width,
                     fill = Species)) + 
  geom_point(shape = 21, size = 3) + 
  coord_cartesian(xlim = c(4, 8)) + 
  theme_bw()

getwd()
setwd(dir = './data')
list.files()
apt <- readRDS(file = 'APT_Dataset_Gangnam_2020.RDS')

library(showtext)
font_add_google(name = 'Gamja Flower', family = 'GamjaFlower')
font_add_google(name = 'Nanum Gothic', family = 'NanumGothic')
showtext_auto()

ggplot(data = apt, mapping = aes(x = 거래금액)) + 
  geom_histogram()

range(apt$거래금액)
breaks <- seq(from = 0, to = 70, by = 2)
ggplot(data = apt, mapping = aes(x = 거래금액)) + 
  geom_histogram(breaks = breaks, color = 'gray30', fill = 'pink')

ggplot(data = apt, mapping = aes(x = 거래금액)) + 
  geom_histogram(breaks = breaks, color = 'gray30', fill = 'pink') + 
  labs(title = '거래금액 히스토그램', x = '거래금액', y = '빈도수') + 
  theme_bw(base_family = 'GamjaFlower')

ggplot(data = apt, mapping = aes(x = 거래금액)) + 
  geom_histogram(breaks = breaks, color = 'gray30', fill = 'pink') + 
  labs(title = '거래금액 히스토그램', x = '거래금액', y = '빈도수') + 
  theme_bw(base_family = 'GamjaFlower') + 
  theme(plot.title = element_text(size = 14, hjust = 0.5),
        panel.grid = element_blank())

mytheme <- theme_bw(base_family = 'GamjaFlower') + 
  theme(plot.title = element_text(size = 14, hjust = 0.5),
        panel.grid = element_blank())

ggplot(data = apt, mapping = aes(y = 단위금액)) + 
  geom_boxplot(color = 'gray30', fill = 'pink', 
               outlier.color = 'darkred', outlier.fill = 'red', 
               outlier.shape = 21, outlier.size = 3, 
               outlier.stroke = 2, outlier.alpha = 0.5) + 
  labs(title = '단위금액 상자수염그림') + 
  mytheme

apt1 <- apt %>% filter(!is.na(x = codeHeatNm))
ggplot(data = apt1, mapping = aes(x = codeHeatNm, y = 단위금액)) +
  geom_boxplot(color = 'gray30', fill = 'pink', 
               outlier.color = 'darkred', outlier.fill = 'red',
               outlier.shape = 21, outlier.size = 3,
               outlier.stroke = 2, outlier.alpha = 0.5) +
  labs(title = '단위금액 상자수염그림', x = '난방방식') +
  mytheme

ggplot(data = apt1, mapping = aes(x = codeHeatNm, y = 단위금액)) +
  geom_boxplot(mapping = aes(fill = codeHeatNm), color = 'gray30', 
               outlier.color = 'darkred', outlier.fill = 'red',
               outlier.shape = 21, outlier.size = 3,
               outlier.stroke = 2, outlier.alpha = 0.5) +
  labs(title = '단위금액 상자수염그림', x = '난방방식') +
  mytheme

ggplot(data = apt1, mapping = aes(x = codeHeatNm, y = 단위금액)) +
  geom_boxplot(mapping = aes(fill = codeHeatNm), color = 'gray30', 
               outlier.color = 'darkred', outlier.fill = 'red',
               outlier.shape = 21, outlier.size = 3,
               outlier.stroke = 2, outlier.alpha = 0.5) +
  labs(title = '단위금액 상자수염그림', x = '난방방식') +
  mytheme + 
  theme(legend.position = 'none')

ggplot(data = apt1, mapping = aes(x = codeHeatNm)) +
  geom_bar(mapping = aes(fill = codeHeatNm), color = 'gray30') + 
  labs(title = '난방방식 막대그래프', x = '난방방식', y = '빈도수') +
  mytheme + 
  theme(legend.position = 'none')

apt1 %>% group_by(codeHeatNm) %>% summarise(freq = n()) -> heatCnt
str(object = heatCnt)

ggplot(data = heatCnt, mapping = aes(x = codeHeatNm, y = freq)) + 
  geom_col(mapping = aes(fill = codeHeatNm), color = 'gray30') + 
  labs(title = '난방방식 막대그래프', x = '난방방식', y = '빈도수') +
  mytheme + 
  theme(legend.position = 'none')

ggplot(data = heatCnt, mapping = aes(x = codeHeatNm, y = freq)) + 
  geom_col(mapping = aes(fill = codeHeatNm), color = 'gray30') + 
  geom_text(mapping = aes(label = freq), vjust = -1, size = 3) + 
  coord_cartesian(ylim = c(0, 2500)) + 
  labs(title = '난방방식 막대그래프', x = '난방방식', y = '빈도수') +
  mytheme + 
  theme(legend.position = 'none')


apt1 %>% 
  group_by(월) %>% 
  summarise(평균단위금액 = mean(단위금액)) -> monthMean

str(object = monthMean)

ggplot(data = monthMean, mapping = aes(x = 월, y = 평균단위금액)) + 
  geom_line(color = 'red', linetype = 1, size = 1) + 
  labs(title = '월별 평균단위금액 선그래프') + 
  mytheme


apt1 %>% 
  group_by(월, codeHeatNm) %>% 
  summarise(평균단위금액 = mean(단위금액), .groups = 'drop') -> monthMean2

str(object = monthMean2)
head(x = monthMean2)

ggplot(data = monthMean2, mapping = aes(x = 월, y = 평균단위금액)) + 
  geom_line(color = 'red', size = 1) + 
  labs(title = '월별 평균단위금액 선그래프') + 
  mytheme

monthMean2 %>% mutate(월 = as.factor(x = 월)) -> monthMean2
ggplot(data = monthMean2, mapping = aes(x = 월, y = 평균단위금액)) + 
  geom_line(mapping = aes(group = codeHeatNm, color = codeHeatNm), size = 1) + 
  labs(title = '월별 평균단위금액 선그래프') + 
  mytheme + 
  theme(legend.position = 'bottom')


ggplot(data = apt, mapping = aes(x = 전용면적, y = 거래금액)) + 
  geom_point(color = 'gray30', fill = 'gray80', shape = 21, 
             size = 2, alpha = 0.5, stroke = 0.5) + 
  labs(title = '전용면적과 거래금액의 산점도') + 
  mytheme

ggplot(data = apt, mapping = aes(x = 전용면적, y = 거래금액)) + 
  geom_point(color = 'gray30', fill = 'gray80', shape = 21, 
             size = 2, alpha = 0.5, stroke = 1) + 
  geom_vline(xintercept = mean(x = apt$전용면적), color = 'red', linetype = 2) + 
  geom_hline(yintercept = mean(x = apt$거래금액), color = 'red', linetype = 2) + 
  labs(title = '전용면적과 거래금액의 산점도') + 
  mytheme

