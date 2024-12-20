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

-- ALL 연산자 사용해서 동일 결과 만들기
SELECT EMPNO, ENAME, SAL
FROM EMP
	WHERE SAL < ALL(
		SELECT SAL
		FROM EMP
			WHERE DEPTNO = 30
		);
	
-- 직책이 'MANAGER'인 사원 보다 많은 급여 받는 사원의 사원번호, 이름, 급여, 부서이름 출력
SELECT e.EMPNO, e.ENAME, e.SAL, d.DNAME
FROM EMP e JOIN DEPT d
ON e.DEPTNO = d.DEPTNO
	WHERE e.SAL > ALL(
		SELECT SAL
		FROM EMP
			WHERE JOB = 'MANAGER'
		);
		
-- EXISTS : 서브쿼리의 결과 값이 하나이상 존재하면 TRUE
SELECT *
FROM EMP
	WHERE EXISTS (
		SELECT DNAME
		FROM DEPT
			WHERE DEPTNO = 40
		);
		
-- 다중열 서브 쿼리 : 서브 쿼리의 결과가 두 개 이상의 컬럼으로 반환되어 메인 쿼리에 전달하는 쿼리
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
	WHERE (DEPTNO, SAL) IN (
		SELECT DEPTNO,SAL
		FROM EMP
			WHERE DEPTNO = 30
		);

-- 각 부서별 최고 급여 받는 사원의 정보 출력
SELECT *
FROM EMP
	WHERE (DEPTNO, SAL) IN (
		SELECT DEPTNO, MAX(SAL)
		FROM EMP
		GROUP BY DEPTNO
	);

-- FROM 절에 사용하는 서브 쿼리 : *인라인뷰 라고 하기도 함
-- 테이블 내 데이터 규모가 너무 크거나 현재 작업에
-- 불필요한 열이 너무 많아 일부 행과 열만 사용하고자 할 때 유용
SELECT e10.EMPNO, e10.ENAME, e10.DEPTNO, d.DNAME, d.LOC
FROM (
	SELECT *
	FROM EMP
	WHERE DEPTNO = 10) e10
JOIN DEPT d
ON e10.DEPTNO = d.DEPTNO;
			
SELECT e10.EMPNO, e10.ENAME, e10.DEPTNO, d.DNAME, d.LOC
FROM (
	SELECT ENAME, EMPNO, DEPTNO
	FROM EMP
	WHERE DEPTNO = 10) e10
JOIN DEPT d
ON e10.DEPTNO = d.DEPTNO;

-- 먼저 정렬하고 해당 갯수만 가져 오기 : 급여가 많은 5명에 대한 정보 보여줘
SELECT ROWNUM, ENAME, SAL
FROM (
	SELECT *
	FROM EMP
	ORDER BY SAL DESC
)
	WHERE ROWNUM <= 5;
			
-- SELECT 절에 사용하는 서브쿼리 : 단일행 서브쿼리를 *스칼라 서브쿼리 라고 함
-- SELECT 절에 명시하는 서브쿼리는 반드시 하나의 결과만 반한하도록 작성해야 함
SELECT EMPNO, ENAME, JOB, SAL,
	(
		SELECT GRADE
		FROM SALGRADE
			WHERE e.SAL BETWEEN LOSAL AND HISAL
	) AS "급여 등급",
    DEPTNO AS "부서 번호",
    (
    	SELECT DNAME
    	FROM DEPT d
    		WHERE e.DEPTNO = d.DEPTNO
    ) AS "부서 이름"
FROM EMP e
ORDER BY "급여 등급";

-- 조인으로 바꾸기
SELECT e.EMPNO, e.ENAME, e.JOB, e.SAL, s.GRADE AS "급여 등급", d.DEPTNO, d.DNAME
FROM EMP e -- EMP 기준으로 SALGRAE 조인, DEPT 조인, EMP기준으로 각각 조인
JOIN SALGRADE s
ON e.SAL BETWEEN s.LOSAL AND s.HISAL -- 비등가 조인일 경우 조건문이 와야함 
JOIN DEPT d
ON e.DEPTNO = d.DEPTNO -- 등가 조인일 경우 같은 공통 컬럼사용
ORDER BY "급여 등급";

