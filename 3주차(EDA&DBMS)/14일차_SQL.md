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
<br>

- **SQL함수**: 특정 연산을 수행하고 그 결과를 반환
  - 숫자형 함수: 연산 대상과 변환값이 숫자형 (ABS(), ROUND()..)
  - 문자형 함수: 연산 대상과 변환값이 문자형 (CONCAT(), SUBSTRING()..)
  - 날짜형 함수: 연산 대상과 변환값이 날짜형 (SYSDATE(), YEAR()...)
  - 형변환 함수, 집계 함수, 윈도우 함수 등 여러 종류의 함수 사용 가능
<br><br>
- **Join**: 다수 table 간에 공통 데이터(컬럼단위)를 기준으로 결합
  - 조인하는 테이블에는 같은 값을 가진 칼럼 필요
  - 2개 이상 조인 가능
  - 조인 시 테이블에 대한 별칭(As, Alias) 사용
  - 조인 시 조인 조건 필요 
  <p align="center">
  <img src="https://github.com/user-attachments/assets/f581a4db-87e2-4ba1-84b1-56b38a7adc16" width="50%" /> </p>


***
