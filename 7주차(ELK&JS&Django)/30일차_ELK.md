###  08.19 (30일차)
---
교육 내용: ELK - 데이터 파이프라인 구축 
---
자리가 바꼈는데 맨 앞자리가 되었다. 따로 줌 화면을 틀지 않아도 돼서 좋은 것 같다. 금요일 하루 수업 빠졌을 뿐인데 한 10일 빠진 기분..
<br><br>

- **logstach** filter: 실시간 파이프라인 기능을 가진 오픈소스 데이터 수집 엔진 
  - 비정형 -> 정형 데이터 
  - 정규식을 이용해 정형화: **Grok pattern**
  <p align="center">
  <img src="https://github.com/user-attachments/assets/cdd06a50-14ca-457b-a651-e5586d72adaa" width="46%" /> <img src="https://github.com/user-attachments/assets/165ad890-fce2-43e1-a3a0-c3f316d77661" width="50%" /> </p><br>

- **Filebeat**: 경로의 로그 데이터를 확인하고 변경이 감지되면 Logstash로 보내줌(로그이벤트 수집)
  ```linux
  bin\logstach
  ```
  <p align="center">
  <img src="https://github.com/user-attachments/assets/0b619745-1c20-4b78-bb67-2d1fc5dee73d" width="50%" /> </p><br>

- 여러 개의 노드를 하나의 클러스터로 묶어서 사용하는 경우가 多 -> 클러스터 설정 API
  - **cat API**: 엘라스틱서치의 상태를 조회
    ```linux
    GET _cat/nodes //각 노드의 이름과 상태 조회 
    ```
    - 노드별로 속성 조정 가능
    ```linux
    GET _cat/master  // 마스터 노드 확인 
    ```
    - 마스터 노드(es1) 파악 가능 등
  - 유사 구조를 가진 인덱스를 생성할 때 번거롭지 않도록 템플릿을 정의해둬야 함(재사용 가능하게)
    - a_b_1, a_b_2, a_b_3 ..
  - 동작 방법 지정 필요 (**맵핑**): 동적/정적 (자료형 자동인식/미리 맵핑)
<br><br>




***
<br> 
