CREATE TABLE MEMBER(
	USER_NO INT NOT NULL PRIMARY KEY,
	USER_NAME VARCHAR2(20) NOT NULL,
	USER_ID VARCHAR2(20) UNIQUE,
	USER_PW VARCHAR2(20) NOT NULL,
	USER_MAIL VARCHAR2(100) NOT NULL,
	USER_BIRTH DATE NOT NULL,
	USER_PHONE VARCHAR2(13) UNIQUE,
	USER_IMG VARCHAR2(30)
);

DROP TABLE MEMBER;

CREATE TABLE STORE(
	STORE_NO NUMBER(20) PRIMARY KEY, -- 매장명
	BRAND_NAME VARCHAR2(20) UNIQUE NOT NULL, -- 브랜드명
	STORE_NAME VARCHAR2(20) UNIQUE NOT NULL, -- 지점명
	STORE_HOUR VARCHAR2(20)	NOT NULL, -- 매장 시간
	STORE_ADDR VARCHAR2(100) UNIQUE NOT NULL, -- 매장 주소
	STORE_MAP VARCHAR2(50), -- 매장 위치(위도, 경도)
	STORE_PHONE VARCHAR2(15) UNIQUE NOT NULL -- 매장 연락처
);

ALTER TABLE STORE
DROP COLUMN RV_AVG;

DROP TABLE REVIEW;

CREATE TABLE REVIEW (
	RV_NO NUMBER(20) PRIMARY KEY,
	STORE_NAME VARCHAR2(20) REFERENCES STORE(STORE_NAME),
	RV_DATE DATE,
	RV_AVG DECIMAL(3,1) NOT NULL
);

SELECT * FROM STORE;
SELECT * FROM REVIEW;
SELECT constraint_name 
FROM user_constraints 
WHERE table_name = 'STORE' AND column_name = 'BRAND_NAME';
SELECT uc.constraint_name, uc.constraint_type
FROM user_constraints uc
JOIN user_cons_columns ucc
  ON uc.constraint_name = ucc.constraint_name
WHERE ucc.table_name = 'STORE'
  AND ucc.column_name = 'BRAND_NAME';
ALTER TABLE STORE DROP CONSTRAINT SYS_C007197;