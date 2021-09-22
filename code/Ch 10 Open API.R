
# 10장 오픈 API를 활용한 공공데이터 수집과 처리

# 10.4 데이터 가져오기
# 관련 패키지 설치
install.packages('httr')

# 관련 패키지 호출
library(httr)

# Call Back URL로 문자형 벡터 URL 생성
URL <- 'http://openapi.molit.go.kr:8081/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcAptTrade'

# 5자리 지역코드 설정
areaCd <- '11110'

# 거래년월 설정
ymonth <- '201512'

# 공공데이터포털 API 인증키 설정
apiKey <- '공공데이터포털에서 발급받은 인증키를 입력하세요.'

# HTTP 요청 실행
res <- GET(url = URL, 
           query = list(LAWD_CD = areaCd, 
                        DEAL_YMD = ymonth,
                        serviceKey = apiKey))

# HTTP 응답 확인
print(x = res)

# res에 포함된 데이터를 텍스트로 변환하여 
# 문자형 벡터 text에 할당
text <- content(x = res, as = 'text')

# text를 출력하면 중괄호로 시작하는 것 확인
# JSON 타입의 데이터라서 그렇게 출력된 것임
print(x = text)


# 10.5 데이터 처리하기
# 관련 패키지 호출
library(jsonlite)

# JSON 데이터를 처리하여 리스트 data 생성
data <- fromJSON(txt = text)

# data의 구조 확인
str(object = data)

# data의 아파트 매매 데이터로 데이터프레임 df 생성
df <- data$response$body$items$item

# df의 구조 확인
str(object = df)


## End of Document
