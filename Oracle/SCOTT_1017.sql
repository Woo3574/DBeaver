-- 다중행 함수 : 여러 행에 대해서 함수가 적용되어 하나의 결과를 나타내는 함수,집계
SELECT DEPTNO ,SUM(SAL) FROM EMP
GROUP BY DEPTNO;

-- 다중행 함수의 종류
-- SUM() : 지정한 데이터의 합을 반환, NULL값을 무시
-- COUNT() : 지정한 데이터의 개수를 반환
-- MAX() : 최대값 반환
-- MIN() : 최소값 반환
-- AVG() : 평균값 반환
SELECT SUM(DISTINCT SAL), SUM(SAL) FROM EMP; -- 중복된값을 제거 DISTINCT

--모든 사원에 대해서 급여와 추가 수당의 합을 구하기
SELECT SUM(SAL), SUM(COMM) FROM EMP;

-- 20번 부서의 모든 사원에 대해서 급여와 추가 수당의 합을 구하기
SELECT DEPTNO AS "20번 부서", SUM(SAL) AS "총 급여",
	SUM(COALESCE(COMM,0)) AS "총 추가 수당"
FROM EMP		
GROUP BY DEPTNO
	HAVING DEPTNO = 20;
	
-- 각 직책별로 급여와 추가 수당의 합 구하기
SELECT JOB "직책", SUM(SAL) AS "급여", SUM(COMM) AS "성과급" FROM EMP
	GROUP BY JOB;
	
-- 각 부서별 최대 급여를 받는 사원의  급여, 부서 출력하기
SELECT MAX(SAL) AS "최대급여", DEPTNO AS "부서" FROM EMP
	GROUP BY DEPTNO
	ORDER BY DEPTNO;
	
-- GROUP BY 없이 출력하려면?
SELECT MAX(SAL) FROM EMP WHERE DEPTNO = 10
UNION ALL
SELECT MAX(SAL) FROM EMP WHERE DEPTNO = 20
UNION ALL
SELECT MAX(SAL) FROM EMP WHERE DEPTNO = 30;

-- 부서 번호가 20인 사원중 가장 최근 입사자 출력하기
SELECT MAX(HIREDATE) FROM EMP E
	WHERE E.DEPTNO = 20;
	
-- 서브쿼리 사용하기 : 각 부서별 최대(MAX) 급여를 받는 사원의 사원번호, 이름, 직책, 부서번호 출력
SELECT MAX(SAL), DEPTNO FROM EMP
GROUP BY DEPTNO;

SELECT MAX(SAL) FROM emp e2
	WHERE e2.DEPTNO = 20;
	
SELECT EMPNO, ENAME, JOB, DEPTNO FROM EMP e 
	WHERE SAL = (
		SELECT MAX(SAL) FROM EMP e2
			WHERE e2.deptno = e.DEPTNO);

-- 각 직업 별 최대 급여를 받는 사원
SELECT EMPNO, ENAME, JOB, DEPTNO, SAL FROM EMP e 
	WHERE SAL = (
		SELECT MAX(SAL) FROM EMP e2
			WHERE e2.JOB = e.JOB);
		
-- HAVING 절 : 그룹화된 대상에 대한 출력 제한
-- GROUP BY 존재할 때만 사용 할수있음
-- WHERE 조건절과 동일하게 동작하지만, 그룹화된 결과 값의 범위를 제한 할 때 사용
SELECT DEPTNO, JOB, AVG(SAL)
FROM EMP 
	GROUP BY DEPTNO, JOB
		HAVING AVG(SAL) >= 2000
	ORDER BY DEPTNO;
	
-- WHERE절과 HAVING절 같이 사용하기
SELECT DEPTNO, JOB, AVG(SAL)       -- 5. 출력할 열 제한
FROM EMP					       -- 1. 먼저 테이블을 가져 옴
	WHERE SAL <= 3000              -- 2. 급여 기준으로 행 제한
	GROUP BY DEPTNO, JOB           -- 3. 부서별, 직책별 그룹화
		HAVING AVG(SAL) >= 2000    -- 4. 그룹내에서 행 제한
	ORDER BY DEPTNO, JOB;          -- 6. 그룹별, 직책별 오름차순 정렬
	
-- HAVING절 사용해서 EMP 테이블의 부서별 직책의 평균 급여가 500 이상인
-- 사원들의 부서, 직책, 부서별 직책의 평균 급여 출력
SELECT DEPTNO, JOB, AVG(SAL)
FROM EMP 
	GROUP BY DEPTNO, JOB
		HAVING AVG(SAL) >= 500
	ORDER BY DEPTNO, JOB;
	
