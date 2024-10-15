-- SELECT와 FROM 절
-- SELECT 문은 DATA BASE에 보관되어 있는 데이터 조회할 때 사용
-- SELECT 절은 FROM절에 명시한 TABLE에서 조회할 열이나 열을 지정할수 있음
-- SELECT [조회할 열], [조회할 열] FROM TABLE이름;

SELECT * FROM EMP; -- * 모든 컬럼을 의미, FROM 다음에 오는 것이 TABLE 이름, SQL 수행문은 ;(세미콜른)으로 끝나야 함

-- 특정 컬럼만 선택해서 조회
SELECT EMPNO, ENAME, DEPTNO FROM EMP;
-- 사원번호와 부서번호만 나오도록 SQL 작성 (EMPNO, DETPNO)
SELECT EMPNO, DEPTNO FROM EMP;
-- 한눈에 보기 좋게 별칭 부여 하기
SELECT ENAME, SAL, COMM, SAL * 12 + COMM
    FROM EMP;

-- 한눈에 보기 좋게 별칭 부여 하기
SELECT ENAME "이름", SAL AS "급여", COMM AS "성과급", SAL * 12 "연봉"
	FROM EMP;

-- 중복 제거하는 DISTINCT, 데이터를 조회 할때 중복되는 행이 여러 행이 조회될때, 중복된 행을 한 개씩만 선택
SELECT DISTINCT DEPTNO
FROM EMP
ORDER BY DEPTNO;

-- 컬럼 값을 계산하는 산술 연산자(+, -, *, /)
SELECT ename, sal, sal * 12 "연산 급여", sal * 12 + comm "총 연봉"
	FROM EMP;
-- 연습문제 : 직책(job)을 중복 제거하고 출력하기
SELECT DISTINCT JOB FROM EMP;

-- WHERE 구문
-- DATA를 조회할때 사용자가 원하는 조건에 맞는 데이터만 조회할때 사용
SELECT * FROM EMP -- 먼저 TABLE이 선택되고, WHERE 절에서 행을 제한하고, 출력할 열을 결정
WHERE DEPTNO = 20;

-- 사원번호가 7369인 사원의 모든 정보를 보여줘.
SELECT * FROM EMP
WHERE EMPNO = 7369; -- DATA BASE에서 비교는 = (같다, 비교연산자) 라는 의미로 사용됨

-- 급여가 2500 초과인 사원번호, 이름, 직책, 급여 출력
-- EMP TABLE에서 급여가 2500 초과인 행을 선택하고, 사원번호, 사원이름, 직책, 급여에 컬럼을 선택해 출력
SELECT EMPNO, ENAME, JOB, SAL
	FROM EMP
	WHERE SAL > 2500;

-- WHERE 절에 기본 연산자 사용
SELECT * FROM EMP
	WHERE sal * 12 = 36000;
	
-- WHERE 절에 사용하는 비교 연산자 : >, >=, <, <=
-- 성과급이 500초과인 사람의 모든 정보 출력
SELECT * FROM EMP
	WHERE COMM > 500;
	
-- 입사일이 81년1월1일 이전 사람의 모든 정보 출력하기
SELECT * FROM EMP
	WHERE HIREDATE < '90.01.01'; -- DATA BASE의 문자열 비교시 '', DATA TYPE은 날짜의 형식에 맞으면 가능
	
-- 같지 않음을 표현하는 여러가지 방법 : <>, !=, ^=, NOT 컬럼명 =
SELECT * FROM EMP
	-- WHERE DEPTNO <> 30;
	-- WHERE DEPTNO != 30;
	-- WHERE DEPTNO ^= 30;
	WHERE NOT DEPTNO = 30;
	
-- 논리연산자 : AND, OR ,NOT
-- 급여가 3000이상이고 부서가 20번 사원의 모든 정보 출력 하기
SELECT * FROM EMP
	WHERE SAL >= 3000
	AND DEPTNO = 20;
	
-- 급여가 3000이상이거나 부서가 20번 사원의 모든 정보 출력 하기
SELECT * FROM EMP
	WHERE SAL >= 3000
	OR DEPTNO = 20;
	

