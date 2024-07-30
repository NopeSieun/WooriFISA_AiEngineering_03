###  07.00 (17일차)
---
교육 내용: 고급 SQL, ERD
---
출근할 때 탄 버스에서 내가 마지막 좌석을 차지한 사람이 돼서 좀 뿌듯했다. 근데 자다가 버스 의자 작은 틈 사이로 핸드폰 빠져서 완전 당황했는데 뒤에 앉으신 분이 주워주셨다. 어떻게 주워주신거지..? 요즘 배우는 sql은 뭔가 내가 알던 sql이 아닌 느낌.. 나 취업 어떻게 하냐며.. 오늘은 미니 프로젝트를 진행했는데 너무 어려웠지만 다들 잘 하셔서 많이 배우 느낌이었다. 생각보다 시간이 엄청 빨리 간 것 같다. 나도 코딩 잘하고 싶다. 
<p align="center">
<img src="https://github.com/user-attachments/assets/1197d402-fe92-4df4-9901-6ba3ddedd4c2" width="30%" /> </p><br>
<p align="center">오둥이 팬분이 주신 오둥 스티커</p>
<br><br>
- **스토어드 프로시저(Stored Procedure)**: 주 사용하는 여러개의 SQL문을 한데 묶어 함수처럼 만들어 일괄적으로 처리
  - 하나의 요청으로 여러 SQL문 실행 가능
  - 독립적으로 실행 -> 다른 sql문에서 직접 사용 x
  - DELIMITER < BEGIN <<SQL문>> END > DELIMITER
    ```sql
    -- gender가 'man'인 학생들의 수를 세는 스토어드 프로시저 예제
    DELIMITER //
    CREATE PROCEDURE count_men()
    BEGIN
        DECLARE count INT;
        SELECT COUNT(*) INTO count FROM students WHERE gender = 'man';
        IF count > 3 THEN
            SELECT 'Many men' AS result;
        ELSE
            SELECT 'Few men' AS result;
        END IF;
    END //
    DELIMITER ;
    ``` 
<br>

- **SQL 함수**: 특정 작업을 수행하고 값을 반환 (단일 값/테이블 형식)
  ```sql
  DELIMITER $$
  
  CREATE FUNCTION employees_hireyear()
  RETURNS INT 
  DETERMINISTIC
  BEGIN
    DECLARE employee_count INT;
      
    -- emp 테이블의 hiredate가 1984-01-01 00:00:00 보다 먼저인지 확인해서 개수를 세는 쿼리를 작성해주세요. 
      SELECT COUNT(*) INTO  employee_count
      FROM emp WHERE hiredate < '1984-01-01 00:00:00'; 
  
    RETURN employee_count;
  END $$

  DELIMITER ;

  SELECT employees_hireyear(); -- 함수를 호출해서 결과 확인 
  ```
<br>

- **TRIGGER**: 테이블에서 특정 이벤트(update, insert, delete) 발생 시, 추가 쿼리 작업들을 자동으로 수행할 수 있게끔 트리거를 미리 설정
  - 직접 실행은 불가, 이벤트 발생 시에만 작동 <-> 프로시저: 능동적 동작 
  - DML에서만 사용되며 MySQL의 VIEW에서는 사용 불가
  - BEFORE/AFTER: 명령 키워드가 사용된 후에 처리할지 아니면 끝난 후 처리할지 결정
    ```sql
    DELIMITER // 
    CREATE TRIGGER test_trg  -- 트리거 이름
        AFTER DELETE -- 삭제후에 작동하도록 지정
        ON market.orders -- 트리거를 부착할 테이블
        FOR EACH ROW -- 각 행마다 적용시킴
    BEGIN
    	SET @msg = '주문 정보가 삭제됨' ; -- 트리거 실행시 작동되는 코드들
    END // 
    DELIMITER ;
    ```
    ```sql
    DELETE FROM market.orders WHERE order_id=3;
    SELECT @msg;
    ```
    <p align="center">
    <img src="https://github.com/user-attachments/assets/d587d1ed-c011-4bd6-a46e-823dd13d7afe" width="30%" /> </p><br>

- **Partition**: 큰 테이블을 쪼갬 -> 물리적으로는 하나의 테이블, 논리적으로는 여러 개의 작은 테이블처럼 동작
  - 쿼리 성능 향상, 관리 용이성
  - 설계가 복잡해질 수 있음, 외래 키제약 조건 사용 불가  
  <br><br>
  - **ERD(Entity Relationship Diagram)**: 데이터 구조 파악을 위해 테이블 간 관계를 다이어그램으로 그려놓은 것
    - Entity: 데이터베이스에서 표현하고자 하는 객체
    - Relationship: Entity-Entity 사이 관계
    - Attribute: 객체 속성
    <p align="center">
    <img src="https://github.com/user-attachments/assets/520d4626-25dc-4194-91f5-dd286d1a65b0" width="60%" /> </p><br>

***
<br> 
