###  08.20 (31일차)
---
교육 내용: ELK 팀 프로젝트
---
어제 깃 저장 안 해서 오후 내용이 다 날아가버렸다.. 습관적 커밋 필수.. 버스에서 무아지경으로 헤드뱅잉 하다가 카드 날렸는데 여러명이 찾아주심 ㅎ 감사했다. 
<br><br>

- **ELK-Streamlit 프로젝트**: Elasticsearch 안의 데이터를 활용해서 카드 검색 및 원하는 정보 확인을 위한 웹 페이지 개발
  <p align="center">
  <img src="https://github.com/user-attachments/assets/d87ac823-0b6f-4eae-8dab-236bf74e34d2" width="50%" /> </p><br>

  - 기능 종류
    - 조회하고 싶은 카드명 입력 후 정보 조회 가능
    - 받고 싶은 혜택 키워드를 입력 후 카드 비교 가능
    - search 하였을 때의 score 기준으로 1순위/2순위의 카드를 보여줌 
  - 트러블 슈팅: 신용/체크카드 기능을 넣었더니 베네핏 조회 버튼에서 계속 AttributeError 발생
    - 원인 파악: card_info가 dict 객체가 아니라 AttrDict 인스턴스여서 다른 접근 방식을 사용해야 함
      <p align="center">
      <img src="https://github.com/user-attachments/assets/9e895754-f854-41ee-b791-436375e5b071" width="60%" /> </p>

    - 문제 해결: 속성을 get 메서드 대신 .으로 접근해서 오류 수정 
      <p align="center">
      <img src="https://github.com/user-attachments/assets/ee44bb1b-3c94-414c-9555-c0290f4d628f" width="60%" /> </p>

    - 피드백 받은 개선 방안: 신용/체크카드 구분 코드를 짤 때 get_info 함수 안에서 데이터를 후처리 하는 방법을 사용했는데, 인덱스를 맵핑해서 전처리하는 방법도 좋을 것 같다고 말씀해주셨음.
      <p align="center">
      <img src="https://github.com/user-attachments/assets/8fe444b8-35f4-4d5e-a22a-d62166e99b11" width="60%" /> </p>


  
***
<br> 
