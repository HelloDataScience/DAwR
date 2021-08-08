
# iris의 구조 확인
str(object = iris)

# iris의 모든 열을 행렬로 변환
irisMat1 <- as.matrix(x = iris)

# irisMat1의 처음 6개 행만 출력
head(x = irisMat1)

# iris의 1~4번째 열을 행렬로 변환
irisMat2 <- as.matrix(x = iris[, 1:4])

# irisMat2의 처음 6개 행만 출력
head(x = irisMat2)

# iris의 행 방향으로 선택된 원소의 평균 반환
apply(X = iris[, 1:4], MARGIN = 1, FUN = mean)

# iris의 열 방향으로 선택된 원소의 평균 반환
apply(X = iris[, 1:4], MARGIN = 2, FUN = mean)

# for문으로 iris 행별 평균 반환
avg <- c()
for(i in 1:150) {
  row <- iris[i, 1:4]
  row <- as.numeric(x = row)
  avg[i] <- mean(x = row)
}

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

# for문이 실행되는 소요시간 측정
system.time(expr = {
  avg1 <- c()
  for(i in 1:n) {
    avg1[i] <- mean(x = as.integer(x = univ[i, ]))
  }
})

# apply() 함수가 실행되는 소요시간 측정
system.time(expr = avg2 <- apply(X = univ, MARGIN = 1, FUN = mean))

# lapply() 함수는 실행 결과를 리스트로 반환
lapply(X = univ, FUN = mean)

# sapply() 함수는 실행 결과를 벡터 또는 행렬로 반환
sapply(X = univ, FUN = mean)

# apply() 함수의 MARGIN에 2를 지정한 코드와 같은 결과
apply(X = univ, MARGIN = 2, FUN = mean)

# simplify에 FALSE를 지정하면 리스트로 결과 반환
sapply(X = univ, FUN = mean, simplify = FALSE)

# sapply() 함수로 열벡터의 평균 반환
sapply(X = univ, FUN = mean)

# sapply() 함수로 열벡터 원소의 제곱근 반환
sapply(X = univ, FUN = sqrt)

# univ의 과목별 점수가 70 이상인 학생수 반환
sapply(X = univ, FUN = function(obj) {
  result <- length(x = obj[obj >= 70])
  return(result)
})

# univ의 과목별 점수로 학점 반환
sapply(X = univ, FUN = function(score) {
  score <- matrix(data = score, ncol = 1)
  grade <- apply(X = score, MARGIN = 1, FUN = getGrade)
  return(grade)
})

