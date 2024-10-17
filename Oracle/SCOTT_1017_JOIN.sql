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
-- 오라클 조인
SELECT EMPNO, ENAME, JOB, SAL, E.DEPTNO
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
ORDER BY EMPNO;

-- ANSI 조인 미국 표준 방식
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
