# 데이터 읽기
data = read.table('./data/access.log')

# 6개 데이터만 확인
head(data)
# read.table의 구분자는 default값이 (빈칸)임
# 따라서 쓸모 없는 열이 많아진 것을 확인할 수 있음 테이블의 대략적인 확인 과정을 거쳐야함.

# 테이블에 담긴 데이터의 규모 열의 데이터 형태 등을 대략적으로 확인
str(data)

# 1열은 IP, 2,3열은 의미가 없음
# 이러한 과정을 거쳤을 때 의미없는 열으 대부분 '-'라는 값을 갖고 있음 이를 피해가야함.
# 또한 문제의 서술 과정 중 브라우저 에이전트는 마지막에 존재했기 때문에 이를 이용하면
# 마지막 10번 11번째 열에서 이를 대변하고 있는 것을 확인할 수 있으며
# 이 2개의 데이터 열을 하나로 합치게 해주는 정제과정을 거져야함.
# 이때 dplyr 라이브러리의 mutate를 사용하여 새로운 변수를 만들어주면서
# paste함수를 통해서 해당 2개의 데이터를 하나로 합치는 과정이 필요함.

# 라이브러리 로드
library('dplyr')

# 2개의 펙터형은 하나로 뽑을 때 문자열로 간주되므로 paste 가능
# 또한 이를 따로 벡터로 형변환하여
# vector_browser_agent라는 벡터로 할당
vector_browser_agent = c(data %>% mutate(browser_agent = paste(V10, V11)) %>% select(browser_agent))

# 테이블을 만들면 해당 빈도수를 알 수 있음
table_browser_agent = table(vector_browser_agent)

# 또한 이를 내림차순으로 정렬하면 원하는 브라우저 에이전트를 찾을 수 있음
head(sort(table_browser_agent, decreasing=TRUE), n = 5)


# 해당 데이터를 안전하게 문자열 벡터로 다시 할당한 후
answer_top_agent5 = c(
  "Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36",
  "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36",
  "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36",
  "Mozilla/5.0 (Windows NT 6.1; rv:64.0) Gecko/20100101 Firefox/64.0",
  "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0"
)

# 데이터 프레임 형식으로 만듬
top_agent5 = data.frame(answer_top_agent5=answer_top_agent5)
top_agent5


# IP 과정도 이와 동일하기 때문에 설명은 생략
head(sort(table(data[,1]), decreasing=TRUE), n=5)

answer_top_ip5 = c(
  "66.249.66.194",
  "66.249.66.91",
  "151.239.241.163",
  "91.99.30.32",
  "66.249.66.92"
)

top_ip5 = data.frame(answer_top_ip5=answer_top_ip5)

write.csv(top_ip5, file='answer_top_ip5.csv')
write.csv(top_agent5, file='answer_top_agent5.csv')