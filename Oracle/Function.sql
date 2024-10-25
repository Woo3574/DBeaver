-- 24.10.15
-- SELCT [조회할 열], [조회할 열] FROM TABLE;
-- SELECT * FROM EMP; *은 해당 TABLE의 모든 열을 해당하는 의미 , ALL
-- DISTINCT 중복 제거, 중복된 행을 한개씩만 출력
-- 컬럼 값 계산하는 산술 연산자 : +, -, *, /)

-- WHERE구문은 DATA를 조회할때 사용자가 원하는 조건에 맞는 데이터만 조회할때 사용
-- WHERE 절에 사용하는 비교연산자 : >, >=, <, <=
-- 같지않음을 표현하는 방법들 : <>, !=, ^=, NOT 컬럼명 =
-- 논리 연산자 : AND, OR, NOT

-- IN 연산자 : 여러개의 열 이름을 조회할 경우 연속해서 나열 할 수있음,
-- 특정 값이 지정된 값 열에 포함되어 있는지를 확인할 때 사용

-- BETWEEN A AND B 연산자 : 일정한 범위를 조회할때 사용 하는 연산자

-- LIKE, NOT LIKE 연산자 : 문자열을 검색할때 사용하는 연산자
-- % : 길이와 상관없이 모든 문자 데이터를 의미
-- _ : 문자 1개를 의미
-- 와일드 카드 문자가 데이터 일부일 경우 : (%, _) escape로 지정된 '\'뒤에 오는 %와일드카드가 아니라는 의미

-- is null 연산자 : 데이터 값에는 NULL값을 가질수 있음,
-- 값이 정해지지 않음을 의미, 연산불가(계정, 비교, 할당)

-- 정렬을 위한 ORDER BY절 : 오름차순 또는 내림차순 정렬
-- 연결 연산자 || : SELECT문 조회 시 컬럼 사이에 특정한 문자를 넣을때 사용

-- 24.10.16
-- 함수에는 내장 함수(당일행,다중행(집계)), 사용자 정의함수가 있음
-- 단일행 함수 : 데이터가 한행씩 입력되고 결고가 한행씩 나오는 함수
-- 다중행 함수 : 여러 행이 입력되어서 하나의 행으로결과가 반한되는 것
-- ABS(n) : 절댓값
-- ROUND(숫자, 반올림할 위치): 반올림할 결과를 반환하는 함수
-- TRUNC(숫자, 버림할 위치) : 버림을 한 결과를 반환하는 함수
-- MOD(숫자, 나눌 숫자) : 나누기한 후 나머지를 출력하는 함수
-- CEIL(숫자) : 소수점 이하를 올림
-- FLOOR(숫자) : 소수점 이하를 날림
-- POWER(숫자, 제곱할 숫자) : 제곱하는 함수
-- 문자 함수 : 문자 데이터로 부터 특정 결과를 얻고자 할 때 사용하는 함수 (UPPER, LOWER, INITCAP)
-- 문자열 길이를 구하는 LENGTH, LENGTHB 함수
-- LENGTH : 문자열 길이를 반환
-- LENGTHB : 문자열의 바이트를 반환
-- SUBSTR / SUBSTRB : 시작위치로부터 선택 개수 만큼의 문자를 반환하는 함수, 인덱스는 1부터 시작
-- INSTR : 문자열 데이터 안에 특정 문자나 문자열이 어디에 포함되어 있는지를 알고자 할때 사용
-- REPLACE : 특정 문자열 데이터에 포함된 문자를 다른 문자로 대체 할 때 사용,대체할 문자 지정 없을시 삭제
-- LPAD / RPAD : 기준 공간 칸수를 지정하고 빈칸 만큼을 지정 문자로 채우는 함수
-- CONCAT : 두 문자열을 합치는 함수 
-- TRIM / LTRIM / RTRIM : 문자열 데이터에서 특정 문자를 지우기 위해 사용, 문자를 지정하지 않으면 공백 제거

-- SYSDATE : Oracle 데이터베이스에서 현재 날짜와 시간을 반환하는 함수
-- DUAL :  Oracle에서 단일 행과 단일 열을 가진 가상 테이블로, 주로 계산이나 함수 호출을 위해 사용
-- ADD_MONTHS(date, n) : date 기준으로 n개월을 더함, date 데이터 타입이어야함
-- EXTRACT(field FROM source) : Oracle SQL에서 날짜나 시간의 특정 부분(예: 연도, 월, 일, 시, 분 등)을 추출하는 데 사용됩니다
-- MONTHS_BETWEEN : 두 날짜간이 개월 수 차이를 구하는 함수
-- NEXT_DAY : 돌아오는 요일
-- LAST_DAY : 달의 마지막 날짜
-- TO_CHAR : 날짜, 숫자를 문자로 변환하는 함수, 자바의 SimpleDateFormat 유사
-- TO_DATE : 문자열로 명시된 날짜로 변환하는 함수
-- 날짜 데이터를 다루는 함수
-- 날짜 데이터 + 숫자 : 가능, 날짜에서 일수 만큼의 이 후 날짜
-- 날짜 데이터 - 숫자 : 가능, 날짜에서 숫자 만큼의 이 전 날짜
-- 날짜 데이터 - 날짜 데이터 : 가능, 두 날짜간의 일수 차이
-- 날짜 데이터 + 날짜 데이터 : 연산 불가

