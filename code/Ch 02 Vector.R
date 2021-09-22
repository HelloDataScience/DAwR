
# 2장 R 자료구조 : 벡터

# 2.2.1 실수형과 정수형 벡터 생성 : c()
# 숫자 1, 2, 3은 실수형 벡터를 생성
a <- c(1, 2, 3)

# 벡터 a를 출력
print(x = a)

# 벡터 a의 클래스 확인
class(x = a)

# 숫자 뒤에 대문자 L을 붙여야 정수형 벡터를 생성
b <- c(1L, 2L, 3L)

# 벡터 b를 출력
print(x = b)

# 벡터 b의 클래스 확인
class(x = b)

# 벡터를 출력하면 콘솔창 왼쪽에 [1] 형태가 출력되는데
# 괄호안 숫자는 벡터 원소의 인덱스를 가리키는 것임
print(x = 101:150)


# 2.2.2 문자형과 논리형 벡터 생성 : c()
# 따옴표로 감싼 문자열은 문자형 벡터를 생성
c <- c('hello', 'world')

# 벡터 c를 출력
print(x = c)

# 벡터 c의 클래스 확인
class(x = c)

# 따옴표 없는 FALSE와 TRUE는 논리형 벡터를 생성
d <- c(FALSE, TRUE)

# 벡터 d를 출력
print(x = d)

# 벡터 d의 클래스 확인
class(x = d)

# [팁] T와 F를 객체명으로 사용하지 않는 것을 권장!
# T를 출력하면 TRUE가 출력됨
print(x = T)

# T에 F를 할당하고 다시 출력하면 FALSE가 출력됨
T <- F
print(x = T)


# 2.2.3 원소가 없는 빈 벡터 생성
c()

# 2.2.4 범주형 벡터 생성 : factor(), as.factor()
# 문자형 벡터 nat를 생성
nat <- c('한국', '일본', '중국', '미국', '중국', '한국', '미국', '일본')

# 벡터 nat를 출력
print(x = nat)

# 문자형 벡터를 범주형 벡터로 변환
fct <- as.factor(x = nat)

# 벡터 fct를 출력하면 레벨이 추가됨
print(x = fct)

# 범주형 벡터는 정수형 또는 문자형 벡터로 변환 가능
# 범주형 벡터의 원소는 레벨의 인덱스를 가지고 있기 때문
as.integer(x = fct)

# 범주형 벡터를 생성할 때 레벨 순서를 정할 수 있음
fct <- factor(x = nat, levels = c('한국', '미국', '중국', '일본'))

# 벡터 fct를 출력하면 레벨 순서가 달라진 것을 확인
print(x = fct)

# 레벨 순서가 달라졌으므로 레벨의 인덱스도 변경되었음
as.integer(x = fct)


# 2.2.5 원소가 연속되는 벡터 생성 : seq()
# 1부터 3까지 간격이 1인 실수형 벡터 생성
seq(from = 1, to = 3, by = 1)

# 간격이 1 또는 -1이면 콜론 사용 가능
1:3

# 3부터 1까지 간격이 -1인 실수형 벡터 생성
seq(from = 3, to = 1, by = -1)

# 1부터 10까지 간격이 2.5인 실수형 벡터 생성
seq(from = 1, to = 10, by = 2.5)

# 1부터 10까지 원소 개수가 19개인 실수형 벡터 생성
seq(from = 1, to = 10, length = 19)

# 매개변수 생략
seq(1, 3, 1)

# 인수 하나만 설정
seq(3)

# by와 length.out을 동시에 설정하면 에러 발생
seq(1, 3, 1, length.out = 5)

# by를 생략하면 length.out 설정 가능
seq(1, 3, length.out = 5)

# length.out 대신 length 사용 가능
seq(1, 3, length = 5)


# 2.2.6 원소가 반복되는 벡터 생성 : rep()
# 원소가 1개인 벡터를 세 번 반복
rep(x = 1, times = 3)

# 원소가 3개인 벡터를 세 번 반복
rep(x = 1:3, times = 3)

# 벡터의 각 원소를 세 번씩 반복
rep(x = 1:3, each = 3)

# 원소 개수가 10이 될 때까지 반복
rep(x = 1:3, length = 10)


# 2.3.1 인덱싱
print(x = letters)

# 문자형 벡터 letters의 첫 번째 원소만 선택
letters[1]


# 2.3.2 슬라이싱
# 문자형 벡터 letters의 1~5번째 원소를 s에 할당
s <- letters[1:5]
print(x = s)


# [팬시 인덱싱] 벡터 s의 1, 3, 5번째 원소를 선택
s[c(1, 3, 5)]

