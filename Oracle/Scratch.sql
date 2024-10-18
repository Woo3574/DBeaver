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

-- CASE문 CASE WHEN THEN 문 : WHEN이 참이면 THEN 값을 반환
EMP 테이블에서 각 직원의 급여(SAL)에 대해 다음을 수행하시오:
1.급여가 음수인 경우 그 급여의 절대값을 구하시오.
2.급여가 양수인 경우에는 그대로 출력하시오.
3.결과를 EMPNO와 ABS_SAL이라는 열 이름으로 출력하시오.
조건: 직원의 EMPNO와 변환된 급여를 함께 출력하시오.
SELECT EMPNO,
	CASE
		WHEN SAL < 0 THEN ABS(SAL)
		ELSE SAL
	END AS "ABS_SAL"
	FROM EMP;
-- ROUND문 지정한 소수점 번째 자리 반올림
--문제
--EMP 테이블에서 각 직원의 급여(SAL)를 소수점 둘째 자리까지 반올림하여 출력하시오. 결과는 EMPNO와 ROUND_SAL이라는 열 이름으로 출력해야 합니다.
-- 조건
-- ROUND 함수를 사용하여 급여를 반올림할 것.
SELECT EMPNO, ROUND(SAL,2) AS "ROUND_SAL" FROM EMP;
-- TRUNC문 지정한 소수점 번째 자리 버림
-- EMP 테이블에서 각 직원의 급여(SAL)를 소수점 첫째 자리에서 잘라낸 값을 출력하시오. 결과는 EMPNO와 TRUNCATED_SAL이라는 열 이름으로 출력해야 합니다.
-- 조건
-- TRUNC 함수를 사용하여 급여를 잘라낼 것.
SELECT EMPNO, TRUNC(SAL, 1) AS "TRUNCATED_SAL" FROM EMP;
-- MOD문 목을 나눈 나머지 값을 구함
--EMP 테이블에서 각 직원의 급여(SAL)를 500으로 나눈 나머지를 구하시오. 결과는 EMPNO와 SAL_MOD라는 열 이름으로 출력해야 합니다.
--조건 MOD 함수를 사용하여 급여의 나머지를 계산할 것.
SELECT EMPNO, MOD(SAL,500) AS "SAL_MOD" FROM EMP;
-- CEIL문 소수점을 올림
-- EMP 테이블에서 각 직원의 급여(SAL)를 올림하여 정수로 변환한 값을 출력하시오. 결과는 EMPNO와 CEIL_SAL이라는 열 이름으로 출력해야 합니다.
SELECT EMPNO, CEIL(112321.1212) AS "CEIL_SAL" FROM EMP;
-- FLOOR문 소수점 버림
-- EMP 테이블에서 각 직원의 급여(SAL)를 내림하여 정수로 변환한 값을 출력하시오. 결과는 EMPNO와 FLOOR_SAL이라는 열 이름으로 출력해야 합니다.
SELECT EMPNO, FLOOR(12534.41534) AS "FLOOR_SAL" FROM EMP;
-- POWER문 지정한 값을 정한 수 만큼 제곱
-- EMP 테이블에서 각 직원의 급여(SAL)의 제곱 값을 출력하시오. 결과는 EMPNO와 SAL_SQUARED라는 열 이름으로 출력해야 합니다.
SELECT EMPNO, POWER(10,3) AS "SAL_SQUARED" FROM EMP;
-- UPPER문,LOWER문,INITCAP문
SELECT UPPER(ENAME), LOWER(ENAME), INITCAP(ENAME) FROM EMP; 
-- UPPER 문자열 비교하기
SELECT * FROM EMP
WHERE UPPER(ENAME) LIKE '%S%';
-- LENGTH,LENGTHB : 문자열 길이와 비트수 구하
SELECT LENGTH('하니'), LENGTHB('하니') FROM DUAL;
-- 직책 이름의 길이가 6글자 이상이고,COMM있는 사원의 모든 정보 출력
SELECT * FROM EMP
	WHERE LENGTH(JOB) >= 6
	AND COMM IS NOT NULL
	AND COMM ^= 0;
-- SUBSTR문 선택한 문자열의 지정한 위치부터 지정한 개수만큼 출력
SELECT ENAME, SUBSTR(ENAME, 3, 2) FROM EMP;
-- SUBSTRB문
SELECT SUBSTRB('오늘도만나서반갑습니다.', 1, 8) FROM DUAL;
-- SUBSTR문 다른 함수와 같이사용하기
-- EMP 테이블에서 각 직원의 이름(ENAME)의 첫 글자만 대문자로 변환하고,
-- 나머지 글자는 소문자로 변환한 후, 이 이름의 첫 세 글자만 추출하시오.
-- 결과는 EMPNO와 FORMATTED_NAME이라는 열 이름으로 출력해야 합니다.
SELECT EMPNO, ENAME, SUBSTR(INITCAP(ENAME), 1, 3) AS "FORMATTED_NAME" FROM EMP;
-- INSTR문 : 문자열에 특정 문자나 문자열의 인덱스를 찾을때
SELECT INSTR('HI NICE TO MEET YOU TOO', 'TOO') FROM DUAL;
-- EMP 테이블에서 다음 조건을 만족하는 쿼리를 작성하세요:
-- 1.직원의 이름(ENAME)의 첫 글자를 대문자로 변환하고 나머지는 소문자로 변환합니다.
SELECT INITCAP(ENAME) FROM EMP;
-- 2.급여(SAL)가 3000 이상인 직원만 선택합니다.
SELECT SAL FROM EMP
	WHERE SAL >= 3000;
