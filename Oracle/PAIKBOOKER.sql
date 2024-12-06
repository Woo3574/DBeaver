-- BRAND 테이블 생성
CREATE TABLE BRAND_TB(
	BRAND_NO INTEGER NOT NULL PRIMARY KEY, 									/* 브랜드번호 */
	BRAND_NAME VARCHAR2(20) NOT NULL, 										/* 브랜드명 */
	BRAND_LOGO VARCHAR2(500) NOT NULL,                                      /* 브랜드 Logo 이미지 URL */
    BRAND_OPEN VARCHAR2(20) NOT NULL, 								        /* 영업시작시간 */
	BRAND_CLOSE VARCHAR2(20) NOT NULL,									    /* 영업종료시간 */
	BRAND_FOOD VARCHAR2(20) NOT NULL,										/* 음식종류 */
	--UNIQUE 제약조건
	CONSTRAINT UNIQUE_BRAND1 UNIQUE (BRAND_NAME), 							/* MENU */
	CONSTRAINT UNIQUE_BRAND2 UNIQUE (BRAND_LOGO, BRAND_NAME, BRAND_OPEN, BRAND_CLOSE) 	/* STORE */
);


-- BRAND_NO 시퀀스 생성
CREATE SEQUENCE BRAND_NO_SEQ
INCREMENT BY 1
START WITH 1
NOCYCLE
NOCACHE;