-- 부서 위치가 NEW YORK인 경우에는 본사, 그 외는 분점으로 반환하도록 만들기
SELECT EMPNO, ENAME,
	CASE 
		WHEN DEPTNO = (
			SELECT DEPTNO
			FROM DEPT
				WHERE LOC = 'NEW YORK') THEN '본사'
			ELSE '분점'
	END AS "소속" 
FROM EMP
ORDER BY "소속";

-- 연습 문제 1번 
-- 전체 사원 중 ALLEN과 같은 직챙(JOB)인 사원들의 사원 정보, 부서 정보를
-- 다음과 같이 출력하는 SQL문을 작성하세요. (직책, 사원번호, 사원이름, 급여, 부서번호, 부서 이름)
SELECT e.*, d.*
FROM EMP e
JOIN DEPT d
ON e.DEPTNO = d.DEPTNO
WHERE JOB = (
	SELECT JOB
	FROM EMP
		WHERE ENAME = 'ALLEN'
	);


-- 연습 문제 2번
-- 전체 사원의 평균 급여(SAL)보다 높은 급여를 받는 사람들의 사원정보, 부서 정보,
-- 급여 등급 정보를 출력하는 SQL문을 작성하세요.
-- (단 출력할 때 급여가 많은 순으로 정렬하되 급여가 같을 경우에는)
-- 사원 번호를 기준으로 오름차순으로 정렬하세요).
-- (사원번호, 이름, 입사일, 급여, 급여 등급, 부서이름, 부서위치)
SELECT e.EMPNO AS "사원번호",
	e.ENAME AS "사원이름",
	e.HIREDATE AS "입사일",
	e.SAL AS "급여",
	s.GRADE AS "급여 등급",
	d.DNAME AS "부서이름",
	d.LOC
FROM EMP e
JOIN SALGRADE s 
ON e.SAL BETWEEN s.LOSAL AND s.HISAL
JOIN DEPT d 
ON e.DEPTNO = d.DEPTNO
	WHERE e.SAL > (
	SELECT AVG(SAL)
	FROM EMP)
ORDER BY "급여" DESC, "사원번호";

-- 연습 문제 3번
-- 10번 부서에 근무하는 사원 중 30번 부서에는 존재하지 않는 직책을 가진 사원들의 사원 정보,
-- 부서 정보를 다음과 같이 출력하는 SQL문을 작성하세요.
-- (사원번호, 사원이름, 직책, 부서번호, 부서이름, 부서위치)
SELECT e.EMPNO, e.ENAME, e.JOB, d.DEPTNO, d.DNAME, d.LOC
FROM EMP e
JOIN DEPT d 
ON e.DEPTNO = d.DEPTNO
	WHERE e.DEPTNO = 10
	AND JOB NOT IN(
	SELECT JOB
	FROM EMP
	WHERE DEPTNO = 30
	);
	
-- 연습 문제 4번
-- 직책이 SALESMAN인 사람들의 최고 급여보다 높은 급여를 받는 사원들의 사원 정보,
-- 급여 등급 정보를 다음과 같이 출력하는 SQL문을 작성하세요.
-- (단, 서브쿼리를 활용할 때 다중행 함수를 사용하는 방법과
-- 사용하지 않는 방법을 통해 사원 번호를 기준으로 오름차순으로 정렬하세요.)
-- (사원번호, 사원이름, 급여, 급여 등급)
SELECT e.EMPNO, e.ENAME, e.SAL, s.GRADE
FROM EMP e JOIN SALGRADE s
ON e.SAL BETWEEN s.LOSAL AND s.HISAL
	WHERE e.SAL > ALL (
	SELECT SAL
	FROM EMP
		WHERE JOB = 'SALESMAN'
	)  
ORDER BY e.EMPNO;