-- 3.직원의 급여를 10% 인상한 값을 NEW_SAL이라는 열 이름으로 반환합니다.
SELECT SAL, SAL * 1.1 AS "NEW_SAL" FROM EMP;
-- 4.결과는 EMPNO, FORMATTED_NAME, NEW_SAL 순으로 출력합니다.
-- 조건 INITCAP 함수를 사용하여 이름 형식을 변경하고, SAL에 1.1을 곱하여 새로운 급여를 계산할 것.
-- 정렬 기준은 NEW_SAL을 기준으로 내림차순 정렬할 것.
SELECT EMPNO,INITCAP(ENAME) AS "FORMATTED_NAME", SAL * 1.1 AS "NEW_SAL" FROM EMP
	WHERE SAL >= 3000
	ORDER BY NEW_SAL DESC;
-- REPLACE문 특정 문자를 원하는 문자로 변경
SELECT REPLACE('010-7126-3574', '-') FROM DUAL;
-- LPAD/RPAD문
SELECT LPAD('DRAGON', 10, '&') FROM DUAL 
SELECT RPAD('DRAGON', 20, '@') FROM DUAL;

SELECT EMPNO, ENAME, SAL,
	TRUNC((SAL / 21.5 ),2) AS "DAY_PAY",
	ROUND((SAL / (21.5 * 8)),1) AS "TIME_PAY"
	FROM EMP;
	
SELECT EMPNO, ENAME, HIREDATE,
	TO_CHAR(NEXT_DAY(ADD_MONTHS(HIREDATE, 3), '월요일'),'YYYY-MM-DD') AS "R_JOB",
	NVL(TO_CHAR(COMM), 'N/A') AS "COMM"
	FROM EMP;
--2024.10.17	
SELECT SUM(DISTINCT SAL), SUM(SAL) FROM EMP;
--
SELECT DEPTNO, SUM(SAL), SUM(COALESCE(COMM,0))
FROM EMP
GROUP BY DEPTNO
	HAVING DEPTNO = 20;
--
SELECT DEPTNO, COMM FROM EMP;
--
SELECT JOB AS "직책",
	SUM(SAL) AS "급여",
	SUM(COALESCE(COMM,0)) AS "추가 수당"
FROM EMP
GROUP BY JOB;
--
SELECT DEPTNO "각 부서", MAX(SAL) "최고 급여"
FROM EMP
GROUP BY DEPTNO
ORDER BY DEPTNO;
--
SELECT MAX(SAL) FROM EMP
	WHERE DEPTNO = 10
UNION 
SELECT MAX(SAL) FROM EMP
	WHERE DEPTNO = 20
UNION 
SELECT MAX(SAL) FROM EMP
	WHERE DEPTNO = 30;
--
SELECT MAX(HIREDATE)
FROM EMP
	WHERE DEPTNO = 20;
--
SELECT DEPTNO, EMPNO, ENAME, JOB
FROM EMP
	WHERE (DEPTNO,SAL) IN ( 
		SELECT DEPTNO, MAX(SAL)
		FROM EMP
		GROUP BY DEPTNO);


SELECT EMPNO, ENAME, JOB, DEPTNO
FROM EMP e 
	WHERE SAL = (
	SELECT MAX(SAL)
	FROM EMP e2
		WHERE e2.DEPTNO = e.DEPTNO);
	
-- 연습 문제 1번 
-- 전체 사원 중 ALELEN과 같은 직챙(JOB)인 사원들의 사원 정보, 부서 정보를
-- 다음과 같이 출력하는 SQL문을 작성하세요. (직책, 사원번호, 사원이름, 급여, 부서번호, 부서 이름)

-- 연습 문제 2번
-- 전체 사원의 평균 급여(SAL)보다 높은 급여를 받는 사람들의 사원정보, 부서 정보,
-- 급여 등급 정보를 출력하는 SQL문을 작성하세요.
-- (단 출력할 때 급여가 많은 순으로 정렬하되 급여가 같을 경우에는)
-- 사원 번호를 기준으로 오름차순으로 정렬하세요).
-- (사원번호, 이름, 입사일, 급여, 급여 등급, 부서이름, 부서위치)

-- 연습 문제 3번
-- 10번 부서에 근무하는 사원 중 30번 부서에는 존재하지 않는 직책을 가진 사원들의 사원 정보,
-- 부서 정보를 다음과 같이 출력하는 SQL문을 작성하세요.
-- (사원번호, 사원이름, 직책, 부서번호, 부서이름, 부서위치)

-- 연습 문제 4번
-- 책이 SALESMAN인 사람들의 최고 급여보다 높은 급여를 받는 사원들의 사원 정보,
-- 급여 등급 정보를 다음과 같이 출력하는 SQL문을 작성하세요.
-- (단, 서브쿼리를 활용할 때 다중행 함수를 사용하는 방법과
-- 사용하지 않는 방법을 통해 사원 번호를 기준으로 오름차순으로 정렬하세요.)
-- (사원번호, 사원이름, 급여, 급여 등급)






