-- 조인 : 여러 테이블을 하나의 테이블 처럼 사용 하는 것
-- 이 때 필요한 것 PK(Primary Key)와 테이블 간 공통 값인 FK(Foreign Key)를 사용
-- JOIN의 종류
-- INNER JOIN (동등 조인) : 두 테이블에서 일치하는 데이터만 선택
-- LEFT JOIN : 왼쪽 테이블의 모든 데이터와 일치하는 데이터 선택
-- RIGHT JOIN : 오른쪽 테이블의 모든 데이터와 일치하는 데이터 선택
-- FULL OUTER JOIN : 두 테이블의 모든 데이터를 선택

-- 카테시안의 곱 : 2개의 테이블을 조인 할 때 기준열을 지정하지않으면, 모든행 * 모든행 
SELECT *
FROM EMP, DEPT
ORDER BY EMPNO;

-- 등가 조인 : 일치하는 열이 존재, INNER 조인이라고 함, 가장 일반적인 조인 방식
-- 오라클 조인 오라클 뭔법 
SELECT EMPNO, ENAME, JOB, SAL, E.DEPTNO
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
ORDER BY EMPNO;

-- ANSI 조인 미국 표준 문법 방식
SELECT EMPNO, ENAME, JOB, SAL, E.DEPTNO
FROM EMP e JOIN DEPT d 
ON E.DEPTNO = D.DEPTNO
ORDER BY EMPNO;

-- DEPT 테이블과 EMP 테이블은 1:N 관계를 가짐 (부서 테이블의 부서번호에는 여러명의 사원이 올 수 있음)
-- JOIN에서 출력 범위 설정 하기
SELECT EMPNO, ENAME, SAL, D.DEPTNO, DNAME, LOC
FROM EMP e JOIN DEPT d
ON E.DEPTNO = D.DEPTNO
WHERE SAL >= 3000;

-- EMP 테이블 별칭을 E로, DEPT 테이블 별칭은 D로 하여 다음과 같이
-- 등가 조인을 했을때 급여가 2500 이하이고,
-- 사원 번호가 9999 이하인 사원의 정보가 출력되도록 작성
-- 오라클 조인이나 ANSI 조인 아무거나 사용

SELECT *
FROM EMP e JOIN DEPT d
ON E.DEPTNO = D.DEPTNO
	WHERE E.SAL <= 2500
	AND E.EMPNO <= 9999
	ORDER BY EMPNO;

-- 비등가 조인 : 동일한 컬럼이 존재하지않는 경우 조인 할때 사용, 일반적인 방식은 아님
SELECT * FROM SALGRADE; -- 각 급여에 대한 등급

SELECT ENAME, SAL, GRADE
FROM EMP e JOIN SALGRADE s 
ON SAL BETWEEN S.LOSAL AND S.HISAL; -- 급여와 LOSAL ~ HISAL 비등가 조인

-- 자체 조인(SELF JOIN) : 자기 자신의 테이블과 조인 하는 것을 말함 (같은 테이블을 2번 사용)
SELECT E1.EMPNO AS "사원번호", E1.ENAME AS "사원이름", -- MRG 직속상관에 대한 사원번호
	E2.EMPNO AS "상관사원번호",
	E2.ENAME AS "상관이름"
FROM EMP e1 JOIN EMP e2
ON e1.MGR = e2.EMPNO;

-- 외부 조인 (OUTER JOIN) : LEFT, RIGHT, FULL : JOIN을 두고 어디기준에 둘지정하는 것
SELECT e.ENAME, d.DEPTNO, d.DNAME
FROM EMP e FULL OUTER JOIN DEPT d
ON e.DEPTNO = d.DEPTNO
ORDER BY e.DEPTNO;

SELECT * FROM DEPT;

-- NATURAL JOIN : 등가 조인과 비슷하지만 WHERE 조건절 없이 사용
-- 두 테이블의 동일한 이름이 있는 열을 자동으로 찾아서 조인 해줌
SELECT EMPNO, ENAME, DEPTNO, DNAME
FROM EMP e NATURAL JOIN DEPT d;

-- JOIN ~ USING : 등가 조인을 대신하는 조인 방식
SELECT e.EMPNO, e.ENAME, e.JOB, DEPTNO, d.DNAME, d.LOC
FROM EMP e JOIN DEPT d USING(DEPTNO)
ORDER BY e.EMPNO;

-- Q1.급여가 2000원 초과인 사원들의 정보 출력(부서번호, 부서이름, 사원번호, 사원이름, 급여)
-- JOIN ~ ON, NATURAL JOIN, JOIN ~ USING 아무거나 사용
SELECT DEPTNO, d.dNAME, e.EMPNO, e.ENAME, e.SAL
FROM EMP e NATURAL JOIN DEPT d
	WHERE e.SAL > 2000;

-- Q2.각 부서별 평균 급여, 최대 급여, 최소 급여, 사원수 출력
-- 출력 내용은 (부서번호, 부서이름, 평균 급여, 최대 급여, 최소 급여, 사원수)
SELECT d.DEPTNO AS "부서번호",
	d.DNAME AS "부서이름",
	ROUND(AVG(SAL)) AS "평균 급여",
	MAX(SAL) AS "최대 급여",
	MIN(SAL) AS "최소 급여",
	COUNT(*) AS "사원수"
FROM EMP e JOIN DEPT d
ON e.DEPTNO = d.DEPTNO
GROUP BY d.DEPTNO, d.DNAME;

-- Q3.모든 부서 정보와 사원 정보 출력 (부서 번호와 부서 이름순으로 정렬), 모든 부서가 나와야함
SELECT *
FROM EMP e RIGHT OUTER JOIN DEPT d
ON e.DEPTNO = d.DEPTNO
ORDER BY d.DEPTNO, d.DNAME;