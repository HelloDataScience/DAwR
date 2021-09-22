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