-- BRAND 더미 데이터 생성
INSERT INTO BRAND_TB (BRAND_NO, BRAND_NAME, BRAND_LOGO, BRAND_OPEN, BRAND_CLOSE, BRAND_FOOD)
VALUES (BRAND_NO_SEQ.NEXTVAL, '빽보이피자', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F01빽보이피자02.png?alt=media&token=0ea99080-4d4e-42ae-8f6f-db36c4db3564', '11', '22', '양식');

INSERT INTO BRAND_TB (BRAND_NO, BRAND_NAME, BRAND_LOGO, BRAND_OPEN, BRAND_CLOSE, BRAND_FOOD)
VALUES (BRAND_NO_SEQ.NEXTVAL, '역전우동', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F02역전우동02.png?alt=media&token=ec82d374-fd66-46af-9a30-b768114bafd7', '11', '21', '일식');

INSERT INTO BRAND_TB (BRAND_NO, BRAND_NAME, BRAND_LOGO, BRAND_OPEN, BRAND_CLOSE, BRAND_FOOD)
VALUES (BRAND_NO_SEQ.NEXTVAL, '빽다방', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F03빽다방02.png?alt=media&token=244dcfc0-98ca-473d-82dd-9e87924fb3e6', '07', '22', '커피');

INSERT INTO BRAND_TB (BRAND_NO, BRAND_NAME, BRAND_LOGO, BRAND_OPEN, BRAND_CLOSE, BRAND_FOOD)
VALUES (BRAND_NO_SEQ.NEXTVAL, '홍콩반점', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F04홍콩반점02.png?alt=media&token=2afc294f-e914-416b-8b78-16db2de32ee2', '11', '21', '중식');

INSERT INTO BRAND_TB (BRAND_NO, BRAND_NAME, BRAND_LOGO, BRAND_OPEN, BRAND_CLOSE, BRAND_FOOD)
VALUES (BRAND_NO_SEQ.NEXTVAL, '롤링파스타', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F05롤링파스타02.png?alt=media&token=2a7b1176-2efc-4a13-a48f-ee493472f607', '11', '21', '양식');

INSERT INTO BRAND_TB (BRAND_NO, BRAND_NAME, BRAND_LOGO, BRAND_OPEN, BRAND_CLOSE, BRAND_FOOD)
VALUES (BRAND_NO_SEQ.NEXTVAL, '한신포차', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F06한신포차02.png?alt=media&token=e73fa42f-72e6-4c4f-9321-10fae03eabca', '17', '27', '술');

INSERT INTO BRAND_TB (BRAND_NO, BRAND_NAME, BRAND_LOGO, BRAND_OPEN, BRAND_CLOSE, BRAND_FOOD)
VALUES (BRAND_NO_SEQ.NEXTVAL, '백스비어', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F07백스비어02.png?alt=media&token=ae4f1a93-e15f-4d9d-b657-ba99d77fd662', '17', '25', '술');

INSERT INTO BRAND_TB (BRAND_NO, BRAND_NAME, BRAND_LOGO, BRAND_OPEN, BRAND_CLOSE, BRAND_FOOD)
VALUES (BRAND_NO_SEQ.NEXTVAL, '새마을식당', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F08새마을식당02.png?alt=media&token=a972c102-df25-4aa1-ae46-39b0c8e0fd04', '11', '23', '한식');

INSERT INTO BRAND_TB (BRAND_NO, BRAND_NAME, BRAND_LOGO, BRAND_OPEN, BRAND_CLOSE, BRAND_FOOD)
VALUES (BRAND_NO_SEQ.NEXTVAL, '제순식당', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F09제순식당02.png?alt=media&token=34cd5224-6f5e-4e27-b3a1-06401aac747b', '11', '19', '한식');

INSERT INTO BRAND_TB (BRAND_NO, BRAND_NAME, BRAND_LOGO, BRAND_OPEN, BRAND_CLOSE, BRAND_FOOD)
VALUES (BRAND_NO_SEQ.NEXTVAL, '리춘시장', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F10리춘시장02.png?alt=media&token=7c9c6143-c7c8-464d-9402-63778ff66fa3', '17', '24', '중식');

INSERT INTO BRAND_TB (BRAND_NO, BRAND_NAME, BRAND_LOGO, BRAND_OPEN, BRAND_CLOSE, BRAND_FOOD)
VALUES (BRAND_NO_SEQ.NEXTVAL, '고투웍', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F11고투웍02.png?alt=media&token=fe20e09d-b3ca-48d6-a72c-a09d94abb9e7', '10', '21', '중식');

INSERT INTO BRAND_TB (BRAND_NO, BRAND_NAME, BRAND_LOGO, BRAND_OPEN, BRAND_CLOSE, BRAND_FOOD)
VALUES (BRAND_NO_SEQ.NEXTVAL, '홍콩분식', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F12홍콩분식02.png?alt=media&token=903fc722-45f1-4109-8300-aa9039defeb6', '11', '21', '중식');

INSERT INTO BRAND_TB (BRAND_NO, BRAND_NAME, BRAND_LOGO, BRAND_OPEN, BRAND_CLOSE, BRAND_FOOD)
VALUES (BRAND_NO_SEQ.NEXTVAL, '백종원의쌈밥', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F13쌈밥02.png?alt=media&token=2c54579b-08d4-497b-be7b-912defbd4711', '11', '22', '한식');

INSERT INTO BRAND_TB (BRAND_NO, BRAND_NAME, BRAND_LOGO, BRAND_OPEN, BRAND_CLOSE, BRAND_FOOD)
VALUES (BRAND_NO_SEQ.NEXTVAL, '본가', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F14본가02.png?alt=media&token=c82e10e3-f4e7-4a90-92fe-8b122d07d95d', '11', '22', '한식');

INSERT INTO BRAND_TB (BRAND_NO, BRAND_NAME, BRAND_LOGO, BRAND_OPEN, BRAND_CLOSE, BRAND_FOOD)
VALUES (BRAND_NO_SEQ.NEXTVAL, '인생설렁탕', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F15인생설렁탕02.png?alt=media&token=7f2e9288-a6b2-48e5-83cb-f54a938d8488', '11', '22', '한식');

INSERT INTO BRAND_TB (BRAND_NO, BRAND_NAME, BRAND_LOGO, BRAND_OPEN, BRAND_CLOSE, BRAND_FOOD)
VALUES (BRAND_NO_SEQ.NEXTVAL, '막이오름', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F16막이오름02.png?alt=media&token=b50da95c-576e-442f-9582-215a23a28c95', '17', '26', '술');

INSERT INTO BRAND_TB (BRAND_NO, BRAND_NAME, BRAND_LOGO, BRAND_OPEN, BRAND_CLOSE, BRAND_FOOD)
VALUES (BRAND_NO_SEQ.NEXTVAL, '연돈볼카츠', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F17연돈볼카츠02.png?alt=media&token=dae163e8-72f8-461a-9476-137fadcabd70', '11', '22', '일식');

INSERT INTO BRAND_TB (BRAND_NO, BRAND_NAME, BRAND_LOGO, BRAND_OPEN, BRAND_CLOSE, BRAND_FOOD)
VALUES (BRAND_NO_SEQ.NEXTVAL, '돌배기집', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F18돌배기집02.png?alt=media&token=9ee9f66b-fcbc-4331-996a-b5e959506c1b', '08', '24', '한식');

INSERT INTO BRAND_TB (BRAND_NO, BRAND_NAME, BRAND_LOGO, BRAND_OPEN, BRAND_CLOSE, BRAND_FOOD)
VALUES (BRAND_NO_SEQ.NEXTVAL, '미정국수', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F19미정국수02.png?alt=media&token=f045a3cc-d3dd-4f47-af90-7907078a4c4f', '08', '24', '한식');

INSERT INTO BRAND_TB (BRAND_NO, BRAND_NAME, BRAND_LOGO, BRAND_OPEN, BRAND_CLOSE, BRAND_FOOD)
VALUES (BRAND_NO_SEQ.NEXTVAL, '백철판', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F20백철판02.png?alt=media&token=7142b4ab-365b-41ad-bbe2-638199316daf', '11', '23', '한식');


-- BRAND 테스트용 쿼리문
SELECT * FROM BRAND_TB;							/*전체 데이터 조회*/

DELETE FROM BRAND_TB WHERE BRAND_NO = '';		/* 브랜드번호 단위로 데이터 삭제 */

DROP SEQUENCE BRAND_NO_SEQ;						/* BRAND_NO 시퀀스 삭제 */

DROP TABLE BRAND_TB;							/* BRAND 테이블 삭제 */




-- STORE 테이블 생성
CREATE TABLE STORE_TB(
	STORE_NO INTEGER NOT NULL PRIMARY KEY, 					/* 매장번호 */
	STORE_NAME VARCHAR2(100) NOT NULL, 						/* 매장명 */
	STORE_IMG VARCHAR2(500) NOT NULL, 						/* 매장 사진 이미지 url*/
	STORE_PHONE VARCHAR2(15) NOT NULL, 						/* 매장 연락처 */
	STORE_ADDR VARCHAR2(100) NOT NULL, 						/* 매장 주소 */
	STORE_MAP VARCHAR2(50) NOT NULL, 						/* 매장 위치(위도, 경도) */
	BRAND_NAME VARCHAR2(20) NOT NULL, 						/* 브랜드명 */
	BRAND_LOGO VARCHAR2(500) NOT NULL,  					/* 브랜드 Logo 이미지 URL */
    BRAND_OPEN VARCHAR2(20) NOT NULL, 						/* 영업 시작 시간 (날짜는 임의 값) */
    BRAND_CLOSE VARCHAR2(20) NOT NULL, 						/* 영업 종료 시간 (날짜는 임의 값) */
	-- UNIQUE 제약조건
	CONSTRAINT UNIQUE_STORE1 UNIQUE (STORE_NO, STORE_NAME, STORE_PHONE, BRAND_NAME), 	/* RESERVATION */
	--	FK 제약조건
	CONSTRAINT FK_STORE_BRAND
		FOREIGN KEY (BRAND_LOGO, BRAND_NAME, BRAND_OPEN, BRAND_CLOSE)
		REFERENCES BRAND_TB (BRAND_LOGO, BRAND_NAME, BRAND_OPEN, BRAND_CLOSE)
		ON DELETE CASCADE
);


-- STORE_NO 시퀀스 생성
CREATE SEQUENCE STORE_NO_SEQ
INCREMENT BY 1
START WITH 1
NOCYCLE
NOCACHE;


-- STORE 더미 데이터 생성
INSERT INTO STORE_TB (STORE_NO, STORE_NAME, STORE_IMG, STORE_PHONE, STORE_ADDR, STORE_MAP, BRAND_NAME, BRAND_LOGO, BRAND_OPEN, BRAND_CLOSE)
SELECT STORE_NO_SEQ.NEXTVAL, '백종원의 빽보이피자 신논현역점', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F01빽보이피자01.png?alt=media&token=73658b91-8b0f-4c8f-82e7-3acc11ef09ec', '1668-3791', '서울 서초구 사평대로55길 18 1층', '37.504821583727015, 127.02274378520693',
B.BRAND_NAME, B.BRAND_LOGO, B.BRAND_OPEN, B.BRAND_CLOSE FROM BRAND_TB B WHERE B.BRAND_NAME = '빽보이피자';

INSERT INTO STORE_TB (STORE_NO, STORE_NAME, STORE_IMG, STORE_PHONE, STORE_ADDR, STORE_MAP, BRAND_NAME, BRAND_LOGO, BRAND_OPEN, BRAND_CLOSE)
SELECT STORE_NO_SEQ.NEXTVAL, '백종원의 빽보이피자 서초점', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F01빽보이피자01.png?alt=media&token=73658b91-8b0f-4c8f-82e7-3acc11ef09ec', '070-8840-3804', '서울 서초구 서초대로 280 1층', '37.492990664525664, 127.01233127061306',
B.BRAND_NAME, B.BRAND_LOGO, B.BRAND_OPEN, B.BRAND_CLOSE FROM BRAND_TB B WHERE B.BRAND_NAME = '빽보이피자';

INSERT INTO STORE_TB (STORE_NO, STORE_NAME, STORE_IMG, STORE_PHONE, STORE_ADDR, STORE_MAP, BRAND_NAME, BRAND_LOGO, BRAND_OPEN, BRAND_CLOSE)
SELECT STORE_NO_SEQ.NEXTVAL, '백종원의 빽보이피자 강남청담점', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F01빽보이피자01.png?alt=media&token=73658b91-8b0f-4c8f-82e7-3acc11ef09ec', '02-3446-7776', '서울 강남구 삼성로145길 14 103호', '37.52250555013786, 127.04721495360617',
B.BRAND_NAME, B.BRAND_LOGO, B.BRAND_OPEN, B.BRAND_CLOSE FROM BRAND_TB B WHERE B.BRAND_NAME = '빽보이피자';

INSERT INTO STORE_TB (STORE_NO, STORE_NAME, STORE_IMG, STORE_PHONE, STORE_ADDR, STORE_MAP, BRAND_NAME, BRAND_LOGO, BRAND_OPEN, BRAND_CLOSE)
SELECT STORE_NO_SEQ.NEXTVAL, '백종원의 빽보이피자 건대점', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F01빽보이피자01.png?alt=media&token=73658b91-8b0f-4c8f-82e7-3acc11ef09ec', '1668-1089', '서울 광진구 능동로13길 54 1층', '37.54425350218965, 127.06985146298014',
B.BRAND_NAME, B.BRAND_LOGO, B.BRAND_OPEN, B.BRAND_CLOSE FROM BRAND_TB B WHERE B.BRAND_NAME = '빽보이피자';

INSERT INTO STORE_TB (STORE_NO, STORE_NAME, STORE_IMG, STORE_PHONE, STORE_ADDR, STORE_MAP, BRAND_NAME, BRAND_LOGO, BRAND_OPEN, BRAND_CLOSE)
SELECT STORE_NO_SEQ.NEXTVAL, '백종원의 빽보이피자 송파헬리오시티점', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F01빽보이피자01.png?alt=media&token=73658b91-8b0f-4c8f-82e7-3acc11ef09ec', '1668-5490', '서울 송파구 가락로12길 4 1층', '37.499778661506284, 127.10513344077887',
B.BRAND_NAME, B.BRAND_LOGO, B.BRAND_OPEN, B.BRAND_CLOSE FROM BRAND_TB B WHERE B.BRAND_NAME = '빽보이피자';

INSERT INTO STORE_TB (STORE_NO, STORE_NAME, STORE_IMG, STORE_PHONE, STORE_ADDR, STORE_MAP, BRAND_NAME, BRAND_LOGO, BRAND_OPEN, BRAND_CLOSE)
SELECT STORE_NO_SEQ.NEXTVAL, '역전우동0410 역삼테헤란로점', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F02역전우동01.png?alt=media&token=0c235c92-8e33-4e42-93ff-f0cf05867bd0', '02-553-2111', '서울 강남구 테헤란로10길 25 104호', '37.497588576835305, 127.03305220574101',
B.BRAND_NAME, B.BRAND_LOGO, B.BRAND_OPEN, B.BRAND_CLOSE FROM BRAND_TB B WHERE B.BRAND_NAME = '역전우동';


-- STORE 테스트용 쿼리문
SELECT * FROM STORE_TB;							/* 전체 데이터 조회 */

DELETE FROM STORE_TB WHERE BRAND_NAME = ''; 	/* 브랜드명 단위로 데이터 삭제 */

DROP SEQUENCE STORE_NO_SEQ;						/* STORE_NO 시퀀스 삭제 */

DROP TABLE STORE_TB;							/* STORE 테이블 삭제 */

COMMIT;


-- USER 테이블 생성
CREATE TABLE USER_TB (
	USER_NO INTEGER NOT NULL PRIMARY KEY,					/* 회원번호 */
	USER_ID VARCHAR2(20) NOT NULL,							/* ID */
	USER_PW VARCHAR2(20) NOT NULL,							/* PW */
	USER_NAME VARCHAR2(20) NOT NULL,						/* 이름 */
	USER_MAIL VARCHAR2(100) NOT NULL,						/* 메일 */
	USER_BIRTH DATE NOT NULL,								/* 생년월일 */
	USER_PHONE VARCHAR2(13) NOT NULL,						/* 전화번호 */
	USER_IMG VARCHAR2(500) NOT NULL,						/* 프로필 이미지 URL */
	--UNIQUE 제약조건
    CONSTRAINT UNIQUE_USER1 UNIQUE (USER_ID, USER_NAME) 	/* RESERVATION */
);


-- USER_NO 시퀀스 생성
CREATE SEQUENCE USER_NO_SEQ
INCREMENT BY 1
START WITH 1
NOCYCLE
NOCACHE;


-- USER 더미 데이터 생성
INSERT INTO USER_TB (USER_NO, USER_ID, USER_PW, USER_NAME, USER_MAIL, USER_BIRTH, USER_PHONE, USER_IMG)
VALUES (USER_NO_SEQ.NEXTVAL, 'testid01', 'testpw01', '테스트이름01', 'test01@gmail.com', '2001-01-01', '010-0001-0001', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2FDefault_Profile.png?alt=media&token=8def32c4-cf3f-45f1-a737-970eb0a59757');

INSERT INTO USER_TB (USER_NO, USER_ID, USER_PW, USER_NAME, USER_MAIL, USER_BIRTH, USER_PHONE, USER_IMG)
VALUES (USER_NO_SEQ.NEXTVAL, 'testid02', 'testpw02', '테스트이름02', 'test02@gmail.com', '2002-02-02', '010-0002-0002', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2FDefault_Profile.png?alt=media&token=8def32c4-cf3f-45f1-a737-970eb0a59757');

INSERT INTO USER_TB (USER_NO, USER_ID, USER_PW, USER_NAME, USER_MAIL, USER_BIRTH, USER_PHONE, USER_IMG)
VALUES (USER_NO_SEQ.NEXTVAL, 'testid03', 'testpw03', '테스트이름03', 'test03@gmail.com', '2003-03-03', '010-0003-0003', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2FDefault_Profile.png?alt=media&token=8def32c4-cf3f-45f1-a737-970eb0a59757');

INSERT INTO USER_TB (USER_NO, USER_ID, USER_PW, USER_NAME, USER_MAIL, USER_BIRTH, USER_PHONE, USER_IMG)
VALUES (USER_NO_SEQ.NEXTVAL, 'testid04', 'testpw04', '테스트이름04', 'test04@gmail.com', '2004-04-04', '010-0004-0004', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2FDefault_Profile.png?alt=media&token=8def32c4-cf3f-45f1-a737-970eb0a59757');

INSERT INTO USER_TB (USER_NO, USER_ID, USER_PW, USER_NAME, USER_MAIL, USER_BIRTH, USER_PHONE, USER_IMG)
VALUES (USER_NO_SEQ.NEXTVAL, 'testid05', 'testpw05', '테스트이름05', 'test05@gmail.com', '2005-05-05', '010-0005-0005', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2FDefault_Profile.png?alt=media&token=8def32c4-cf3f-45f1-a737-970eb0a59757');

INSERT INTO USER_TB (USER_NO, USER_ID, USER_PW, USER_NAME, USER_MAIL, USER_BIRTH, USER_PHONE, USER_IMG)
VALUES (USER_NO_SEQ.NEXTVAL, 'testid06', 'testpw06', '테스트이름06', 'test06@gmail.com', '2006-06-06', '010-0006-0006', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2FDefault_Profile.png?alt=media&token=8def32c4-cf3f-45f1-a737-970eb0a59757');

INSERT INTO USER_TB (USER_NO, USER_ID, USER_PW, USER_NAME, USER_MAIL, USER_BIRTH, USER_PHONE, USER_IMG)
VALUES (USER_NO_SEQ.NEXTVAL, 'testid07', 'testpw07', '테스트이름07', 'test07@gmail.com', '2007-07-07', '010-0007-0007', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2FDefault_Profile.png?alt=media&token=8def32c4-cf3f-45f1-a737-970eb0a59757');

INSERT INTO USER_TB (USER_NO, USER_ID, USER_PW, USER_NAME, USER_MAIL, USER_BIRTH, USER_PHONE, USER_IMG)
VALUES (USER_NO_SEQ.NEXTVAL, 'testid08', 'testpw08', '테스트이름08', 'test08@gmail.com', '2008-08-08', '010-0008-0008', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2FDefault_Profile.png?alt=media&token=8def32c4-cf3f-45f1-a737-970eb0a59757');

INSERT INTO USER_TB (USER_NO, USER_ID, USER_PW, USER_NAME, USER_MAIL, USER_BIRTH, USER_PHONE, USER_IMG)
VALUES (USER_NO_SEQ.NEXTVAL, 'testid09', 'testpw09', '테스트이름09', 'test09@gmail.com', '2009-09-09', '010-0009-0009', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2FDefault_Profile.png?alt=media&token=8def32c4-cf3f-45f1-a737-970eb0a59757');

INSERT INTO USER_TB (USER_NO, USER_ID, USER_PW, USER_NAME, USER_MAIL, USER_BIRTH, USER_PHONE, USER_IMG)
VALUES (USER_NO_SEQ.NEXTVAL, 'testid10', 'testpw10', '테스트이름10', 'test10@gmail.com', '2010-10-10', '010-0010-0010', 'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2FDefault_Profile.png?alt=media&token=8def32c4-cf3f-45f1-a737-970eb0a59757');


-- USER 테스트용 쿼리문
SELECT * FROM USER_TB;						/* 전체 데이터 조회 */

DELETE FROM USER_TB WHERE USER_ID = '';		/* ID 단위로 데이터 삭제 */

DROP SEQUENCE USER_NO_SEQ;  				/* USER_NO 시퀀스 삭제 */

DROP TABLE USER_TB;							/* USER 테이블 삭제 */

COMMIT;


-- RESERVATION 테이블 생성
CREATE TABLE RESERVATION_TB (
    R_NO INTEGER NOT NULL PRIMARY KEY,            								/* 예약번호 */
    R_TIME VARCHAR2(20) NOT NULL,                                 /* 예약 시간 (날짜와 시간 포함) */
    R_PERSON_CNT INTEGER NOT NULL,             				   					/* 예약 인원수 */
    USER_ID VARCHAR2(20) NOT NULL,                								/* 예약자ID */
    USER_NAME VARCHAR2(20) NOT NULL,             								/* 예약자명 */
	STORE_NO INTEGER NOT NULL, 													/* 매장번호 */
    STORE_NAME VARCHAR2(100) NOT NULL,             								/* 매장명 */
    STORE_PHONE VARCHAR2(15) NOT NULL,         			   						/* 매장 전화번호 */
    BRAND_NAME VARCHAR2(20) NOT NULL,             								/* 브랜드명 */
    -- FK 제약 조건
    CONSTRAINT FK_RESERVATION_USER
        FOREIGN KEY (USER_ID, USER_NAME)
        REFERENCES USER_TB (USER_ID, USER_NAME)
        ON DELETE CASCADE,
    CONSTRAINT FK_RESERVATION_STORE
        FOREIGN KEY (STORE_NO, STORE_NAME, STORE_PHONE, BRAND_NAME)
        REFERENCES STORE_TB (STORE_NO, STORE_NAME, STORE_PHONE, BRAND_NAME)
        ON DELETE CASCADE,
    -- UNIQUE 제약조건
    CONSTRAINT UNIQUE_RESERVATION1 UNIQUE (R_NO, R_TIME, USER_ID, STORE_NAME) 	/* REVIEW */
);


-- R_NO 시퀀스 생성
CREATE SEQUENCE R_NO_SEQ
INCREMENT BY 1
START WITH 1
NOCYCLE
NOCACHE;


--RESERVATION 더미 데이터 생성
INSERT INTO RESERVATION_TB (R_NO, R_TIME, R_PERSON_CNT, USER_ID, USER_NAME, STORE_NO, STORE_NAME, STORE_PHONE, BRAND_NAME)
SELECT R_NO_SEQ.NEXTVAL, '17', 3, 'testid01',
U.USER_NAME, 1, S.STORE_NAME, S.STORE_PHONE, S.BRAND_NAME FROM USER_TB U, STORE_TB S WHERE U.USER_ID = 'testid01' AND S.STORE_NO = 1;

INSERT INTO RESERVATION_TB (R_NO, R_TIME, R_PERSON_CNT, USER_ID, USER_NAME, STORE_NO, STORE_NAME, STORE_PHONE, BRAND_NAME)
SELECT R_NO_SEQ.NEXTVAL, '18', 5, 'testid02',
U.USER_NAME, 1, S.STORE_NAME, S.STORE_PHONE, S.BRAND_NAME FROM USER_TB U, STORE_TB S WHERE U.USER_ID = 'testid02' AND S.STORE_NO = 1;

INSERT INTO RESERVATION_TB (R_NO, R_TIME, R_PERSON_CNT, USER_ID, USER_NAME, STORE_NO, STORE_NAME, STORE_PHONE, BRAND_NAME)
SELECT R_NO_SEQ.NEXTVAL, '20', 4, 'testid03',
U.USER_NAME, 1, S.STORE_NAME, S.STORE_PHONE, S.BRAND_NAME FROM USER_TB U, STORE_TB S WHERE U.USER_ID = 'testid03' AND S.STORE_NO = 1;

INSERT INTO RESERVATION_TB (R_NO, R_TIME, R_PERSON_CNT, USER_ID, USER_NAME, STORE_NO, STORE_NAME, STORE_PHONE, BRAND_NAME)
SELECT R_NO_SEQ.NEXTVAL, '17', 2, 'testid04',
U.USER_NAME, 6, S.STORE_NAME, S.STORE_PHONE, S.BRAND_NAME FROM USER_TB U, STORE_TB S WHERE U.USER_ID = 'testid04' AND S.STORE_NO = 6;

INSERT INTO RESERVATION_TB (R_NO, R_TIME, R_PERSON_CNT, USER_ID, USER_NAME, STORE_NO, STORE_NAME, STORE_PHONE, BRAND_NAME)
SELECT R_NO_SEQ.NEXTVAL, '19', 6, 'testid05',
U.USER_NAME, 6, S.STORE_NAME, S.STORE_PHONE, S.BRAND_NAME FROM USER_TB U, STORE_TB S WHERE U.USER_ID = 'testid05' AND S.STORE_NO = 6;

INSERT INTO RESERVATION_TB (R_NO, R_TIME, R_PERSON_CNT, USER_ID, USER_NAME, STORE_NO, STORE_NAME, STORE_PHONE, BRAND_NAME)
SELECT R_NO_SEQ.NEXTVAL, '20', 1, 'testid06',
U.USER_NAME, 6, S.STORE_NAME, S.STORE_PHONE, S.BRAND_NAME FROM USER_TB U, STORE_TB S WHERE U.USER_ID = 'testid06' AND S.STORE_NO = 6;


-- RESERVATION 테스트용 쿼리문
SELECT * FROM RESERVATION_TB;	/* 전체 데이터 조회 */

DELETE FROM RESERVATION_TB WHERE STORE_NO = '6'; /* 매장명 단위로 데이터 삭제 */

DROP SEQUENCE R_NO_SEQ;			/* R_NO 시퀀스 삭제 */

DROP TABLE RESERVATION_TB;		/* RESERVATION 테이블 삭제 */

COMMIT;



-- * 테스트용 쿼리문
SELECT * FROM BRAND_TB;
SELECT * FROM STORE_TB;
SELECT * FROM USER_TB;
SELECT * FROM RESERVATION_TB;

DROP TABLE BRAND_TB;
DROP TABLE STORE_TB;
DROP TABLE USER_TB;
DROP TABLE RESERVATION_TB;

-- 참조 무결성이 유지되는지 확인

SELECT * 
FROM STORE_TB 
WHERE BRAND_NAME = '빽보이피자';

SELECT B.BRAND_NAME, R.R_TIME, S.STORE_NO, S.STORE_NAME, S.STORE_PHONE, S.STORE_ADDR FROM RESERVATION_TB R
JOIN STORE_TB S ON R.STORE_NO = S.STORE_NO
JOIN BRAND_TB B ON S.BRAND_NAME = B.BRAND_NAME   WHERE 1=1;
                    
