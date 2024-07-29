###  07.29 (16일차)
---
교육 내용: DBMS
---
주말에 제대로 못 쉬었더니 너무 피곤하다.. 오늘부터 바뀐 자리에서 수업 듣는데 에어컨 바람이 바로 내려와서 춥다. 간만에 고망고 먹었는데 점심을 너무 많이 먹어서 배가 터질 것 같다. 이번 주는 평일 약속이 좀 잡혀있는데 체력 관리를 잘해야 할 것 같다. 그리고 커피를 안 마셨더니 너무 졸리다. 
<p align="center">
<img src="https://github.com/user-attachments/assets/4d7bab2a-008b-43eb-99ed-0d6502c88e4f" width="30%" /> </p><br>


<br><br>
- **TRUNCATE**: 테이블 안의 모든 값 삭제
<br><br>
- **ON DUPLICATE KEY UPDATE**: 충돌이 발생하는 로우에서는 신규로 값을 입력하는 것이 아니라 기존 저장된 값을 변경
  ```SQL
  -- 만약 중복되는 값이 있으면 변결 
  insert into emp01 values(1, 800.00, '2011-01-10', '김연지', 10)
  ON DUPLICATE KEY UPDATE empno=99;
  ```
<br>

- **제약조건**
  - **PK[primary key]**: 기본키, 중복불가, null불가, 데이터 구분을 위한 핵심 데이터(unique)
    ```sql
    -- emp02의 구조를 떠와서 primary key로 empno 설정, ename은 unique 제약조건으로 설정 
    drop table emp03;
    
    CREATE TABLE emp03(
    	empno int primary key,
        ename varchar(10) unique);
    -- 첫 번째 방법 
    
    drop table emp03;
    
    CREATE TABLE emp03(
    	empno int,
        ename varchar(10),
        constraint pk_empno_emp03 primary key (empno),
        constraint uk_enmae_emp03 unique (ename)
        );
    -- 두 번째 방법 (가독성이 더 좋음)
    ```

  - **not null**: 데이터 반드시 존재
  - **unique**: 중복 불가(null 가능), 컬럼에만 영향을 주는 제약조건
    ```sql
    alter table fisa.emp02 modify empno int unique;
    alter table fisa.emp02 add unique (ename); -- 자료형 생략 가능
    ```
  - **check**: 규정한 범위의 데이터만 테이블에 저장 가능(ex. 나이는 음수가 있을 수 없음)
    ```sql
    CREATE TABLE emp05(
    	empno int primary key,
        ename varchar(10) not null,
        age int,
        check (age between 1 and 100) 
    );
    ```
  - **default**: 컬럼에 기본값 설정(초기화)
    ```sql
    CREATE TABLE emp05(
    	empno int primary key,
        ename varchar(10) not null,
        age int default 1 -- 0 
    );
    ```
  - **FK(foreign key)**: 외래키, 다른 테이블의 pk를 참조
    - pk를 보유한 테이블이 부모, 참조하면 자식
    - 부모테이블을 참조해서 자식 테이블이 돌아가는 구조 
<br<br>

- **제약조건 적용 방식**
  1. table 생성시 적용: create table의 마지막 부분에 설정
      ```sql
  			-- 방법1 - 제약조건명 없이 설정
  			-- 방법2 - constraints 제약조건명 명시
              create table people (
  				컬럼명 자료형 제약조건 
                  );
                  
  			create table people(
  				컬럼명 자료형 
                  ) constraint 제약조건명 제약조건 (컬럼);
      ```
  3. **alter** 명령어 사용: 이미 존재하는 table의 제약조건 수정(추가, 삭제)명령어
     ```sql
     alter table 테이블명 add/modify 컬럼명 타입 제약조건;
     ```
  5. 제약조건 삭제 (drop)
     ```sql
     alter table 테이블명 alter 컬럼명 drop 제약조건;
     ```
<br>

- **Data Dictionary**: 제약 조건들의 정보 확인
  - MySQL 서버의 개체의 모든 정보 보유하는 테이블 
  - information_schema
    <p align="center">
    <img src="https://github.com/user-attachments/assets/0541c72b-551d-4686-8766-a327bdec868b" width="30%" /> </p><br>

- **CASCADE**: 참조하는 테이블에 해당 외래 키 값이 존재하면 삭제/업데이트 허용
  ```SQL
  ALTER TABLE emp DROP CONSTRAINT fk_emp_dept2;
  ALTER TABLE emp 
  ADD CONSTRAINT fk_emp_dept2 FOREIGN KEY ( deptno ) REFERENCES dept( deptno ) 
  ON DELETE CASCADE ON UPDATE CASCADE;
  ```
<br>

- **원본 테이블 복사**: create ~ select 문 사용
  ```sql
  CREATE TABLE emp02 SELECT * from emp01 WHERE 1=0;
  -- 1=0: 구조만 가지고옴(내용x) 
  ```
<br>

- **인덱스**: 데이터 조회시 결과가 빠르게 나올 수 있도록 사용해줌
  ```sql
  create index idx_emp01_empno on emp01(empno);
  ```
  - 클러스터형 인덱스: 기본 키를 기준으로 생성됨 (한 테이블 당 하나만 생성)
    ```SQL
    CREATE TABLE usertbl 
    ( userID  char(8) NOT NULL PRIMARY KEY, -- CLUSTER INDEX 자동 생성 
      name    varchar(10) NOT NULL,
      birthYear   int NOT NULL,
      addr    nchar(2) NOT NULL 
     );
    ```
    <p align="center">
      <img src="https://github.com/user-attachments/assets/d571bd7f-3428-4280-8ae5-809a93afcb92" width="50%" /> </p>
      
  - 보조 인덱스: 기본 키 이외의 다른 열을 기준으로 생성 (여러 개 생성 가능)
<br><br>
- **윈도우함수**: 행-행 간 비교, 연산, 정의를 위한 함수
  1) RANK: 특정 컬럼의 순위를 구할 때 사용
     - 동일 값일 경우 같은 순위 부여, 중간 순위 비움
       ```sql
       select ename, job, deptno, sal, rank() over (partition by job order by sal desc) 부서별임금순위 from emp;
       ```
    <p align="center">
    <img src="https://github.com/user-attachments/assets/9c7c5a06-4350-46e9-8006-180eb47be421" width="50%"/> </p>

  2) DENSE_RANK (밀집, 밀도): 동일 값일 때 같은 순위를 부여하고 중간 순위를 비우지 x
    <p align="center">
    <img src="https://github.com/user-attachments/assets/8433f5b9-3763-4bd3-82b2-e85740ed7341" width="50%"/> </p>

  3) ROW_NUMBER: 동일 값에도 고유 순위 부여
    <p align="center">
    <img src="https://github.com/user-attachments/assets/df28929f-a426-4d76-ae45-5a8ddfdc4f1e" width="50%"/> </p>

***
<br> 
