###  08.13 (27일차)
---
교육 내용:
---
오늘은 버스에서 잠을 푹 못 잤다. 첫 번째 버스는 고속도로에서 시동 꺼져서 놀라서 깨고, 두 번째 버스는 사고날 뻔 해서 경적소리에 깼다. 요즘 조금씩 채용 공고가 올라오고 있어서 시간 날 때마다 조금씩 써보고는 있는데 멀티테스킹이 잘 안 되는 느낌이라 답답하다. 
<br><br>

- ELK 실행법
  - VS 코드에서 열어서 각각 실행 후 localhost로 접속
    <p align="center">
    <img src="https://github.com/user-attachments/assets/854ca922-2ca1-460f-9f57-3deede846362" width="30%" /><img src="https://github.com/user-attachments/assets/451efc0e-0c35-4fca-aea1-83c376922d73" width="20%" /> </p><br>

- **match**: match_all, match, match_phrase, query_string
  - 문자열 그대로를 찾는 방식
  - 일치하는 결과를 반황 (띄어쓰기는 기본적으로 or을 뜻함)
  - oprator라는 파라미터로 조정 가능
    ```javascript
    GET my_index/_search
    {
      "query": {
        "match": {
          "title": {
            "query": "world hello",
            "operator": "and"
          }
        }
      }
    }
    ```
<br>

- **match_phrase**: 순서대로 찾는 단어들이 문장에 들어있는지 탐색
  ```javascript
  GET my_index/_search
  {
    "query": {
      "match_phrase": {
        "title": "world hello"
      }
    }
  }
  ```
  - **slop**: 검색하려는 두 단어의 순서는 유지하되 중간에 몇 개의 토큰을 허용 가능
    ```javascript
    GET my_index/_search
    {
      "query": {
        "match_phrase": {
          "title": {
            "query": "hello hello",
            "slop": 2
          }
        }
      }
    }
    ```
    <p align="center">
    <img src="https://github.com/user-attachments/assets/2dd4b6b5-3214-4e4f-8260-5055993b6d28" width="50%" /> </p><br>

- **POST _bulk**: 데이터 한 번에 집어넣을 수 있는 명령어
<br><br>

- **bool query**
  - must : 꼭 포함/ must_not : 절대 불포함
  - should : 해당 조건이 있으면 검색 결과에 가산점
  - filter : 조건을 포함하되 점수에는 영향을 미치지 않는 것. (속도 빠름)
***
<br> 
