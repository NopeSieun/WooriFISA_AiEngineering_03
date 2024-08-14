###  08.14 (28일차)
---
교육 내용: ELK 집계 API 
---
나는 오늘도 치통에 시달리는 중.. 사랑니 하나 뽑았는데 왼쪽 이빨이 다 아프다. 근데 졸려서 왼쪽으로 엎드려 잤다가 더 아파짐 ㅎ 이번달 말부터 다음달 초까지 SQLD 기술세미나 토스 빅분기 다 겹쳐 있어서 어지럽다. 그리고 여전히 서류는 우르르쾅쾅 떨어지는 중.. 낙엽인가? 
<p align="center">
<img src="https://github.com/user-attachments/assets/70a0ad8c-84c0-46af-9e9c-c93b9ad32975" width="40%" /> </p><br>

- **집계 API**: 검색 후 집계하는 방식으로 동작
  - 로그 분석, 분산 추적 등에 사용
  - 없는 필드에 대한 조회 시 value 0으로 뜸
<br><br>

- **매트릭 집계**: 산술연산 (min, max, sum avg..)
  ```javascript
  GET kibana_sample_data_ecommerce/_search
  {
    "size": 0, // 검색 결과를 생략
    "query": {
      "match": {  
        "geoip.continent_name": "Africa"
      }
    }, // 조건에 맞는 DOC를 검색,
    "aggs": {
      "EUR로 결제한 총 금액": {  // 집계 결과를 어떤 이름으로 부를지
        "sum": { // 어떤 집계를 수행할 것인지,
          "field": "products.taxful_price" }}}}
  ```
<br>

- **버킷 집계**: 문서를 쪼개서 부분 집합으로 나눔
  - from(시작구간) - to(마지막구간): 범위 직접 지정
  - histogram 집계: 간격(intervel) 지정
    - 0으로 떨어지지 않는 음수 구간 설정 -> **offset** 파라미터 이용
      ```javascript
      "histogram": {
        "field": "DistanceKilometers",
        "interval": 5000,
        "offset": -50
      }, ...
      ```
<br><br>

- **cardinality**: 지정한 필드가 가진 고유값의 개수를 계산해 반환

***