-- 급여가 3000이상이고 부서가 20번이고 입사일이 82년 1월1일 이전 사원의 모든 정보 출력 하기
SELECT * FROM EMP
	WHERE SAL >= 3000
	AND DEPTNO = 20
	AND HIREDATE < '82.01.01';

-- 급여가 3000이상이고 부서가 20번이거나, 입사일이 82년 1월1일 이전 사원의 모든 정보 출력 하기

SELECT * FROM EMP
	WHERE SAL >= 3000
	AND (DEPTNO = 20
	OR HIREDATE < '82.01.01');

-- 급여가 2500 이상이고 직책이 MANAGER인 사원의 모든 정보 출력 하기
SELECT * FROM EMP
	WHERE SAL >= 2500
	AND JOB = 'MANAGER';

SELECT * FROM EMP
	WHERE JOB = 'MANAGER' OR JOB = 'SALESMAN' OR JOB = 'CLERK';
--  IN연산자 : 여러개의 열 이름을 조회할 경우 연속 해서 나열 할 수있음
SELECT * FROM EMP
	WHERE JOB IN ('MANAGER', 'SALESMAN', 'CLERK');

--  IN 연산자를 사용해 20번과 30번 부서에 포함된 사원의 모든 정보 조회
SELECT * FROM EMP
	WHERE DEPTNO IN (20 ,30);

-- NOT IN 연산자를 사용해 20번과 30번 부서에 포함된 사원 조회
SELECT * FROM EMP
	WHERE DEPTNO NOT IN (10);

-- 비교 연산자와 AND 연산자를 사용하여 출력하기
SELECT * FROM EMP
	WHERE JOB != 'MANAGER' AND JOB <> 'SALESMAN' AND JOB ^= 'CLERK';
	
-- 급여가 2000에서 3000사이 사원의 모든 정보를 출력
SELECT * FROM EMP
	WHERE SAL >= 2000 AND SAL <= 3000;

-- BETWEEN A AND B 연산자 : 일정한 범위를 조회할 때 사용하는 연산자
SELECT * FROM EMP
	WHERE SAL BETWEEN 2000 AND 3000;
	
-- 사원번호가 7689에서 7902 까지의 사원의 모든 정보를 출력하기
SELECT * FROM EMP
	WHERE EMPNO BETWEEN 7689 AND 7902;
	
-- 1980년이 아닌해에 입사한 사원의 모든 정보를 출력
SELECT * FROM EMP
	WHERE NOT HIREDATE BETWEEN '1980/01/01' AND '1980/12/31';
	
-- LIKE, NOT LIKE 연산자 : 문자열을 검색할 때 사용 하는 연산자
-- % : 길이와 상관없이 모든 문자 데이터를 의미
-- _ : 문자 1개를 의미

SELECT EMPNO, ENAME FROM EMP
	WHERE ENAME LIKE '%K%' -- 앞과 뒤의 문자열길이에 상관없이 K라는 문자가 ENAME에 포함된 사원의 정보 출력
	
-- 사원의 이름의 2번째 글자가 L인 사원만 출력하기
SELECT * FROM EMP
	WHERE ENAME LIKE '_L%';
	
-- [실습] 첫번째 사원 이름에 AM이 포함되어있는 사원 데이터만 출력
SELECT * FROM EMP
	WHERE ENAME LIKE '%AM%';

-- [실습] 사원 이름에 AM이 포함되어 있지 않은 사원 데이터만 출력
SELECT * FROM EMP
	WHERE ENAME NOT LIKE '%AM%';
	
-- 와일드 카드 문자가 데이터 일부일 경우 : (%, _) escape로 지정된 '\'뒤에 오는 %와일드카드가 아니라는 의미
SELECT * FROM EMP
	WHERE ENAME LIKE '%\%S' ESCAPE '\'; -- 사원 이름이 %P로 끝나느 사원을 조회
	
INSERT INTO EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
	VALUES(1001, 'JAME%S', 'MANAGER', 7839, '2024.10.15', 3500, 450, 30);
	
SELECT * FROM EMP; --AB