# [불리언 인덱싱] TRUE 위치에 해당하는 벡터 s의 원소 선택
s[c(TRUE, FALSE, TRUE, FALSE, TRUE)]


# 2.4 벡터 원소 추가
# 벡터 s의 여섯 번째 원소 추가
s[6] <- 'f'
print(x = s)

# 벡터 s의 열 번째 원소 추가. 7~9번째 원소는 NA로 생성
s[10] <- 'j'
print(x = s)


# 2.5 벡터 원소 삭제
# 벡터 s의 열 번째 원소를 삭제한 결과를 반환
s[-10]

# 벡터 s를 출력하면 열 번째 원소가 그대로 있음
print(x = s)

# 벡터 s의 열 번째 원소를 삭제한 결과를 s에 재할당
s <- s[-10]

# 벡터 s를 출력하면 열 번째 원소가 삭제되었음
print(x = s)


# 2.6.1 인덱싱과 슬라이싱을 이용해 변경하기
# 벡터 s의 첫 번째 원소를 'A'로 변경
s[1] <- 'A'
print(x = s)

# 벡터 s의 두 번째 원소를 'B'로 변경
s[2] <- 'B'
print(x = s)

# 벡터 s의 1~2 번째 원소를 '가', '나'로 변경
s[1:2] <- c('가', '나')
print(x = s)


# 2.6.2 범주형 벡터 원소 변경하기
# 문자형 벡터는 원소 변경이 쉬움
nat[8] <- '대만'
print(x = nat)

# 범주형 벡터는 레벨에 없는 원소로 변경하려고 하면
# 결측값으로 변환됨
fct[8] <- '대만'
print(x = fct)

# 범주형 벡터의 레벨을 문자형 벡터로 출력하고
# 마지막 레벨로 '대만'을 추가
levels(x = fct)
levels(x = fct)[5] <- '대만'

# 레벨에 있는 원소로는 변경 가능
fct[8] <- '대만'
print(x = fct)


# 2.7.1 정수로 형변환 : as.integer()
as.integer(x = 1.2)
as.integer(x = '1.2')
as.integer(x = FALSE)

# 2.7.2 실수로 형변환 : as.numeric()
as.numeric(x = 1L)
as.numeric(x = '1.2')
as.numeric(x = TRUE)

# 2.7.3 문자열로 형변환 : as.character() 
as.character(x = 1L)
as.character(x = 1.2)
as.character(x = TRUE)

# 2.7.4 논리형으로 형변환 : as.logical()
as.logical(x = 0)
as.logical(x = 1.2)
as.logical(x = '1.2')

# 2.7.5 범주형으로 형변환 : as.factor()
e <- as.factor(x = c)
print(x = e)
class(x = e)
as.integer(x = e)

# 2.8 벡터 강제변환
c <- c('hello', 'world')
d <- c(FALSE, TRUE)
e <- as.factor(x = c)

# 논리형 벡터와 범주형 벡터가 결합하면 
# 정수형 벡터로 강제변환됨
f <- c(d, e)
print(x = f)
class(x = f)

# 정수형 벡터에 실수형 스칼라가 결합하면
# 실수형 벡터로 강제변환됨
f <- c(f, 3)
print(x = f)
class(x = f)

# 실수형 벡터에 문자형 스칼라가 결합하면
# 문자형 벡터로 강제변환됨
f <- c(f, '4')
print(x = f)
class(x = f)


# 2.9.1 덧셈, 뺄셈 연산
# 원소 개수가 같은 벡터 생성
a <- c(0, 2, 4)
b <- c(1, 2, 3)

# 원소 개수가 같은 벡터끼리 덧셈, 뺄셈 연산
a + b
a - b

# a와 원소 개수가 다른 벡터 생성
c <- seq(from = 1, to = 11, by = 2)
d <- seq(from = 3, to = 12, by = 3)

# 원소 개수가 서로 다른 벡터로 덧셈 연산을 하면
# 원소 개수가 적은 벡터가 확장됨 (extention)
a + c
a + d
a + 1

# 2.9.2 곱셈, 나눗셈, 나머지, 몫, 거듭제곱 연산
a * 2
a ^ 2
a / 2
a %% 2
a %/% 2

# 2.10 비교 연산자
a > 2
a >= 2
a < 2
a <= 2
a == 2
a != 2

# 2.11 논리 연산자
a >= 1
b <= 2
a >= 1 & b <= 2
a >= 1 | b <= 2
!(a >= 1 & b <= 2)

# 2.12 멤버 연산자 : %in%
x <- 0
x == a[1]
x == a[2]
x == a[3]
x == a[1] | x == a[2] | x == a[3]
x %in% a


## End of Document
