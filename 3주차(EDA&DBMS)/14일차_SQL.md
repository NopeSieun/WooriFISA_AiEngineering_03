###  07.25 (14일차)
---
교육 내용: SQL 
---
아침에 목이 아파서 목캔디 입에 넣고 출발했는데 도착할 때 까지 안 녹아서 목 대신 혀가 시원해진 듯. 2주차 학습일지 우수작성자로 선정되었다. 열심히 쓴 보람이 있다. 초등학생 때도 숙제라서 몰아 썼던 일기를 처음으로(짧지만) 매일 써보고, 좀 부지런한 사람이 된 것 같은 기분을 느낄 수 있었다. 그치만 일찍 일어난 새가 피곤해서 벌레 잡을 힘도 없다고..(?
<p align="center">
<img src="https://github.com/user-attachments/assets/3fbca976-0a3a-42e6-b864-666c2f3e6b98" width="50%" /> </p>

<br><br>

- 다른 사람과 함께 정형데이터를 관리할 때 (CRUD) SQL 사용<br><br>
- DBMS 안에 스키마(DB)가 여러개 있고, 테이블을 만들어서 관리
  - 스키마에는 테이블과 테이블을 효과적으로 사용하기 위한 객체들 <br><br>
- SQl **집계함수**: group by를 활용하여 집계 가능 
  ```sql
  -- # 2019년 개봉 영화의 유형별 최대, 최소 매출액과 전체 매출액 집계하기
  SELECT 
    movie_type, MAX(sale_amt) AS 최대매출액, MIN(sale_amt) 최소매출액, SUM(sale_amt) "전체매출액"
  FROM
      fisa.box_office
  WHERE YEAR(release_date) = 2019 and movie_type is not null
  GROUP BY movie_type
  HAVING max(sale_amt) > 20000000 -- group by로 묶은 결과를 바탕으로 특정 조건 추출
  ORDER BY min(sale_amt)
  LIMIT 1;
  ```
  <br>
- **ROLLUP**: 명시한 컬럼별로 GROUP BY한 결과를 전체 집계해주는 명령어
  ```sql
  SELECT 
  	 movie_type, MAX(sale_amt) AS 최대매출액, MIN(sale_amt) 최소매출액, SUM(sale_amt) "전체매출액"
  FROM
      fisa.box_office
  WHERE release_date LIKE '2019%' AND movie_type IS NOT NULL -- IS NULL, IS NOT NULL
  GROUP BY movie_type
  WITH ROLLUP;
  ```
  <p align="center">
  <img src="https://github.com/user-attachments/assets/f36b3332-7de2-4484-90fe-63d3783a8693" width="50%" /> </p>

<br>

- **SQL함수**: 특정 연산을 수행하고 그 결과를 반환
  - 숫자형 함수: 연산 대상과 변환값이 숫자형 (ABS(), ROUND()..)
  - 문자형 함수: 연산 대상과 변환값이 문자형 (CONCAT(), SUBSTRING()..)
  - 날짜형 함수: 연산 대상과 변환값이 날짜형 (SYSDATE(), YEAR()...)
  - 형변환 함수, 집계 함수, 윈도우 함수 등 여러 종류의 함수 사용 가능
<br><br>

- **CAST**: 형 변환 함수 
  ```SQL
  -- int('10') type casting 
  SELECT CAST(10 AS CHAR)                 CONV_CHAR,
         CAST('-10' AS SIGNED)           CONV_INT, -- 양수, 음수 다 받는 자료형 
         CAST('10.2131' AS DECIMAL)       CONV_DEC1,
         CAST('10.2131' AS DECIMAL(6, 2)) CONV_DEC2, -- 고정소수점(최대몇자리, 소수점 이하 몇자리) 
         CAST('10.2131' AS DOUBLE)        CONV_DOUBLE, -- 부동소수점 -> 약간 오차 발생 
         CAST('2021-10-31' AS DATE)       CONV_DATE,
         CAST('2021-10-31' AS DATETIME)   CONV_DATETIME;
  ```  
  <p align="center">
  <img src="https://github.com/user-attachments/assets/4b4dfe67-77e2-4727-a4bb-b9a523d563eb" width="60%" /> </p>

  - **CONVERT()**: CAST() 함수와 마찬가지로 형 변환하지만 AS Type 대신 type을 두 번째 매개변수로 받음<br><br>
- **흐름제어 함수**: 특정 조건에 부합하는 경우와 아닌 경우 다른 값 반환
  - IF(), IFNULL(), NULLIF()
    ```sql
    SELECT IF(2 < 1, 1, 0) IF1,  -- IF(조건, 참일때 리턴값, 거짓일 때 리턴값)
           IF('A' = 'a', 'SAME', 'NOT SAME') IF2, -- window의 MYSQL에서는 대소문자 구분 X 
           IF(1 = 2, 1, 'A') IF3;
    ```
    ```sql
    -- NULLIF() 함수는 두 매개변수 expr1과 expr2 값이 같으면 NULL을, 같지 않으면 expr1을 반환
    SELECT NULLIF(1, 1) NULLIF1,
           NULLIF(1, 0) NULLIF2,
           NULLIF(NULL, NULL) NULLIF3;
    ```
<br>

- **CASE문**: 조건문
  CASE 값, WHEN 명제, 참이면 THEN 출력
  ```sql
  SELECT WHEN 25 BETWEEN 1 AND 19 THEN '10대'
         WHEN 25 BETWEEN 20 AND 29 THEN '20대'
         WHEN 25 BETWEEN 30 AND 39 THEN '30대'
         ELSE '30대 이상'
  END CASE3; -- END 해당 조건을 부르기 위한 ALIAS
  ```
  <br>

- MySQL에서는 DATABASE()와 SCHEMA()가 동일<br><br>
- sql에는 함수 뿐 아니라 **변수**도 존재함
  - **SET @변수이름 = 변수의 값;** -> 변수 선언 및 값 대입
  - **SELECT @변수이름;** -> 변수의 값 출력
    ```sql
    set @country_name = 'AGO';
    
    select * from world.country where code = 'AGO';
    select * from world.country where code = @country_name; -- 동일한 결과
    ```
  - group by, having 절에서는 동작 x
  - 여러개의 쿼리문을 동적으로 변경하고 싶을 때 사용 
    <br>
    - 쿼리명을 미리 동적으로 준비해둘 수 있음
      ```sql
      SET @count = 5;
      PREPARE mySQL FROM 'SELECT code, name, continent, region, population
        FROM world.country
       WHERE population > 100000000
       ORDER BY 1 ASC
       LIMIT ?';
      EXECUTE mySQL USING @count;
      ```
<br>

- **Join**: 다수 table 간에 공통 데이터(컬럼단위)를 기준으로 결합
  - 조인하는 테이블에는 같은 값을 가진 칼럼 필요
  - 2개 이상 조인 가능
  - 조인 시 테이블에 대한 별칭(As, Alias) 사용
  - 조인 시 조인 조건 필요 
  <p align="center">
  <img src="https://github.com/user-attachments/assets/f581a4db-87e2-4ba1-84b1-56b38a7adc16" width="40%" /> </p><br>

- **동등조인**: 동등비교 연산자 사용
  - 사용 빈도 가장 높음
  - 테이블에서 같은 조건이 존재할 경우의 값 검색
  - 조인하는 두 테이블에 중복된 컬럼명이 있으면 컬럼이 속한 테이블 명시
    ```sql
    -- 출처를 명시해야 좋은 쿼리 
    select e.empno, e.ename, e.job, e.mgr, e.hiredate, e.sal, e.comm, e.deptno, d.dname, d.loc
    from emp e, dept d -- 별명 설정
    where e.deptno = d.deptno ; -- 나머지 절에서 별명 사용
    ```
<br>

- **not-equal 조인**: 100% 일치하지 않고 특정 범위 내 데이터 조인 시 사용 (between ~ and)
  ```sql
  select e.empno, e.ename, e.sal, s.grade, s.losal, s.hisal
  from emp e, salgrade s
  where e.sal between s.losal and s.hisal;
  ```
  <br>

- **self 조인**: 동일 테이블 내에서 진행되는 조인
  ```sql
  select e.ename, e.job, e.deptno
  from emp e, emp m
  where m.mgr = e.empno and m.ename = 'KING';
  ```
<br>

- **outer 조인**: 조인시 조인 조건이 불충분해도 검색 가능하게 하는 조인(두 개 이상 조인될 때)
   - 특정 데이터가 모든 테이블에 존재하지 않고 컬럼은 존재하나 null값을 보유한 경우 검색되지 않는 문제를 해결하기 위함
     ```sql
     SELECT * 
     FROM emp e RIGHT OUTER JOIN dept d
     ON e.deptno = d.deptno;
     ```
     ```sql
     SELECT * 
     FROM dept d LEFT OUTER JOIN emp e
     ON e.deptno = d.deptno;
     ```

- 목적에 따라 조인의 종류를 다르게 해서 사용
  ```sql
  -- 모든 사원명, 매니저 명 검색,  
  -- INNER JOIN은 두 테이블 컬럼에 모두 있어야만 출력. NULL인 값은 조회하지 않습니다 
  SELECT e.ename 팀원, m.ename 매니저명 
  FROM emp e, emp m 
  where e.mgr = m.empno; -- 일치하지 않는 경우는 제외, king은 mgr값이 null이라서 걸러짐 
  
  -- 모든 사원명(KING포함), 매니저 명 검색, 
  -- 단 매니저가 없는 사원(KING)도 검색되어야 함
  -- LEFT JOIN 사용
  SELECT e.ename 팀원, m.ename 매니저명 
  FROM emp e LEFT JOIN emp m 
  on e.mgr = m.empno;
  ```
  <p align="center">
  <img src="https://github.com/user-attachments/assets/9c7f1aa3-7bed-409b-b17f-52134183df54 " width="30%" /> </p><br>

- **실행 순서 주의**: from - where - group by - having - select - order by - limit 순으로 실행됨
  ```sql
  select d.deptno, d.dname, d.loc, e.empno, e.ename, e.job, e.mgr, e.hiredate, e.sal, e.comm
  from dept d left join emp e on d.deptno = e.deptno and e.sal >= 3000;  -- 정답 
  ```
  ```sql
  select d.deptno, d.dname, d.loc, e.empno, e.ename, e.job, e.mgr, e.hiredate, e.sal, e.comm
  from dept d left join emp e on d.deptno = e.deptno 
  where e.sal >= 3000; -- 잘못 출력됨 
  ```
<br>

- **null값 주의**: null은 값 없음이므로 어떤 연산/함수가 들어가도 null이 리턴됨
  ```sql
  select d.dname, e.ename, e.sal, e.comm
  from emp e, dept d 
  where d.dname = 'SALES' AND (sal + comm) >= 2000; 
  -- null은 값 없음이므로 어떤 연산 /함수가 들어가도 null이 리턴됨 
  ```
  <p align="center">
  <img src="https://github.com/user-attachments/assets/0ec59f32-4440-4208-8873-d3b651b21f3b " width="50%" /> </p><br>


  ```sql
  select * from emp 
  where (sal + ifnull(comm, 0))>=2000;
  ```
 <p align="center">
  <img src="https://github.com/user-attachments/assets/4d606ef5-cf2b-4db0-8918-2f979010ec37 " width="50%" /> </p><br>


***
