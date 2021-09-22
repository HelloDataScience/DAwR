
# 9장 데이터 입출력

# 9.2 작업 경로 확인 및 변경
# 현재 작업 경로 확인
getwd()

# 현재 작업 경로에 저장된 폴더명과 파일명을 
# 문자형 벡터로 출력
list.files()

# 작업 경로를 data 폴더로 변경: 절대경로 사용
setwd(dir = 'C:\\Users\\계정이름\\Documents\\DAwR\\data')
list.files()

# 절대경로 vs 상대경로
setwd(dir = 'C:\\Users\\계정이름\\Documents\\DAwR\\data')
setwd(dir = 'C:\\Users\\계정이름\\Documents\\DAwR\\')
setwd(dir = './data')


# 9.3 엑셀 파일 입출력
# 관련 패키지 호출
library(writexl)

# iris를 xlsx 파일로 저장
write_xlsx(x = iris, path = 'iris.xlsx')
list.files()

# 관련 패키지 호출
library(readxl)

# xlsx 파일을 읽고 데이터프레임 obj1 생성
obj1 <- read_xlsx(path = 'iris.xlsx')

# obj1의 구조 확인
# 다섯 번째 컬럼인 Species가 문자형 벡터인 것 확인
str(object = obj1)


# 9.4.1 csv 파일 입출력
# iris를 csv 파일로 저장
write.csv(x = iris, file = 'iris.csv')
list.files()

# csv 파일을 읽고 데이터프레임 obj2 생성
obj2 <- read.csv(file = 'iris.csv')

# obj2의 구조 확인
# iris의 행이름이 첫 번째 컬럼 X로 추가되었음
str(object = obj2)

# csv 파일로 저장할 때 행이름 추가하지 않도록 설정
write.csv(x = iris, file = 'iris.csv', row.names = FALSE)
obj2 <- read.csv(file = 'iris.csv')

# obj2의 구조 다시 확인
# iris의 행이름이 추가되지 않았지만,
# 다섯 번째 컬럼인 Species가 문자형 벡터인 것 확인
str(object = obj2)


# 9.4.2 문자 인코딩 방식 확인
# 관련 패키지 호출
library(readr)

# csv 파일명을 문자형 벡터 file로 생성
fileName <- 'APT_Price_Gangnam_2020.csv'

# csv 파일의 문자 인코딩 방식 확인
guess_encoding(file = fileName)

# 문자 인코딩 방식을 추가하여 csv 파일 읽기
# Windows 사용자는 반드시 fileEncoding = 'UTF-8'을 
# 추가해야 함!
price <- read.csv(file = fileName, fileEncoding = 'UTF-8')

# price의 구조 확인
str(object = price)


# 9.5 RDS 파일 입출력
# iris를 RDS 파일로 저장
saveRDS(object = iris, file = 'iris.RDS')
list.files()

# csv 파일을 읽고 데이터프레임 obj3 생성
obj3 <- readRDS(file = 'iris.RDS')

# obj3의 구조 확인
# 다섯 번째 컬럼인 Species가 범주형 벡터인 것 확인
str(object = obj3)


# 9.6 RDA 파일 입출력
# 9.6.1 저장하고 읽기
# iris를 RDA 파일로 저장
save(iris, file = 'iris.RDA')
list.files()

# RDA 파일을 읽을 때 객체에 할당하지 않음
load(file = 'iris.RDA')


# 9.6.2  Environment 탭에 있는 R 객체를 포함해 RDA 파일 생성하기
save.image(file = 'irisAll.RDA')
list.files()


# 9.6.3 R 객체 삭제하기
# Environment에 있는 객체명을 문자형 벡터로 출력
ls()

# Environment에 있는 객체를 삭제
rm(list = ls())

# RDA 파일에 포함된 객체명 그대로 Environment에 추가됨
load(file = 'irisAll.RDA')


## End of Document
