###  07.25 (14일차)
---
교육 내용: SQL 
---
아침에 목이 아파서 목캔디 입에 넣고 출발했는데 도착할 때 까지 안 녹아서 목 대신 혀가 시원해진 듯. 2주차 학습일지 우수작성자로 선정되었다. 열심히 쓴 보람이 있다. 처음으로 맨날 일기도 쓰고(?) 좀 부지런한 사람이 된 것 같은 기분을 느낄 수 있었다. 
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
  ```
  WITH ROLLUP;
***
