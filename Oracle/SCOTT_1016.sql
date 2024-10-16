-- 함수 : 특정 결과를 얻기 위해 데이터를 입력 할 수 있는 특수 명령어를 의미
-- 함수에는 내장 함수와 사용자 정의 함수가 있음
-- 내장 함수에는 당일행 함수와 다중행 함수(집계함수)로 나누어짐
-- 단일행 함수 : 데이터가 한 행씩 입력되고 결과가 한 행씩 나오는 함수
-- 다중행 함수 : 여러 행이 입력되어서 하나의 행으로결과가 반환되는 것
-- 숫자 함수 : 수학 계산식을 처리하기 위한 함수
SELECT -10, ABS(-10) FROM DUAL; -- ABS : 절댓값

-- ROUND(숫자, 반올림할 위치) : 반올림한 결과를 반환하는 함수
SELECT ROUND(1234.5678) AS ROUND, -- 소수점 1번째자리에서 반올림해서 결과를 반환 , AS는 별칭
	ROUND(1234.5678, 0) AS ROUND_0,
	ROUND(1234.5678, 1) AS ROUND_1, -- 소수점 2번째 자리에서 반올림해서 소수점 1자리 표시
	ROUND(1234.5678, 2) AS ROUND_2, -- 소수점 3번째 자리에서 반올림해서 소수점 2자리 표시
	ROUND(1234.5678, -1) AS ROUND_MINUS1, -- 정수 1번째 자리를 반올림 1230
	ROUND(1234.5678, -2) AS ROUND_MINUS2 -- 정수 2번째 자리를 반올림 1200 
	FROM DUAL
	
-- TRUNC : 버림을 한 결과를 반환하는 함수, 자리수 지정 가능
SELECT TRUNC(1234.5678) AS TRUNC, -- 소수점 1번째자리에서 버림해서 결과를 반환 , AS는 별칭
	TRUNC(1234.5678, 0) AS TRUNC_0,
	TRUNC(1234.5678, 1) AS TRUNC_1, -- 소수점 2번째 자리에서 버림해서 소수점 1자리 표시
	TRUNC(1234.5678, 2) AS TRUNC_2, -- 소수점 3번째 자리에서 버림해서 소수점 2자리 표시
	TRUNC(1234.5678, -1) AS TRUNC_MINUS1, -- 정수 1번째 자리에서 버림 1230
	TRUNC(1234.5678, -2) AS TRUNC_MINUS2 -- 정수 2번째 자리에서 버림 1200 
	FROM DUAL
	
-- MOD : 나누기한 후 나머지를 출력하는 함수
SELECT MOD(21, 5) FROM DUAL;

-- CEIL : 소수점 이하를 올림
SELECT CEIL(12.345) FROM DUAL;

-- FLOOR : 소수점 이하를 날림
SELECT FLOOR(12.999) FROM DUAL;

-- POWER : 제곱하는 함수
SELECT POWER(3, 4) FROM DUAL; -- 3 * 3 * 3 * 3

-- DUAL : SYS계정에서 제공하는 버퍼 테이블, 테이블 참조 없이 실행해보기 위해 FROM절에 사용하는 더미 테이블
SELECT 20*30 FROM DUAL;

-- 문자 함수 : 문자 데이터로 부터 특정 결과를 얻고자 할 때 사용하는 함수
SELECT ENAME, UPPER(ENAME), LOWER(ENAME), INITCAP(ENAME) -- 대문자,소문자,첫글자만 대문자
	FROM EMP;
	
-- UPPER 함수로 문자열 비교하기
SELECT * FROM EMP
	WHERE UPPER(ENAME) LIKE UPPER('%JAMES');
	
-- 문자열 길이를 구하는 LENGTH 함수, LENGTHB 함수
-- LENGTH : 문자열 길이를 반환
-- LENGTHB : 문자열의 바이트를 반환
SELECT LENGTH(ENAME), LENGTHB(ENAME) FROM EMP; -- 영어는 한바이트를 차지하기 때문에 길이와 바이트수가 동일

SELECT LENGTH('하니'), LENGTHB('하니') FROM DUAL; -- 오라클 XE 버전에서 한글은 3바이트를 차지

-- 직책 이름의 길이가 6글자 이상이고,COMM있는 사원의 모든 정보 출력
SELECT * FROM EMP
	WHERE LENGTH(JOB) >= 6
	AND COMM IS NOT NULL
	AND COMM != 0;
	
-- SUBSTR / SUBSTRB : 시작위치로부터 선택 개수 만큼의 문자를 반환하는 함수, 인덱스는 1부터 시작
SELECT JOB, SUBSTR(JOB, 1, 2), SUBSTR(JOB, 3, 2), SUBSTR(JOB, 5) FROM EMP; -- 1부터 2자리, 3부터 2자리,5부터 끝까지

-- SUBSTR 함수와 다른 함수 함께 사용
SELECT job,
	SUBSTR(JOB, -LENGTH(JOB)), -- -5
	SUBSTR(JOB, -LENGTH(JOB), 2),
	SUBSTR(JOB, -3)
	FROM EMP;
	
-- INSTR : 문자열 데이터 안에 특정 문자나 문자열이 어디에 포함되어 있는지를 알고자 할 때 사용
SELECT INSTR('HELLO, ORACLE', 'L') AS INSTR_1, -- 'L'문자의 위치
	INSTR('HELLO, ORACLE', 'L', 5) AS INSTR_2, -- 5번째 위치에서 시작해서 'L' 문자의 위치 찾기
	INSTR('HELLO, ORACLE', 'L', 2, 2) AS INSTR_3 -- 2번째 위치에서 시작해서 2번째 나타나는 문자
	FROM DUAL;
	
-- 특정 문자가 포함된 행 찾기
SELECT * FROM EMP
	WHERE INSTR(ENAME, 'S') > 0; -- 'S' 문자가 포함된 행 출력
	
SELECT * FROM EMP
	WHERE ENAME LIKE '%S%';
	
-- REPLACE : 특정 문자열 데이터에 포함된 문자를 다른 문자로 대체 할 때 사용
-- 대체할 문자를 지정하지 않으면 삭제
SELECT '010-5006-4146' AS "변경 이전",
	REPLACE('010-5006-4146', '-', ' ') AS "변경 이후 1",
	REPLACE('010-5006-4146', '-') AS "변경 이후2"
	FROM DUAL;
	
-- LPAD / RPAD : 기준 공간 칸수를 지정하고 빈칸 만큼을 특정 문자로 채우는 함수
SELECT LPAD('ORACLE', 10, '+') FROM DUAL;
SELECT RPAD('ORACLE', 10, '+') FROM DUAL;

SELECT RPAD('010222-', 14, '*') AS RPAD_JUMIN,
	RPAD('010-5006-', 13, '*') AS RPAD_PHONE
	FROM DUAL;
	
-- 두 문자열을 합치는 CONCAT 함수
SELECT CONCAT(EMPNO, ENAME) AS "사원정보",
	CONCAT(EMPNO, CONCAT(' : ', ENAME)) AS "사원정보 : "
	FROM EMP
	WHERE ENAME = 'JAMES';
	
-- TRIM / LTRIM / RTRIM : 문자열 데이터에서 특정 문자를 지우기 위해 사용, 문자를 지정하지 않으면 공백 제거
SELECT '[' || TRIM(' _ORACLE_ ') || ']' AS TRIM,
	'[' || LTRIM(' _ORACLE_ ') || ']' AS LTRIM,
	'[' || RTRIM(' _ORACLE_ ') || ']' AS RTRIM
	FROM DUAL;