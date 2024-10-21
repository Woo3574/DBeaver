-- DML (Data Manipulation Language) : insert(입력), update(수정), delete(삭제)
-- 연습용 테이블 생성하기
CREATE TABLE DEPT_TEMP
AS SELECT * FROM DEPT;

SELECT * FROM DEPT_TEMP;

-- TABLE에 데이터를 추가하는 insert 문
-- INSERT INTO 테이블명(컬럼명...) VALUES(데이터...)
INSERT INTO DEPT_TEMP (DEPTNO, DNAME, LOC) VALUES (50, 'DATABASE', 'SEOUL');
INSERT INTO DEPT_TEMP VALUES (60, 'BACKEND', 'BUSAN');
INSERT INTO DEPT_TEMP (DEPTNO) VALUES (70);
INSERT INTO DEPT_TEMP VALUES (80, 'FRONTEND', 'INCHUN');
INSERT INTO DEPT_TEMP (DNAME, LOC) VALUES ('APP', 'DAEGU');

INSERT INTO DEPT VALUES (40, 'BACKEND', 'BUSAN'); 

SELECT * FROM DEPT_TEMP;
DELETE FROM DEPT_TEMP
	WHERE DEPTNO = 70;
	
INSERT INTO DEPT_TEMP VALUES (70, '웹개발', '');

CREATE TABLE EMP_TEMP
AS SELECT *
FROM EMP
	WHERE 1 != 1; -- 테이블과 컬럼만 복사하기위해서

SELECT * FROM EMP_TEMP;

INSERT INTO EMP_TEMP ( EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
	VALUES (9001, '나영석', 'PD', NULL, '2020.01.01', 9900, 1000, 50);

INSERT INTO EMP_TEMP ( EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
	VALUES (9002, '강호동', 'MC', NULL, TO_DATE('2021.01.02', 'YYYY/MM/DD'), 8000, 1000, 60);

INSERT INTO EMP_TEMP ( EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
	VALUES (9003, '서장훈', 'MC', NULL, SYSDATE, 9000, 1000, 70);

SELECT * FROM DEPT_TEMP;

INSERT INTO DEPT_TEMP (DEPTNO, DNAME, LOC) VALUES (80, 'FRONTEND', 'SUWON');

DELETE FROM DEPT_TEMP
	WHERE DEPTNO = 80;

ROLLBACK;

UPDATE DEPT_TEMP
	SET DNAME = 'WEB-PROGRAM',
		LOC = 'SUWON'
		WHERE DEPTNO = 70; 
		
COMMIT;
ROLLBACK; -- AUTO 커밋아닌상태에서 가능
DELETE FROM DEPT_TEMP
	WHERE LOC = 'SUWON';