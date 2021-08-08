
# 정수형 벡터 obj 생성 
obj <- 1L

# obj의 클래스 확인
class(x = obj)

# obj의 클래스가 'integer'인지 비교 연산
class(x = obj) == 'integer'

# if문 기본 구문
if (class(x = obj) == 'integer') print(x = '정수입니다!')

# 뒤따르는 코드를 중괄호로 묶음
if (class(x = obj) == 'integer') {
  print(x = '정수입니다!')
}

# if문의 괄호 안의 값이 FALSE이면 중괄호 안 코드를 실행하지 않음
obj <- as.character(x = obj)
if (class(x = obj) == 'integer') {
  print(x = '정수입니다!')
}

# if문의 괄호 안의 값이 FALSE일 때, 실행할 코드를 else문에 추가
if (class(x = obj) == 'integer') {
  print(x = '정수입니다!')
} else {
  print(x = '정수가 아닙니다!')
}

# if문에서 고려해야 할 조건 추가
if (class(x = obj) == 'integer') {
  print(x = '정수입니다!')
} else if (class(x = obj) == 'numeric') {
  print(x = '실수입니다!')
} else {
  print(x = '숫자가 아닙니다!')
}

# 합격여부를 새로운 객체에 저장
score <- 100
if (score >= 70) {
  grade <- '합격'
} else {
  grade <- '불합격' 
}

# 결과를 콘솔 창에 출력
print(x = grade)

# 원소가 2개 이상인 벡터로 조건문 실행
score <- c(100, 69)
if (score >= 70) {
  grade <- '합격'
} else {
  grade <- '불합격' 
}

# 결과를 콘솔 창에 출력
print(x = grade)
  
# 여러 원소를 갖는 벡터 생성
score <- seq(from = 40, to = 100, by = 10)

# score의 각 원소가 70 이상인지 비교 연산 실행
score >= 70

# ifelse() 함수를 이용하여 새로운 문자형 벡터 생성
ifelse(test = score >= 70, yes = '합격', no = '불합격')

# score를 원소로 갖는 데이터프레임 생성
df <- data.frame(score)

# df의 구조 확인
str(object = df)

# ifelse() 함수를 이용하여 df에 새로운 파생 변수 생성
df$grade <- ifelse(test = df$score >= 70, yes = '합격', no = '불합격')

# df를 콘솔 창에 출력
print(x = df)

