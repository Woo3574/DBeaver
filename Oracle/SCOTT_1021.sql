-- DDL(Data Definition Language) : 데이터베이스에 데이터를 보관하기 위해 제공되는 생성, 변경, 삭제 관련 기능을 수행 
-- CREATE : 새로운 데이터베이스의 개체(Entity)를 생성 - 테이블, 뷰, 인덱스
-- ALTER : 기존 데이터베이스의 개체(Entity)를 수정
-- DROP : 데이터베이스 개체(Entity)를 삭제
-- TURNCATE : 모든 데이터를 삭제하지만 테이블 구조는 담겨 둠
-- TABLE이란? 데이터베이스의 기본 데이터 저장 단위인 테이블은 사용자가 접근 가능한 데이터를 보유하며 레코드(행)와 컬럼(열)으로 구성
-- 데이터를 보유하며 레코드(행)와 컬럼(열)으로 구성
-- 테이블과 테이블의 관계를 표현하는 데 외래키(FOREIN KEY)를 사용

CREATE TABLE EMP_DDL(
	EMPNO NUMBER(4), -- 숫자형 데이터 타입, 4자리러 산안, 최대크기로 38자리까지의 숫자 지정 가능
	ENAME VARCHAR2(10), -- 가변문자 데이터 타입, 최대 크기는 4000 BYTE, 실제 입력된 크기 만큼 차지
	JOB VARCHAR2(9),
	MGR NUMBER(4),
	HIREDATE DATE, -- 날짜와 시간을 지정하는 날짜형 데이터 타입
	SAL NUMBER(7, 2), -- 전체 범위가 7자리에 소수점 이하가 2자리(정수부는 5자리가 됨)
	COMM NUMBER(7, 2),
	DEPTNO NUMBER(2)
);

SELECT * FROM EMP_DDL;

-- 기존 테이블의 열 구조와 데이터를 복사하여 새 테이블 생성하기
CREATE TABLE DEPT_DDL
	AS SELECT * FROM DEPT;
	
SELECT * FROM DEPT_DDL;

CREATE TABLE EMP_ALTER
	AS SELECT * FROM EMP;
	
SELECT * FROM EMP_ALTER;

-- 열 이름을 추가하는 ADD : 기존 테이블에 새로운 컬럼을 추가하는 명령, 컬럼값은 NULL로 입력
ALTER TABLE EMP_ALTER
	ADD HP VARCHAR2(20);

-- 열 이름을 변경하는 RENAME 
ALTER TABLE EMP_ALTER
	RENAME COLUMN HP TO TEL;
	
-- 자료형을 변경하는 MODIFY
-- 저료형 변경 시 데이터가 이미 존재하는 경우 크기를 크게 하는 경우느 문제가 되지 않으나
-- 크기를 줄이는 경우 저장되어 있는 데이터 크기에 따라 변경되지않을 수 있음
ALTER TABLE EMP_ALTER
	MODIFY EMPNO NUMBER(5);
	
-- 특정 열을 삭제하는 DROP
ALTER TABLE EMP_ALTER
	DROP COLUMN TEL;
	
SELECT * FROM EMP_ALTER;

-- 테이블 이름을 변경하는 RENAME
RENAME EMP_ALTER TO EMP_RENAME;

SELECT * FROM EMP_RENAME;

-- 테이블의 데이터를 삭제하는 TRUNCATE : 테이블의 모든 데이터 삭제, 테이블 구조에 영향을 주지 않음
-- DDL 명령어 이기 때문에 ROLLBACK 불가
DELETE FROM EMP_RENAME; -- DELETE는 DML이기 때문에 ROLLBACK 가능
ROLLBACK;
TRUNCATE TABLE EMP_RENAME;

-- 테이블을 삭제하는 DROP
DROP TABLE EMP_RENAME;

-- 제약 조건 : 데이터의 무결성(정확하고 일관된 값)을 보장하기 위해 테이블에 설저되는 규칙
-- NOT NULL : 지정한 열에 값이 있어야 함
-- UNIQUE : 값이 유일해야 함, 단 NULL 허용
-- PRIMARY KEY(PK) : 유일해야하고 NULL이면 안됨
-- FOREIGN KEY(FK) : 다른 테이블의 열을 참조하여 존재하는 값만 입력 할 수 있음
-- CHECK : 설정한 조건식을 만족하는데이터만 입력 가능
CREATE TABLE TABLE_NOTNULL (
	LOGIN_ID VARCHAR2(20) NOT NULL,
	LOGIN_PWD VARCHAR2(20) NOT NULL,
	TEL VARCHAR2(20)
);

SELECT * FROM TABLE_NOTNULL;

INSERT INTO TABLE_NOTNULL(LOGIN_ID, LOGIN_PWD, TEL)
	VALUES ('곰돌이사육사', 'SPHB8250', '010-5006-4146');

