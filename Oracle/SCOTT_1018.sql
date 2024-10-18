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
SELECT *
FROM EMP
	WHERE SAL > (
	SELECT SAL
	FROM EMP
		WHERE ENAME = 'JONES'
	);