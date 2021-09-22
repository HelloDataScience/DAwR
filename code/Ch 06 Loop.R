
# 6장 반복문

# 6.1 for문
# 변수가 차례대로 입력받을 값을 원소로 갖는 벡터 생성
menu <- c('짜장면', '탕수육', '깐풍기', '짬뽕', '전가복', '샥스핀')

# for문 실행
for (item in menu) {
  print(x = item)
}

# 중괄호 안에 print() 함수 대신 객체명만 지정
for (item in menu) {
  item
}

# 6.1.1 두 문자열을 연결해 출력하기 : cat()
# R 객체의 값과 문자열을 연결하여 출력 시도 <- 에러가 발생합니다.
menu <- c('짜장면', '탕수육', '깐풍기', '짬뽕', '전가복', '샥스핀')
for (item in menu) {
  print(item, '시킬까요?\n')
}

# cat() 함수로 문제 해결
for(item in menu) {
  cat(item, '시킬까요?\n')
}

# 6.1.2 문자열을 연결해 새 객체에 저장하기 : paste()
# paste() 함수로 생성한 문자열을 print() 함수로 출력
for (item in menu) {
  text <- paste(item, '시킬까요?\n')
  print(x = text)
}

# 6.2 while문 
# 숫자형 벡터 생성
i <- 5

# while문 실행
while(i > 0) {
  print(x = i)
  i <- i - 1
}

# 6.3 이후 코드 건너뛰기 : next
# 변수가 차례대로 입력받을 값을 원소로 갖는 벡터 생성
menu <- c('짜장면', '탕수육', '깐풍기', '짬뽕', '전가복', '샥스핀')

# 반복문 안에 조건문 추가하여 실행할 코드 제어
for (item in menu) {
  if (item %in% c('짜장면', '짬뽕')) {
    cat(item, '요리부터 주문합시다!\n', sep = '? ')
  } else {
    cat(item, '다음 메뉴는 뭔가요?\n', sep = '? ')
  }
}

# 반복문 실행 도중 next를 만나면 처음으로 되돌아감
for (item in menu) {
  if(item %in% c('짜장면', '짬뽕')) {
    next
    cat(item, '요리부터 주문합시다!\n', sep = '? ')
  }
  cat(item, '다음 메뉴는 뭔가요?\n', sep = '? ')
}


# 6.4 반복문 탈출하기 : break
# 반복문 실행 도중 break를 만나면 반복문 중단
i <- 0
while (TRUE) {
  print(x = i)
  i <- i + 1
  if(i > 5) {
    break
  }
}


# 6.4.2 for문에서 break 사용하기
# 반복문 실행 도중 break를 만나면 반복문 중단
for (i in 0:9) {
  print(x = i)
  if(i > 5) {
    break
  }
}


# 6.5.1 repeat문
# repeat문 실행 
i <- 0
repeat {
  print(x = i)
  i <- i + 1
  if(i > 5) {
    break
  }
}


## End of Document
