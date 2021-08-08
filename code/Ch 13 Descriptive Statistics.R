
library(tidyverse)
getwd()
setwd(dir = './data')
list.files()

apt <- readRDS(file = 'APT_Dataset_Gangnam_2020.RDS')
str(object = apt)

mean(x = apt$거래금액)
mean(x = apt$kaptdaCnt)
mean(x = apt$kaptdaCnt, na.rm = TRUE)

mean(x = apt$거래금액, trim = 0.05)
mean(x = apt$거래금액, trim = 0.10)

median(x = apt$거래금액)

quantile(x = apt$거래금액, probs = 0.1)
quantile(x = apt$거래금액, probs = 0.9)
quantile(x = apt$거래금액, probs = c(0.1, 0.9))
quantile(x = apt$거래금액, probs = seq(0, 1, 0.1))

quantile(x = apt$거래금액)

min(apt$거래금액)
max(apt$거래금액)
range(apt$거래금액)
range(apt$거래금액) %>% diff()

IQR(x = apt$거래금액)
var(x = apt$거래금액)
sd(x = apt$거래금액)

cov(x = apt$전용면적, y = apt$거래금액)
cor(x = apt$전용면적, y = apt$거래금액)
