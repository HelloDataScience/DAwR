
getwd()
list.files()

setwd(dir = '/Users/drkevin/Documents/DAwR/data')
list.files()

setwd(dir = '/Users/drkevin/Documents/DAwR/data')
setwd(dir = './data')

library(writexl)
write_xlsx(x = iris, path = 'iris.xlsx')
list.files()

library(readxl)
obj1 <- read_xlsx(path = 'iris.xlsx')
str(object = obj1)

write.csv(x = iris, file = 'iris.csv')
list.files()

obj2 <- read.csv(file = 'iris.csv')
str(object = obj2)

write.csv(x = iris, file = 'iris.csv', row.names = FALSE)
obj2 <- read.csv(file = 'iris.csv')
str(object = obj2)

library(readr)
file <- 'APT_Price_Gangnam_2020.csv'
guess_encoding(file = file)
price <- read.csv(file = file, fileEncoding = 'UTF-8')
str(object = price)

saveRDS(object = iris, file = 'iris.RDS')
list.files()

obj3 <- readRDS(file = 'iris.RDS')
str(object = obj3)

save(iris, file = 'iris.RDA')
list.files()
load(file = 'iris.RDA')

save.image(file = 'irisAll.RDA')
list.files()

ls()
rm(list = ls())
load(file = 'irisAll.RDA')

