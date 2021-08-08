
install.packages('httr')
library(httr)

URL <- 'http://openapi.molit.go.kr:8081/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcAptTrade'
areaCd <- '11110'
ymonth <- '201512'
# apiKey <- '공공데이터포털에서 발급받은 인증키를 입력하세요'
apiKey <- 'VFrt+Rn7QYqGWV48I8PtXujZu0OmGg7ZSTEwmhJUj7/gukGAlhURQVCtROkX5y05bUpU5Rw4CoikAg2MVQ0urw=='

res <- GET(url = URL, 
           query = list(LAWD_CD = areaCd, 
                        DEAL_YMD = ymonth,
                        serviceKey = apiKey))
print(x = res)

text <- content(x = res, as = 'text')
print(x = text)

library(jsonlite)
data <- fromJSON(txt = text)
str(object = data)

df <- data$response$body$items$item
str(object = df)
