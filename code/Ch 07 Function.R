
# 7장 사용자 정의 함수

# 7.1 사용자 정의 함수의 기본 구조  
# 피타고라스 정리를 사용자 정의 함수로 생성
Pythagoras <- function(a, b) {
  c <- sqrt(x = a^2 + b^2)    
  return(c)                   
}


# 7.2 사용자 정의 함수 생성
# Pythagoras 함수 실행
Pythagoras(a = 3, b = 4)

# 점수 벡터 생성
score <- 100

# 점수를 입력받아 학점을 반환하는 if문 실행
if(score >= 90) {
  grade <- 'A'
} else if(score >= 80) {
  grade <- 'B'
} else if(score >= 70) {
  grade <- 'C'
} else if(score >= 60) {
  grade <- 'D'
} else {
  grade <- 'F'
}

# 결과를 콘솔 창에 출력
 print(x = grade)

# 점수를 입력받아 학점을 반환하는 사용자 정의 함수 생성
getGrade <- function(score) {
  if(score >= 90) {
    grade <- 'A'
  } else if(score >= 80) {
    grade <- 'B'
  } else if(score >= 70) {
    grade <- 'C'
  } else if(score >= 60) {
    grade <- 'D'
  } else {
      grade <- 'F'
  }
  return(grade)
}

# 점수로 학점 반환
getGrade(score = 100)


# 7.3 파일로 저장한 사용자 정의 함수 재활용
# getGrade() 함수 삭제
rm(getGrade)

# 'myFuns.R' 파일 읽기
source(file = 'myFuns.R', encoding = 'UTF-8')

# 점수로 학점 반환
getGrade(score = 100)


# 7.4 인수의 기본값 설정
# 사용자 정의 함수에 인수의 기본값 설정
guessHeight <- function(name = '홍길동', height = 173) {
  answer <- paste(name, '님의 키는', height, 'cm입니다.')
  return(answer)
}

# 인수를 생략하고 함수 실행
guessHeight()

# 인수를 지정하고 함수 실행
guessHeight(name = '정우성', height = 186)


## End of Document