-- NULL 처리 함수 : 특정 열의 행에 데이터가 없는 경우 데이터 값이 NULL이 됨 (NULL = 값이 없음)
-- NULL : 값이 할당되지 않았기 때문에 공백이나 0과는 다른 의미, 연산(계산,비교 등등)
-- NVL(검사할 데이터 또는 열, 앞의 데이터가 NULL인 경우 대체할 값)
-- NVL2(검사할 데이터, 데이터가 NULL이 아닐때 반환되는 값, 데이터가 NULL일때 반환되는 값)
-- NULLIF : 두 값을 비교하여 동일하면 NULL, 동일하지 않으면 첫번째 값을 반환
-- DECODE : 주어진 데이터 값이 조건 값과 일치하는 값을 출력하고 일치하는 값이 없으며 기본값출력
-- CASE WHEN(조건) THEN(반환값) END : SQL의 표준함수, 일반적으로 SELECT 절에서 많이 사용됨

-- 실습문제 [1]
SELECT EMPNO,
	SUBSTR(EMPNO,1,2) || '**' AS "MASKING_EMPNO",
	ENAME,
	SUBSTR(ENAME,1,2) || '***' AS "MASKING_ENAME"
FROM EMP
	WHERE LENGTH(ENAME) = 5;

SELECT EMPNO,
	RPAD(SUBSTR(EMPNO,1,2),4,'*') AS "MASKING_EMPNO",
	ENAME,
	RPAD(SUBSTR(ENAME,1,2),5,'*') AS "MASKING_NAME"
FROM EMP
	WHERE LENGTH(ENAME) = 5;
-- 실습문제[2]
SELECT EMPNO, ENAME, SAL,
	TRUNC(SAL / 21.5,2) AS "DAY_PAY",
	ROUND(SAL / 21.5 / 8,1) AS "TIME_PAY"
FROM EMP;

-- 실습문제[3]
SELECT EMPNO, ENAME,TO_CHAR(HIREDATE,'YYYY/MM/DD'),
	TO_CHAR(NEXT_DAY(ADD_MONTHS(HIREDATE,3),'월요일'),'YYYY-MM-DD') AS "R_JOB",
	NVL(TO_CHAR(COMM),'N/A')
FROM EMP;

-- 실습문제[4]
SELECT EMPNO, ENAME, MGR,
	CASE
		WHEN MGR IS NULL THEN '0000'
		WHEN SUBSTR(MGR,1,2) = '75' THEN '5555'
		WHEN SUBSTR(MGR,1,2) = '76' THEN '6666'
		WHEN SUBSTR(MGR,1,2) = '77' THEN '7777'
		WHEN SUBSTR(MGR,1,2) = '78' THEN '8888'
		ELSE TO_CHAR(MGR)
	END AS "CHG_MGR"
FROM EMP;

-- 24.10.17
-- 다중행 함수 : 여러 행에 대해서 함수가 적용되어 하나의 결과를 나타내는 함수,집계
-- SUM() :지정한 데이터의 합을 반환, NULL값을 무시
-- COUNT() : 지정한데이터의 개수를 반환
-- MAX() : 최대값 변환
-- MIN() : 최소값 변환
-- AVG() : 평균값 변환

-- HAVING 절 : 그룹화된 대상에 대한 출력 제한, GROUP BY 존재할 때만 사용 할수잇음

-- 집합연산자 : UNION 두개 이상의 쿼리 결과를 하나로 결합하는 연산자(수직적 처리)
-- 여러개의 SELECT문을 하나로 연결하는 기능
-- 집합연산자로 결합하는 결과의 컬럼은 데이터 타입이 동일해야 가능함
-- 교집합 : INTERSECT, 여러개의 SQL문의 결과에 대한 교집합을 반환
-- 차집합 : MINUS, 중복행에 대한 결과를 하나의 결과로 보여줌	

-- 조인 : 여러 테이블을 하나의 테이블 처럼 사용 하는것 
-- 이 때 필요한 것 PK(Primary Key)와 테이블 간 공통 값인 FK(Foreign Key)를 사용
-- JOIN의 종류
-- INNER JOIN (동등 조인) : 두 테이블에서 일치하는 데이터만 선택
-- LEFT JOIN : 왼쪽 테이블의 모든 데이터와 일치하는 데이터 선택
-- RIGHT JOIN : 오른쪽 테이블의 모든 데이터와 일치하는 데이터 선택
-- FULL OUTER JOIN : 두테이블의 모든 데이터를 선택
-- 비등가 조인 : 동일한 컬럼이 존재하지않는 경우 조인 할때 사용,일반적인 방식은 아님
-- 자체조인(SELF JOIN) : 자기 자신의 테이블과 조인 하는 것을 말함 (동일 테이블을 2번 사용)
-- 외부 조인 (OUTER JOIN) : LEFT, RIGHT, FULL : JOIN를 두고 어디기준에 둘지 정하는 것
-- NATURAL JOIN : 등가 조인과 비슷하지만 WHERE 조건절 없이 사용,두 테이블의 동일한 이름이 있는 열을 찾아서 조인해줌
-- JOIN ~ USING : 등가 조인을 대신하는 조인 방식


-- Q1.급여가 2000원 초과인 사원들의 정보 출력(부서번호, 부서이름, 사원번호, 사원이름, 급여)
-- JOIN ~ ON, NATURAL JOIN, JOIN ~ USING 아무거나 사용

-- Q2.각 부서별 평균 급여, 최대 급여, 최소 급여, 사원수 출력
-- 출력 내용은 (부서번호, 부서이름, 평균 급여, 최대 급여, 최소 급여, 사원수)

-- Q3.모든 부서 정보와 사원 정보 출력 (부서 번호와 부서 이름순으로 정렬), 모든 부서가 나와야함