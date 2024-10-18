-- 서브쿼리 : 다른 SQL 쿼리문 내에 포함되는 쿼리문을 말함
-- 주로 데이터를 필터링 하거나 데이터 집계에 사용
-- 서브쿼리는 SELECT, INSERT, UPDATE, DELETE문에 모두 사용 가능
-- 단일행 서브쿼리와 다중행 서브쿼리가 있음 (단일행서브쿼리는 결과가 1개,다중행서브쿼리는 결과가 다수)
-- 단일행 서브쿼리 (단 하나의 행으로 결과를 반환)
-- 다중행 서브쿼리 (여러행의 결과를 반환)

-- 특정한 사원이 소속된 부서의 이름을 가져오기
SELECT DNAME AS "부서이름" -- 메인쿼리
FROM DEPT
	WHERE DEPTNO = (
		SELECT DEPTNO -- 서브쿼리
		FROM EMP
			WHERE ENAME = 'KING'
		);
-- 서브쿼리로 'JONES'의 급여보다 높은 급여를 받는 사원 정보 출력
-- 등가 조인을 사용해서 구현
SELECT DNAME
FROM EMP e JOIN DEPT d
ON e.DEPTNO = d.DEPTNO
	WHERE e.ENAME = 'KING'
	
-- 서브쿼리로 'JONES'의 급여보다 높은 급여를 받는 사원 정보 출력
SELECT *
FROM EMP
	WHERE SAL > (
	SELECT SAL
	FROM EMP
		WHERE ENAME = 'JONES'
	);

-- 자체 조인(SELF)으로 풀기
SELECT e1.*
FROM EMP e1
JOIN EMP e2
ON e1.SAL > e2.SAL
	WHERE e2.ENAME = 'JONES'; 

-- 서브쿼리는 연산자와 같은 비교 또는 조회 대상의 오른쪽에 놓이며 괄호()로 묶어서 구현
-- 특정한 경우를 제외하고는 ORDER BY 절을 사용할 수 없음
-- 서브쿼리의 SELECT절에 명시한 열은 메인 쿼리의 비교 대상과 같은 자료형과 같은 개수로 지정해야됨

-- 문제 : EMP 테이블의 사원 정보 중에서 사원이름이 ALLEN인 사원의 추가 수당 보다 많은 사원 정보 출력
SELECT *
FROM EMP
	WHERE COMM > (
	SELECT COMM
	FROM EMP
		WHERE ENAME = 'ALLEN'
	);
	
-- 문제 : JAMES 보다 먼저 입사한 사원들의 정보 출력
SELECT *
FROM EMP
	WHERE HIREDATE < (
	SELECT HIREDATE
	FROM EMP
		WHERE ENAME = 'JAMES'
	);
	
-- 문제 : 20번 부서에 속한 사원 중 전체 사원의 평균 급여 보다 높은 급여를 받는 사원 정보와 소속부서 조회
SELECT e.EMPNO, e.ENAME, e.SAL, d.DEPTNO, d.DNAME, d.LOC
FROM EMP e JOIN DEPT d
ON e.DEPTNO = d.DEPTNO
	WHERE e.DEPTNO = 20
	AND e.SAL > (
		SELECT AVG(SAL)
		FROM EMP
	); 
	
-- 실행 결과가 여러개인 다중행 서브쿼리
-- IN : 메인 쿼리의 데이터가 서브쿼리의 결과 중 하나라도 일치 데이터가 있다면 TRUE
-- ANY, SOME : 메인 쿼리의 조건식을 만족하는 서브쿼리의 결과가 하나 이상이면 TRUE
-- ALL : 메인 쿼리의 조건식을 서브쿼리의 결과 모두가 만조하면 TRUE
-- EXISTS : 서브쿼리의 결과가 존재하면 (즉, 한개 이상의 행이 결과를 만족하면)

-- 각 부서별 최고 급여와 동일한 급여를 받는 사원 정보 출력 (IN 연산자)
-- 메인쿼리에 급여가 서브 쿼리에서 각 부서의 최대 급여가 같은 사원의 모든 정보가 출력
SELECT *
FROM EMP
	WHERE SAL IN(
		SELECT MAX(SAL)
		FROM EMP
		GROUP BY DEPTNO
	)	
ORDER BY DEPTNO;

-- ‘SALESMAN’들의 최소 급여보다 많이 받은 급여를 받는 사원을 조회
SELECT EMPNO, ENAME, SAL
FROM EMP
	WHERE SAL > ANY(
		SELECT SAL
		FROM EMP
			WHERE JOB = 'SALESMAN'
		);

-- ‘SALESMAN’들의 급여와 같은 급여를 받는 사원을 조회
SELECT EMPNO, ENAME, SAL
FROM EMP
	WHERE SAL = ANY(
		SELECT SAL
		FROM EMP
			WHERE JOB = 'SALESMAN'
		);

-- 30번 부서 사원들의 급여 보다 적은 급여를 받는 사원 정보 출력
SELECT EMPNO, ENAME, SAL
FROM EMP
	WHERE SAL < (
		SELECT MIN(SAL)
		FROM EMP
			WHERE DEPTNO = 30
		);

SELECT EMPNO, ENAME, SAL
FROM EMP
	WHERE SAL < ALL(
		SELECT MIN(SAL)
		FROM EMP
			WHERE DEPTNO = 30
		);
	