###  07.26 (15일차)
---
교육 내용: SQL 쿼리 (심화 명령어) 
---
버스에 앉았는데 의자가 저항없이 쭈욱 젖혀져서 아침부터 당황했다. 자리 뽑기 운 대박적.. 옆자리로 바꿔 앉았는데 다른 분이 앉으셨다가 나가고, 그 다음에 앉으시려는 분한테는 용기내서 고장났다고 말씀드렸는데 바로뒤에 오신 분은 헤드셋을 착용하고 계셔서 못 듣고 앉으셨다. 쭈우욱 내려가셨는데 필사적으로 못 본척 함.. 그 분은 다른 자리가 없어서 그냥 앉아가셨다. 신경쓰여서 옆에서 잠을 잘 못 잤다. 그래서 졸리다. 그치만 금요일이다. 그치만 내일도 수업이 있다........... 🚌 
<p align="center">
<img src="https://github.com/user-attachments/assets/d9b0ef8d-9858-4ddc-8cd1-a7fd0f198d2a" width="40%" /> </p>
<p align="center">같은반 코딩 전문가께서 아침에 주신 자두🍎</p>
<br><br>

- **서브쿼리**: 조회된 결과를 다시 집계하거나, 추가로 다른 테이블이나 결과 집합과 조인으로 정보 조회하는 방법 
  - JOIN으로도 다 되지만 속도 면에서 우월한 경우 多
    - JOIN은 모든 행을 돌면서 결과를 찾고, 서브쿼리는 내부쿼리 결과 -> 외부쿼리에서 조회
  - 메인쿼리(외부쿼리) 안에 포함된 독립적인 SELECT문
  - 서브쿼리 안에서는 외부쿼리의 테이블을 참조 가능
  - 메인쿼리에서 서브쿼리의 위치에 따라 구분
  - 유지보수가 어려운 단점 有
  1. **스칼라(scalar) 서브쿼리**: **SELECT절의 서브쿼리** -> 단일값 반환
     - SELECT 절에 단일 표현식(칼럼)이 와야하며 여러 개의 표현식 기술 불가
     - 외부쿼리에서는 내부쿼리에서 사용한 테이블을 참조할 수 x
       ```sql
        -- join으로 해결
        SELECT  e.ename, d.dname 
                  FROM dept d, emp e 
                 WHERE e.deptno = d.deptno;
        
        -- subquery로 해결
        SELECT e.ename, 
               (SELECT d.dname 
                  FROM dept d 
                 WHERE e.deptno = d.deptno) AS dep
          FROM emp e;
       ```
  2. **파생(derived) 테이블**: **FROM 절의 서브쿼리** -> 조건에 맞는 파생 테이블 반환
     - 별명 붙여서 외부쿼리에서 사용(필수)
     - 서브쿼리가 반환하는 결과 집합을 하나의 테이블처럼 사용하는 쿼리문
       ```sql
        SELECT a.deptno, a.dname, mgr.empno -- 각 부서의 매니저 번호
          FROM dept a,
          (SELECT b.deptno, b.empno, c.ename
           FROM emp b,
        		   emp c
        	WHERE b.empno = c.empno) mgr -- FROM 절 서브쿼리는 원본에서 재생성한 테이블이기 때문에 꼭 별칭을 가지는 게 문법 
         ORDER BY 1;       
       ```
  3. **WHERE 절의 서브쿼리**
     - 특정 데이터를 걸러내기 위한 일반 조건이나 조회 조건을 기술
       ```sql
       -- 부서별 sal이 가장 높은 사람
       
        select ename, sal, deptno from emp where sal in (select max(sal) from emp group by deptno)
        order by deptno;
       ```     
 <br><br>
- **서브쿼리의 연관성**
  - 연관성이 없다: 메인쿼리 벗어나도 동작
  - 연관성이 있다: 메인쿼리 벗어나면 동작 X
 <br><br>
- **IN 연산자**: 여러개 컬럼의 값을 비교해서 꺼낼 수 o (단 순서가 맞아야 함)
  <br><br>
- **EXISTS 연산자**: 메인쿼리 테이블의 값 중에서 서브쿼리의 결과 집합에 존재하는 건이 있는지를 확인하는 역할
  - 서브쿼리의 결과값이 존재하면 참
<br><br>
- **파생 테이블**: 서브쿼리가 길어서 잘 안 보이면 따로 빼줄 수 있음
  - CTE, Common Table Expression FROM 절에서는 사용하기 위한 파생 테이블의 별명을 붙여서 사용할 수 o
  -  FROM -> WHERE -> GROUP BY -> HAVING -> SELECT -> ORDER BY -> LIMIT
  -  행이 많으면 속도가 느려지기 때문에 가장 행을 앞단에서 줄일 수 있는 순서(테이블은 메인쿼리에서 먼저 가져옴)
    ```sql
    USE fisa;
    WITH mgr AS (SELECT b.deptno, b.empno, c.ename
    					  FROM emp b, emp c
    					 WHERE b.empno = c.empno
           ) -- AS 뒤에 있는 쿼리로 만들어진 테이블을 메인쿼리에서 mgr이라고 부르겠다 
           
    SELECT a.deptno, a.dname, mgr.empno
      FROM dept a, mgr -- mgr이라고 부르고 있습니다 
     WHERE a.deptno = mgr.deptno
     ORDER BY 1;
    ```
***
<br> 
