###  08.12 (26일차)
---
교육 내용: Linux, ELK Stack
---
한 주가 지날수록 점점 더 피곤해지는 것 같아서 걱정이 된다. 오늘은 버스에서 눈이 안 떠져서 힘들었다. 여기서 계속 간식 먹어서 어제 간만에 몸무게 재봤더니 2kg나 찐거 보고 충격받았다. 오늘부터는 좀 줄이기로 마음 먹었는데 왜냐면 집에 먹을게 한가득이기 때문.. 수박맛 호올스를 선물 받아서 자랑했다. 
<br><br>

- 리눅스에서 파일을 다른 리눅스(포트)로 보내는 법
  ```linux
  sudo scp -p 전송할포트번호 파일명 받을계정@호스트:경로
  ```
  - 디렉토리 한 번에 전송도 가능
    ```linux
    sudo scp -r -P 전송할포트번호 ./폴더명 받을계정@호스트:경로
    ```
<br>

- **ELK Stack**: Elasticsearch(분석/저장), Logstash(수집), Kibana(시각화 도구)
  <p align="center">
  <img src="https://github.com/user-attachments/assets/aaea320b-2589-4eb8-94b8-c37034c744ca" width="50%" /> </p>
  
  - 버전이 모두 같이 업데이트됨 
  - 검색 솔루션에 최적화된 방식으로 많이 사용(문서 탐색, 인프라 모니터링, 보안)
  - 여러 로그를 하나의 인덱스에 모아서 관리
<br><br>

- **Elasticsearch**: RESTful 오픈소스 검색엔진, ELK의 중심에 위치
  - HTTP를 통해 JSON 형식의 RESTful API 사용
  - 여러 개의 인덱스를 한번에 조회 가능
  - 역색인 구조: 특정 단어가 포함된 특정 문서의 위치를 빠르게 확인 가능
  - 실시간 검색이 아니며 롤백 기능이 없다는 단점 有
<br><br>

- **REST API**: HTTP헤더, URL만 사용해 다양한 요청이 가능한 앱 인터페이스
  - localhost 주소 공유해서 사용 
<br><br>

- Elasticsearch는 검색 특화 엔진 - GET, POST, PUT, DELETE, HEAD
  - CREATE: POST, PUT
    - document 번호가 필요하지 않은 경우(ex. 로그) 안 붙여도 됨 
  - READ: GET, POST
    - 특정 조건을 본문에 달아서 조회할 때 POST 사용
     <p align="center">
    <img src="https://github.com/user-attachments/assets/8ff4e5bd-bf25-4863-bf6a-f047df7fb4eb" width="30%" /> </p>
  - UPDATE: PUT
    - 수정하고 싶을 때 PATCH 사용 불가 -> POST+update 사용
  - DEETE: DELETE
    <p align="center">
    <img src="https://github.com/user-attachments/assets/6d9bed16-f3fd-4504-81d7-3aa8ab6c6456" width="30%" /> </p><br>
<br><br>

- **점수 알고리즘**: 문서 전체를 고려한 여러 요소에 의해 관련성 점수 부여
  - 문서 길이, 빈도 등을 기준으로 점수 조정
  - AI 불확실성을 조금 감소시킬 수 O
    ```JavaScript
    POST my_index/_search?q="hello"
    ```
    <p align="center">
    <img src="https://github.com/user-attachments/assets/3c8d31f7-9e65-4fd1-bbd5-38ed604daf5c" width="30%" /> </p>
  <br>

- **search**: GET으로 특정필드 검색
  - title 필드는 keyword 자료형이라 완전일치 아니면 검색 안 됨
  - content 필드는 text 자료형이라 들어온 문자열을 스페이스, 품사 기준으로 끊어서 색인했기 때문에 검색됨
<br><br>

- **Object Type**: 필드 하위에 다른 필드 포함 가능 -> 내부적으로 평탄화된 키-값으로 색인
  ```JavaScript
  POST woorifisa/_doc/
  {
    "student": {
      "name": "신짱구",
      "age": 5
    }
  }
  ```
  ```javascript
  POST woorifisa/_search?q=student.name:신짱구 #name:신짱구로 찾기 불가
  ```
<br>

- **Nested Type**: 배열을 위한 인덱스를 품은 인덱스 -> 독립적인 데이터로 취급 (전용 쿼리로 검색 필요)
<br><br>

- **match query**: 쿼리 수행 전 분석기로 text 분석 후 검색
- **term query**: 분석 작업 없이 입력된 text가 존재하는 문서 검색
  - text
  - keyword
***