-- 2.EMP 테이블을 이용하여 부서번호, 평균급여, 최고급여, 최저급여, 사원수를 출력,
-- 단, 평균 급여를 출력 할 때는 소수점 제외하고 부서 번호별로 출력
SELECT DEPTNO AS "부서번호",
	TRUNC(AVG(SAL)) AS "평균 급여",
	MAX(SAL) AS "최고급여",
	MIN(SAL) AS "최저급여",
	COUNT(*) AS "사원수"
FROM EMP
	GROUP BY DEPTNO
	ORDER BY DEPTNO;

--3.같은 직책에 종사하는 사원이 3명 이상인 직책과 인원을 출력
SELECT JOB AS "직책", COUNT(*) AS "사원수" 
FROM EMP
	GROUP BY JOB
		HAVING COUNT(*) >= 3;

-- 4.사원들의 입사 연도를 기준으로 부서별로 몇 명이 입사했는지 출력
SELECT EXTRACT(YEAR FROM HIREDATE) AS "입사 연도",
	DEPTNO "부서",
	COUNT(*) AS "사원수"
FROM EMP
	GROUP BY EXTRACT(YEAR FROM HIREDATE), DEPTNO
	ORDER BY "입사 연도";
	
--5.추가 수당을 받는 사원 수와 받지 않는 사원수를 출력(O, X로 표기 필요)
-- 추가수당 | 사원수
--   X      8
--   O      4
SELECT NVL2(COMM, 'O', 'X') AS "추가수당",
	COUNT(*) AS "사원수"
FROM EMP
GROUP BY NVL2(COMM, 'O', 'X');

SELECT
	CASE
		WHEN COMM IS NULL THEN 'X'
		WHEN COMM = 0 THEN'X'
		ELSE 'O'
	END AS "추가 수당",
	COUNT(*) AS "사원수"
FROM EMP
GROUP BY
	CASE
		WHEN COMM IS NULL THEN 'X'
		WHEN COMM = 0 THEN'X'
		ELSE 'O'
	END
ORDER BY "추가 수당";


-- 6.각 부서의 입사 연도별 사원 수, 최고 급여, 급여 합, 평균 급여를 출력 (집계함수빼고는 다 그룹으로 묶으면됨)
SELECT DEPTNO AS "부서번호",
	EXTRACT(YEAR FROM HIREDATE) AS "입사년도",
	COUNT(*) AS "사원수",
	MAX(SAL) AS "최고급여",
	SUM(SAL) AS "합계",
	ROUND(AVG(SAL)) AS "평균급여"
FROM EMP
GROUP BY DEPTNO, EXTRACT (YEAR FROM HIREDATE)
ORDER BY "부서번호", "입사년도";

-- 그룹화 관련 기타 함수 : ROLLUP (그룹화 데이터의 합계를 출력 할때 유용)
SELECT NVL(TO_CHAR(DEPTNO), '전체부서') AS "부서번호",
	NVL(TO_CHAR(JOB), '부서별 직책' )AS "직책",
	COUNT(*) AS "사원수",
	MAX(SAL) AS "최대급여",
	MIN(SAL) AS "최소급여",
	ROUND(AVG(SAL)) AS "평균 급여"
FROM EMP
GROUP BY ROLLUP(DEPTNO, JOB)
ORDER BY "부서번호", "직책";

-- 집합연산자 : UNION 두개 이상의 쿼리 결과를 하나로 결합하는 연산자(수직적 처리)
-- 여러개의 SELECT문을 하나로 연결하는 기능
-- 집합 연산자로 결합하는 결과의 컬럼은 데이터 타입이 동일해야 함 (열의 개수도 동일해야함)
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 10
UNION
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 20
UNION
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 30
ORDER BY DEPTNO;

-- 교집합 : INTERSECT
-- 여러개의 SQL문의 결과에 대한 교집합을 반환
SELECT EMPNO, ENAME, SAL
FROM EMP
	WHERE SAL > 1000 -- 1001 ~
INTERSECT	-- 1001 ~ 1999
SELECT EMPNO, ENAME, SAL
FROM EMP
	WHERE SAL < 2000; -- ~ 1999
	
-- 차집합 : MINUS, 중복행에 대한 결과를 하나의 결과를 보여줌
SELECT EMPNO, ENAME, SAL
FROM EMP
MINUS
SELECT EMPNO, ENAME, SAL
FROM EMP
	WHERE SAL > 2000;