UPDATE TABLE_NOTNULL
	SET LOGIN_PWD = 'TEST13245678'
	WHERE LOGIN_ID = '곰돌이사육사';
	
UPDATE TABLE_NOTNULL
	SET TEL = '12345678'
	WHERE LOGIN_ID = '곰돌이 사육사';

-- 이미 만들어진 테이블에 제약 조건 지정하기
ALTER TABLE TABLE_NOTNULL
	MODIFY TEL NOT NULL;
	
-- UNIQUE 제약 조건 : 중복 허용하지않는 특성
CREATE TABLE TABLE_UNIQUE(
	LOGIN_ID VARCHAR2(20) UNIQUE,
	LOGIN_PWD VARCHAR2(20) NOT NULL,
	TEL VARCHAR2(20)
);

INSERT INTO TABLE_UNIQUE (LOGIN_ID, LOGIN_PWD, TEL)
	VALUES('안유진', 'PWD12345', '010-1234-5678');
	
INSERT INTO TABLE_UNIQUE (LOGIN_ID, LOGIN_PWD, TEL)
	VALUES('장원영', 'PWD4567', '010-4567-5678');
	
INSERT INTO TABLE_UNIQUE (LOGIN_ID, LOGIN_PWD, TEL)
	VALUES('NULL', 'PWD3333', '010-3333-5678');

SELECT * FROM TABLE_UNIQUE;

-- 유일하게 하나만 있는 값(PRIMARY KEY) : UNIQUE, NOT NULL 제약 조건을 모두 가짐
-- PK로 지정하면 자동으로 인덱스가 만들어짐 (PK를 통한 검색 속도를 빠르게 하기 위해서)(인덱스가 만들어진다는 의미는 검색을 빠르게하기위해서)
CREATE TABLE TABLE_PK (
	LOGIN_ID VARCHAR2(20) PRIMARY KEY,
	LOGIN_PWD VARCHAR2(20) NOT NULL,
	TEL VARCHAR2(20)
);

INSERT INTO TABLE_PK VALUES('안유진', 'PWD1234', '010-1234-5678');
INSERT INTO TABLE_PK VALUES('장원영', 'PWD1234', '010-1234-5678');
INSERT INTO TABLE_PK VALUES('이서', 'PWD1234', '010-1234-5678');
SELECT * FROM TABLE_PK;

DELETE FROM TABLE_PK
	WHERE LOGIN_PWD = 'PWD1234';

-- 다른 테이블과 관계를 맺는 FOREIGN KEY
-- 서로 다른 테이블간 관계를 정의하는 데 사용하는 제약 조간
-- 참조하고 있는 기본키의 데이터타입과 일치해야 하며, 외래키에 참조되고 있는 기본키는 삭제 불가
CREATE TABLE DEPT_FK(
	DEPTNO NUMBER(2) PRIMARY KEY,
	DNAME VARCHAR2(14),
	LOC VARCHAR2(13)
);

CREATE TABLE EMP_FK(
	EMPNO NUMBER(4) PRIMARY KEY,
	ENAME VARCHAR2(10),
	JOB VARCHAR2(9),
	MGR NUMBER(4),
	HIREDATE DATE,
	SAL NUMBER(7, 2),
	COMM NUMBER(7, 2),
	DEPTNO NUMBER(2) REFERENCES DEPT_FK (DEPTNO)
);
INSERT INTO DEPT_FK VALUES(10, '아이돌팀', 'SEOUL');
SELECT * FROM DEPT_FK;

INSERT INTO EMP_FK VALUES (2001, '안유진', 'IVE', 1001, '2004/09/01', 9000, 1000, 10);
SELECT * FROM EMP_FK;

DELETE FROM EMP_FK
	WHERE DEPTNO = 10;

DELETE FROM DEPT_FK
	WHERE DEPTNO = 10;
	
-- 데이터 형태와 범위를 정하는 CHECK
-- ID 및 PWD 등의 길이제한
-- 유효 범위값 확인 등에 사용
CREATE TABLE TABLE_CHECK (
	LOGIN_ID VARCHAR2(20) PRIMARY KEY,
	LOGIN_PWD VARCHAR2(20) CHECK(LENGTH(LOGIN_PWD) > 6),
	TEL VARCHAR2(20)
);

INSERT INTO TABLE_CHECK VALUES('민지', '1234567', '010-1234-5678');

-- 기본값을 정하는 DEFAULT : 특정 열에 저장할 값을 지정하지 않는 경우 기본값을 지정
CREATE TABLE TABEL_DEFAULT(
	LOGIN_ID VARCHAR2(20) PRIMARY KEY,
	LOGIN_PWD VARCHAR2(20) DEFAULT '1234567',
	TEL VARCHAR2(20)
);

INSERT INTO TABEL_DEFAULT VALUES('레이', NULL, '12345678');
INSERT INTO TABEL_DEFAULT(LOGIN_ID, TEL) VALUES('이서', '123456789');

SELECT * FROM TABEL_DEFAULT;