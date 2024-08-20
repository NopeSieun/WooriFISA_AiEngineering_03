###  08.20 (31일차)
---
교육 내용: ELK 팀 프로젝트, WEB
---
어제 깃 저장 안 해서 오후 내용이 다 날아가버렸다.. 습관적 커밋 필수.. 버스에서 무아지경으로 헤드뱅잉 하다가 카드 날렸는데 여러명이 찾아주심 ㅎ 감사했다. 오늘 태국음식 먹으려고 했다가 사람 많아서 옆에 있는 뼈해장국 가게에서 먹었는데 배가 터질 것 같다. 근데 고망고도 먹음.🥭 
<p align="center">
<img src="https://github.com/user-attachments/assets/a3a013e1-8069-4377-a2f4-ec76f4527480" width="30%" /> </p><br>

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
<br>

- 많은 데이터를 관리하게 될 경우: 여러개의 노드를 하나의 클러스터로 묶어 관리
 - index보다 작은 단위인 shard(python의 파티션 개념과 유사)로 다시 쪼개서 속도 높임
 - 마스터 노드 선출 -> 마스터 노드 죽으면 켜져있는 노드 중 하나가 물려받음
 - index안의 data를 생명주기 단위로 관리 -> 속도 료율 

- index의 **life-cycle** - hot, warm, cold, freeze
  - **Rollover**: 단계 전환
      <p align="center">
      <img src="https://github.com/user-attachments/assets/722b1ecd-f821-4a7d-aadc-aa7327cefa18" width="50%" /> </p>

- **web**: HTML + CSS + JS
  - **HTML(Hypertext Markup Language)**: 웹페이지와 내용을 구조화하기 위해 사용하는 마크업 코드
  - **CSS(Cascading Style Sheets)**: 웹페이지 꾸미는 용 코드
  - **JavaScript(JS)**: HTML과 CSS로 구성된 웹 페이지를 동적으로 만들어줌 
  
***
<br> 
