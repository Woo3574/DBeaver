문제 1: 직원 정보 조회
EMP 테이블이 다음과 같은 구조로 되어 있다고 가정합니다:

EMPNO (직원 번호)
ENAME (직원 이름)
JOB (직무)
HIREDATE (고용일)
SAL (급여)

[1]고용일이 2020년 1월 1일 이후인 모든 직원의 이름(ENAME)과 급여(SAL)를 조회하세요.
[2]급여가 3000 이상인 직원의 수를 세어보세요.
[3]직무(JOB)가 'MANAGER'인 직원들의 정보를 조회하되, 급여를 내림차순으로 정렬하세요.

문제 2: 급여 통계
[1]SAL 컬럼의 평균 급여를 계산하여 결과를 반환하세요.
[2]각 직무별로 급여의 최대값과 최소값을 구하는 쿼리를 작성하세요.


SELECT ENAME, SAL FROM EMP
	WHERE HIREDATE >= '2020.01.01';

SELECT COUNT(*) FROM EMP -- COUNT(*) 
	WHERE SAL >= 3000;

SELECT * FROM EMP
	WHERE JOB = 'MANAGER'
	ORDER BY SAL DESC;

SELECT (SUM(SAL)/ COUNT(SAL)) FROM EMP;

-- GRROUP BY 절은 지정한 컬럼의 값에 따라 결과를 그룹화합니다

SELECT JOB,MAX(SAL) AS "MAX_SAL", MIN(SAL) AS "MIN_SAL"
	FROM EMP
	GROUP BY JOB;





