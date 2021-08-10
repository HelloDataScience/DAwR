
table(iris$Species)
prop.table(x = table(iris$Species))

library(tidyverse)
table(iris$Species) %>% prop.table()

iris %>% 
  select(Sepal.Length, Species) %>% 
  filter(Sepal.Length >= 5.2) %>% 
  group_by(Species) %>% 
  summarise(Count = n()) %>% 
  mutate(Pcnt = Count / sum(Count)) %>% 
  arrange(desc(x = Pcnt))

url <- 'https://bit.ly/APT_Price_Gangnam_2020_csv'
guess_encoding(file = url)

price <- read.csv(file = url, fileEncoding = 'UTF-8')
str(object = price)

price %>% select(아파트, 거래금액) %>% head()
price %>% select(8, 2) %>% tail()

price %>% select(-일련번호) -> price
str(object = price)

price %>% 
  rename(아파트명 = 아파트, 아파트주소 = 도로명주소) %>% 
  head()

price %>% head()

price %>% filter(거래금액 >= 600000)
price %>% filter(거래금액 < 600000, 층 >= 60)

price %>% slice(1:5)
price %>% slice(seq(from = 1, to = 10, by = 2))

price %>% 
  mutate(아파트 = as.factor(x = 아파트)) %>% 
  str()

price %>% mutate(단위금액 = 거래금액 / 전용면적) -> price
head(x = price)

price %>% 
  mutate(거래금액 = 거래금액 / 10000,
         단위금액 = round(x = 단위금액 * 3.3, digits = 0)) -> price
head(x = price)

price %>% 
  mutate(금액구분 = ifelse(test = 단위금액 >= 10000, 
                           yes = '1억 이상',
                           no = '1억 미만')) -> price
head(x = price)

price %>% 
  mutate(금액구분2 = ifelse(test = 단위금액 >= 10000, 
                            yes = '1억 이상',
                            no = ifelse(test = 단위금액 >= 5000, 
                                        yes = '5천 이상',
                                        no = '5천 미만'))) %>% 
  head()

price %>% 
  mutate(금액구분2 = case_when(단위금액 >= 10000 ~ '1억 이상',
                               단위금액 >= 5000 ~ '5천 이상',
                               단위금액 >= 0 ~ '5천 미만')) %>% 
  head()


price %>% 
  group_by(월) %>% 
  summarise(거래건수 = n(), 평균금액 = mean(x = 거래금액))

price %>% 
  group_by(아파트, 금액구분) %>% 
  summarise(매매건수 = n()) -> elong
tail(x = elong)

elong %>% 
  spread(key = 금액구분, value = 매매건수, fill = 0) -> widen
tail(x = widen)

widen %>% 
  gather(key = 금액타입, value = 거래건수, 2:3, na.rm = FALSE) %>% 
  tail()

df <- price %>% select(아파트, 전용면적, 층, 거래금액, 단위금액)
df %>% arrange(desc(x = 거래금액)) %>% head()
df %>% arrange(desc(x = 층, 거래금액)) %>% head()
df %>% arrange(desc(x = 층), desc(x = 거래금액)) %>% head()
df %>% arrange(desc(x = 층), 거래금액) %>% head()

getwd()
setwd(dir = './data')
saveRDS(object = price, file = 'APT_Price_Gangnam_2020.RDS')

