
library(tidyverse)
getwd()
setwd(dir = './data')
list.files()

price <- readRDS(file = 'APT_Price_Gangnam_2020.RDS')
str(object = price)

file <- 'APT_Detail_Gangnam_2020.csv'
guess_encoding(file = file)

detail <- read.csv(file = file, fileEncoding = 'UTF-8')
str(object = detail)

sapply(X = detail, FUN = function(x) {
  x %>% is.na() %>% sum() %>% return()
})

head(x = price$도로명주소, n = 10)
head(x = detail$doroJuso, n = 10)

set.seed(seed = 1234)
nums <- sample(x = 5, size = 10, replace = TRUE)
print(x = nums)
duplicated(x = nums)
duplicated(x = nums, fromLast = TRUE)
duplicated(x = nums) %>% sum()
duplicated(x = detail$doroJuso) %>% sum()

apt <- left_join(x = price, y = detail, by = c('도로명주소' = 'doroJuso'))
str(object = apt)

apt %>% select(-kaptCode, -kaptName) -> apt
saveRDS(object = apt, file = 'APT_Dataset_Gangnam_2020.RDS')

