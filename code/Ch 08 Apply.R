
# 8장 같은 함수 반복 실행

# 8.1.1 str() 함수로 행렬 데이터 출력하기
str(object = iris)


# 8.1.2 head() 함수로 데이터의 일부 출력하기
# iris의 모든 열을 행렬로 변환
irisMat1 <- as.matrix(x = iris)

# irisMat1의 처음 6개 행만 출력
head(x = irisMat1)

# iris의 1~4번째 열을 행렬로 변환
irisMat2 <- as.matrix(x = iris[, 1:4])

# irisMat2의 처음 6개 행만 출력
head(x = irisMat2)


# 8.1.3 apply() 함수 실행하기
# iris의 행 방향으로 선택된 원소의 평균 반환
apply(X = iris[, 1:4], MARGIN = 1, FUN = mean)

# iris의 열 방향으로 선택된 원소의 평균 반환
apply(X = iris[, 1:4], MARGIN = 2, FUN = mean)


# 8.2 for문과 비교
# for문으로 iris 행별 평균 반환
avg <- c()
for(i in 1:150) {
  row <- iris[i, 1:4]
  row <- as.numeric(x = row)
  avg[i] <- mean(x = row)
}


# 8.2.1 30만 번 반복 실행한 결과 비교
# 행길이 설정
n <- 300000

# 시드 고정
set.seed(seed = 1234)

# 가상의 시험 점수 데이터셋 생성
univ <- data.frame(
  국어 = sample(x = 40:100, size = n, replace = TRUE),
  영어 = sample(x = 40:100, size = n, replace = TRUE),
  수학 = sample(x = 40:100, size = n, replace = TRUE)
)

# univ의 구조 확인
str(object = univ)

# univ의 처음 10행만 출력
head(x = univ, n = 10L)


# 8.2.2 system.time() 함수로 성능 비교하기
# for문이 실행되는 소요시간 측정
system.time(expr = {
  avg1 <- c()
  for(i in 1:n) {
    avg1[i] <- mean(x = as.integer(x = univ[i, ]))
  }
})

# apply() 함수가 실행되는 소요시간 측정
system.time(expr = avg2 <- apply(X = univ, MARGIN = 1, FUN = mean))


# 8.3.1 lapply()와 sapply() 결과 비교하기
# lapply() 함수는 실행 결과를 리스트로 반환
lapply(X = univ, FUN = mean)

# sapply() 함수는 실행 결과를 벡터 또는 행렬로 반환
sapply(X = univ, FUN = mean)

# apply() 함수의 MARGIN에 2를 지정한 코드와 같은 결과
apply(X = univ, MARGIN = 2, FUN = mean)

# simplify에 FALSE를 지정하면 리스트로 결과 반환
sapply(X = univ, FUN = mean, simplify = FALSE)


# 8.3.2 sapply() 함수 반환 자료구조 확인하기
# sapply() 함수로 열벡터의 평균 반환
sapply(X = univ, FUN = mean)

# sapply() 함수로 열벡터 원소의 제곱근 반환
sapply(X = univ, FUN = sqrt)


# 8.4.1 FUN에 함수 작성하기
# univ의 과목별 점수가 70 이상인 학생수 반환
sapply(X = univ, FUN = function(obj) {
  result <- length(x = obj[obj >= 70])
  return(result)
})


# 8.4.2 FUN에 사용자 지정 함수 지정하기
# myFuns.R 파일을 실행합니다.
source(file = 'myFuns.R', encoding = 'UTF-8')

# univ의 과목별 점수로 학점 반환
sapply(X = univ, FUN = function(score) {
  grade <- sapply(X = score, FUN = getGrade)
  return(grade)
})


## End of Document
