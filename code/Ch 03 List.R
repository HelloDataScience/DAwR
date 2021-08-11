
# 3장 R 자료구조 : 리스트

# 3.2 리스트 생성 : list()
# 리스트의 원소로 사용될 길이가 다른 벡터 생성
num <- seq(from = 1, to = 10, by = 2)
cha <- rep(x = c('a', 'b'), each = 3)

# 원소명이 없는 리스트 생성
lst1 <- list(num, cha)

# lst1을 출력
print(x = lst1)

# lst1의 클래스 확인
class(x = lst1)

# lst1의 구조 확인
str(object = lst1)

# 원소명이 있는 리스트 생성
lst2 <- list(a = num, b = cha, c = lst1)

# lst2를 출력
print(x = lst2)

# lst2의 클래스 확인
class(x = lst2)

# lst2의 구조 확인
str(object = lst2)


# 3.3 리스트 원소 선택
# 원소명이 없는 리스트에서 원소명이 a인 원소 선택
lst1$a

# 원소명이 있는 리스트에서 원소명이 a인 원소 선택
lst2$a

# 원소명이 없는 리스트의 첫 번째 원소 선택
lst1[[1]]

# 원소명이 있는 리스트의 첫 번째 원소 선택
lst2[[1]]


# str() 함수로 리스트 구조 파악하기
# R 내장 데이터프레임 women으로 선형 회귀모형 적합
fit <- lm(formula = weight ~ height, data = women)

# fit의 구조 확인
str(object = fit)

# 회귀계수 벡터만 선택
fit$coefficients


# 대괄호를 사용하여 첫 번째 원소를 리스트로 반환
lst2[1]

# 대괄호 안에 원소가 2개 이상인 벡터 지정
lst2[c(1, 3)]


# 3.4 리스트 원소 추가
# lst2에 새로운 원소 추가
lst2$d <- 1:5

# lst2의 구조 확인
str(object = lst2)


# 3.5 리스트 원소 삭제
# lst2에서 원소명이 a인 원소 삭제
lst2$a <- NULL

# lst2의 구조 확인
str(object = lst2)


# 3.6 리스트 원소 변경
# lst2에서 원소명이 b인 원소 변경
lst2$b <- letters[1:5]

# lst2에서 원소명이 b인 원소 출력
print(x = lst2$b)

# 리스트의 원소가 벡터일 때, 일부 원소만 변경
lst2$b[1] <- 'A'

# lst2에서 원소명이 b인 원소 출력
print(x = lst2$b)


## End of Document
