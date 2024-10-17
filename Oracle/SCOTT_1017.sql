-- 다중행 함수 : 여러 행에 대해서 함수가 적용되어 하나의 결과를 나타내는 함수
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
SELECT SUM(SAL), SUM(COMM), DEPTNO FROM EMP
	GROUP BY DEPTNO;
	
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
		
-- HACING 절 : 그룹화된 대상에 대한 출력 제한
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
	단, 평균 급여를 출력 할 때는 소수점 제외하고 부서 번호별로 출력

-- 3.같은 직책에 종사하는 사원이 3명 이상인 직책과 인원을 출력

-- 4.사원들의 입사 연도를 기준으로 부서별로 몇 명이 입사했는지 출력
	
-- 5.추가 수당을 받는 사원 수와 받지 않는 사원수를 출력(O, X로 표기 필요)
	
-- 6.각 부서의 입사 연도별 사원 수, 최고 급여, 급여 합, 평균 급여를 출력