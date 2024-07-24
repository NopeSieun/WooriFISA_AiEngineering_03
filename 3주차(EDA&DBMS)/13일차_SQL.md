###  07.00 (0일차)
---
교육 내용: 
---
오늘 아침의 억까들: 아침부터 손 부어서 반지가 안 들어가서 빼고 가야했다. / 간만에 흰 바지 입었는데 싱크대에 있던 떡볶이 국물 담긴 냄비 위로 그릇 떨어뜨려서 다 튀어서 갈아입어야 했다. / 비 안 온대서 버스 탔는데 내리니까 비와서 비맞았다. / 버스에 사람 많은데 다 복도쪽에 앉고 안 비켜줘서 거의 맨 뒤에 앉아야 했다. /  리그오브레전드 플레이리스트가 있길래 틀었는데 진격의 거인 ost랑 브금만 계속 나와서 거인 목 베러 가는 마음으로 출근해야 했다.(바꿀 의지는 없었다) / 출첵용 계정 로그인이 갑자기 안 돼서 5번이나 다시 해야했다(그래도 박수 받았다)
<p align="center">
<img src="https://github.com/user-attachments/assets/18c0793b-2606-4a19-8ed7-23f4cb6e648c" width="40%" /> </p>
<p align="center">(사진은 어제 퇴근하면서 본 무지개)</p>
<br><br>

- **데이터(data)**: 어떤 값을 포함한, 가공되지 않은 1차적 자료(이름, 생일, 이미지 등)
  1) 정형 데이터: 구조화된 데이터 (미리 정해진 구조대로 저장됨)
  2) 반정형 데이터: 정형데이터보다 유동적으로 관리됨 (구조화 o, 필수로 지키진 x)
     - HTML, XML, JSON ..
  4) 비정형 데이터: 정해진 구조 x
     - 텍스트, 이미지(jpg, png, bmp), 음성 ..
<br><br>
- **빅데이터(big data)**: 정형 + 반정형 + 비정형
  - 다양성(Variety): 구조+비구조 데이터
  - 규모(Volume): 테라바이트, 페타바이트 이상의 데이터
  - 속도(Velocity): 데이터 생성/유통/소비 기간이 대폭 단축
  - 가치(Value), 변동성(Variability), 정확성(Veracity), 복잡성(Complexity) 
<br><br>
- **데이터베이스 관리 시스템(DBMS)**: 여러 사람의 사용을 위해 통합 관리하는 데이터 집합
  1) **계층적 DBMS**: 사용자가 데이터베이스 엑세스를 정의, 생성, 유지 관리 및 제어할 수 있도록 하는 소프트웨어 응용 프로그램
    <p align="center">
      <img src="https://github.com/user-attachments/assets/bfc9c7a2-47e9-497d-aeaa-86ee079dc089" width="50%" /> </p>

  3) **네트워크 DBMS**: 네트워크/그래프 구조로 데이터 구성, 계층적 모델보다 유연
     <p align="center">
      <img src="https://github.com/user-attachments/assets/fd0c2375-e996-4d2a-9d75-479a052d6875" width="50%" /> </p>
  5) **관계형 DBMS(RDBMS)**: 테이블이라는 최소단위로 구성, SQL 지원
     <p align="center">
      <img src="https://github.com/user-attachments/assets/c37a4e1e-f614-43d7-9193-03a00b5e057f" width="50%" /> </p>

      - 장점: 중복데이터 저장 최소화, 무결성 보장, 트랜잭션(작업단위) 처리 가능, SQL로 손쉬운 데이터 처리
  7) **NoSQL DBMS**: 비관계형 DBMS -> 확장성, 분산저장, 비정형/반정형 데이터 처리


<br><br>
- **MySQL**: 오픈소스 관계형 데이터베이스 관리 시스템 
  - 스키마: 논리적인 데이터 구조를 코드로 구현한 것, 각 스키마에 관련 테이블을 생성해 자료 관리
  - 테이블: RDBMS에서 데이터를 저장하는 2차원 형태의 DB 객체
    <p align="center">
    <img src="https://github.com/user-attachments/assets/086cce89-63b6-4366-9319-20de897251aa" width="50%" /> </p>
- 데이터베이스 관리 스타일
  - Data Mart(DM): 데이터를 꺼내 사용자에게 제공하는 역할
  - Data Warehouse(DW): 하나의 통합된 형태로 정제 -> 비용/버려지는 데이터 발생 
  - Data Lake(DL): 원본 형태 그대로 가져와 저장 -> 다양성 보존

***

<small>(DBMS 이미지 출처: [링크](https://www.geeksforgeeks.org/types-of-databases/))</small><br>
<small>(MySQL 이미지 출처: [링크](https://thebook.io/080268/0015/))</small>


