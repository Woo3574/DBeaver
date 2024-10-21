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