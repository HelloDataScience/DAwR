
# 4장 R 자료구조 : 데이터프레임

# 4.2.1 두 벡터로 데이터프레임 생성하기 : data.frame()
# 데이터프레임의 원소로 사용될 길이가 다른 벡터 생성
num <- seq(from = 1, to = 10, by = 2)
chr <- rep(x = c('a', 'b'), each = 3)

# 길이가 다른 열벡터로 데이터프레임 생성 <-  에러가 발생합니다.
df1 <- data.frame(num, chr)

# cha의 길이를 num과 같도록 새로 생성
cha <- letters[1:5]

# 길이가 같은 열벡터로 데이터프레임 생성
df1 <- data.frame(num, cha)

# df1을 출력
print(x = df1)

# df1의 클래스 확인
class(x = df1)


# 4.2.2 데이터프레임의 구조와 값 확인하기 : str()
# df1의 구조 확인
str(object = df1)

# 최대 출력 옵션 확인
options('max.print')

# df1이 스크립트 창에서 새 탭으로 열림
View(x = df1)

# stringsAsFactors 옵션 확인
options('stringsAsFactors')

# data.frame() 함수에 stringsAsFactors 옵션 추가
df2 <- data.frame(num, cha, stringsAsFactors = TRUE)

# df2의 구조 확인
str(object = df2)


# 4.3.1 인덱싱으로 선택하기
# df1의 1행, 1열 선택
df1[1, 1]

# df1의 1~2행, 1~2열 선택
df1[1:2, 1:2]

# df1의 1행 선택
df1[1, ]

# df1의 1~2행 선택
df1[1:2, ]

# df1의 1열 선택
df1[, 1]

# df1의 1~2열 선택
df1[, 1:2]


# 4.3.2 문자형 벡터로 열 선택하기
# df1에서 열이름이 num인 열 선택
df1[, 'num']

# df1에서 열이름이 num과 cha인 열 선택
df1[, c('num', 'cha')]

# df1에서 열이름이 num인 열 선택
df1$num

# df1에서 열이름이 cha인 열 선택
df1$cha


# 4.3.4 TRUE/FALSE로 반환받기
# 비교 연산으로 논리형 벡터 반환
df1$num >= 5

# 홑대괄호 안에 논리형 벡터를 추가하여 불리언 인덱싱 실행
df1[df1$num >= 5, ]

# df1$num의 원소가 5 이상인 행의 cha인 열 선택
df1[df1$num >= 5, 'cha']

# df1$num의 원소가 5 이상인 행의 cha인 열 선택
df1$cha[df1$num >= 5]


# 4.4.1 데이터프레임에 원소 추가하기 : $ 
# df1에 새로운 열 추가
df1$int <- 11:15

# df1의 구조 확인
str(object = df1)


# 4.4.2 데이터프레임에 열 추가하기 : cbind()
# 기존 데이터프레임에 새로운 열벡터를 추가한 결과 출력
cbind(df1, rep(x = TRUE, times = 5))

# 기존 데이터프레임에 새로운 열벡터를 추가한 결과 출력
cbind(df1, log = rep(x = TRUE, times = 5))

# df1의 구조 확인
str(object = df1)

# cbind() 함수 실행 결과를 df1에 재할당
df1 <- cbind(df1, log = rep(x = TRUE, times = 5))

# df1의 구조 다시 확인
str(object = df1)


# 4.4.3 데이터프레임에 행 추가하기 : rbind()
# df1과 열이름이 같은 새로운 데이터프레임 생성
df3 <- data.frame(num = 6, cha = 'f', int = 16, log = TRUE)

# 기존 데이터프레임에 새로운 행을 추가한 결과 출력
rbind(df1, df3)

# df1의 구조 확인
str(object = df1)


# 4.5.1 열벡터 삭제하기 : $ 
# 데이터프레임의 열 삭제
df1$num <- NULL

# df1의 구조 확인
str(object = df1)


# 4.5.1 행 또는 열 삭제하기 : 인덱싱
# df1의 1행, 1열을 삭제한 결과 출력
df1[-1, -1]

# df1의 1행을 삭제한 결과 출력
df1[-1, ]

# df1의 1열을 삭제한 결과 출력
df1[, -1]


# 4.6 데이터프레임 원소 변경
# 데이터프레임의 원소 변경
df1$cha <- LETTERS[1:5]

# df1 출력
print(x = df1)

# 선택된 열벡터의 일부 원소만 변경
df1$int[1] <- '11'

# df1의 구조 확인
str(object = df1)


## End of Document
