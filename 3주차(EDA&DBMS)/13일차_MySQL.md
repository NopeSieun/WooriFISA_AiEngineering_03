###  07.24 (13일차)
---
교육 내용: MySQL
---
오늘 아침의 억까들: 아침부터 손 부어서 반지가 안 들어가서 빼고 가야했다. / 간만에 흰 바지 입었는데 싱크대에 있던 떡볶이 국물 담긴 냄비 위로 그릇 떨어뜨려서 다 튀어서 갈아입어야 했다. / 비 안 온대서 버스 탔는데 내리니까 비와서 비맞았다. / 버스에 사람 많은데 다 복도쪽에 앉고 안 비켜줘서 거의 맨 뒤에 앉아야 했다. /  리그오브레전드 플레이리스트가 있길래 틀었는데 진격의 거인 ost랑 브금만 계속 나와서 거인 목 베러 가는 마음으로 출근해야 했다.(바꾸기엔 너무 졸렸다) / 출첵용 계정 로그인이 갑자기 안 돼서 5번이나 다시 해야했다.(그래도 성공하고 박수도 받았다)
<p align="center">
<img src="https://github.com/user-attachments/assets/18c0793b-2606-4a19-8ed7-23f4cb6e648c" width="30%" /><img src="https://github.com/user-attachments/assets/7817060e-d810-457a-babd-d237264b7596" width="30%" />
 </p>
<p align="center">(사진은 어제 퇴근하면서 본 무지개랑 오늘 먹은 오토김밥)</p>
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
- 데이터베이스 관리 스타일
  - Data Mart(DM): 데이터를 꺼내 사용자에게 제공하는 역할
  - Data Warehouse(DW): 하나의 통합된 형태로 정제 -> 비용/버려지는 데이터 발생 
  - Data Lake(DL): 원본 형태 그대로 가져와 저장 -> 다양성 보존
<br><br>
- **MySQL**: 오픈소스 관계형 데이터베이스 관리 시스템 
  - 스키마: 논리적인 데이터 구조를 코드로 구현한 것, 각 스키마에 관련 테이블을 생성해 자료 관리
  - 테이블: RDBMS에서 데이터를 저장하는 2차원 형태의 DB 객체
    <p align="center">
    <img src="https://github.com/user-attachments/assets/086cce89-63b6-4366-9319-20de897251aa" width="50%" /> </p><br>

- MySQL 프로그램 설치: <small>([링크](https://dev.mysql.com/downloads/windows/installer/))</small>
<p align="center">
<img src="https://github.com/user-attachments/assets/4c948383-2764-4b21-a109-60c86c744d8e" width="50%" /> </p><br>

- **SQL**
  - **DDL(Data Definition Language)**: 데이터 정의어 - CREATE, DROP, ALTER
    ```sql
    SELECT * FROM sakila.actor; -- Ctrl + Enter : 현재 커서가 있는 쿼리문만 실행 
    SELECT count(*) FROM sakila.actor; -- Ctrl + Shift + Enter : 모든 쿼리문 실행
    
    # 명령어는 대문자, DB/컬럼명/함수 등은 소문자로 작성
    # 리눅스에서는 대/소문자 구분, 윈도우에 깔린 MySQL은 대/소문자 구분 x
    
    CREATE database fisa; -- DB 생성, Ctrl + B : 쿼리를 보기좋게 정렬 
    -- RDBMS : 정형데이터 컬럼에 대한 상세 내용까지 적어야 함 
    
    CREATE table fisa.hello -- 테이블 생성
    	(name VARCHAR(20) NOT NULL,
         age INT);

    drop table fisa.hello;
    drop table if exists fisa.hello; -- 있으면 drop

    create database if not exists fisa; -- 없으면 create

    use fisa; -- DB 안으로 들어감
    show tables; -- fisa 안의 테이블만 보여줌 
    ```
  - **DML(Data Manipulation Language)**: 데이터 조작어 - SELECT, INSERT, UPDATE, DELETE
    - **TCL(Transaction Control Language**: 테이블 데이터 변경을 임시로 적용시킴 (취소가능)
  - **DCL(Data Control Language)**: 데이터 제어어 - GRANT, REVOKE, DENY
  - 주석을 달고 싶을때는 # 또는 -- 사용(ctrl+/), 여러 줄인 경우 /* 주석 */
  - 덮어쓰기 불가 -> drop으로 지우고 다시 쓸 수 o
<br><br>
- **데이터 타입, 자료형**: 더 빠르게 처리하기 위함 - 문자열/ 숫자형/ 날짜형
<br><br>
- **칼럼 생성 제약조건**
  - **NULL** 처리: 반드시 값이 들어가도록 설정
  - **기본키(Primary Key)**: 한 테이블에서 유일한 값이 들어가야 하는 칼럼에 지정(Null 허용x)
    - 한 테이블 당 1개만 생성 가능 
<br><br>
- **테이블 생성 주의사항**
  1) **식별자 명명규칙**: 길이, 사용 가능 문자 등에 따라 명명해야 함
  2) **테이블 제약조건**: 데이터 무결성 보장, 일관성 유지를 위한 규칙
     - NOT NULL
     - UNIQUE: 중복 X
     - FOREIGN KEY: 해당 열이 다른 테이블의 기본 키와 연결 (테이블 간 관계 설정 가능) 
     - CHECK: 해당 열이 지정 조건 만족
     - DEFAULT: 해당 열 값을 지정하지 않는 경우 기본값 설정
  3) **외래키 제약조건**: 테이블의 관계를 설정하고 무결성을 보장
     - FOREIGN KEY 제약 조건 추가 필요
       ```SQL
       FOREIGN KEY (열 이름) REFERENCES 참조하는 테이블(참조하는 열 이름)
       ```
     - 참조 무결성 제약 조건: 외래키 포함 테이블에서 참조되는 테이블의 기본 키 값이 존재하지 않는 경우. 데이터를 입력하거나 수정할 수 없도록 함
<br><br>
       


***

<small>(DBMS 이미지 출처: [링크](https://www.geeksforgeeks.org/types-of-databases/))</small><br>
<small>(MySQL 이미지 출처: [링크](https://thebook.io/080268/0015/))</small>


