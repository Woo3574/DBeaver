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
	STORE_NO NUMBER(20) PRIMARY KEY, -- 매장번호
	BRAND_NAME VARCHAR2(20) UNIQUE NOT NULL, -- 브랜드명
	STORE_NAME VARCHAR2(20) UNIQUE NOT NULL, -- 지점명
	STORE_HOUR VARCHAR2(20)	NOT NULL, -- 매장 시간
	STORE_ADDR VARCHAR2(100) UNIQUE NOT NULL, -- 매장 주소
	STORE_MAP VARCHAR2(50), -- 매장 위치(위도, 경도)
	STORE_PHONE VARCHAR2(15) UNIQUE NOT NULL -- 매장 연락처
);

INSERT INTO STORE (STORE_NO, BRAND_NAME, STORE_NAME, STORE_HOUR, STORE_ADDR, STORE_MAP, STORE_PHONE) VALUES(50, '오빠닭', '역삼점', '08:00~20:00', '서울시 역삼동','19999999,3555555', '02-1234-5678');
INSERT INTO STORE (STORE_NO, BRAND_NAME, STORE_NAME, STORE_HOUR, STORE_ADDR, STORE_MAP, STORE_PHONE) VALUES(51, '오빠닭', '삼성점', '08:00~20:00', '서울시 삼성동','19999998,3555545', '02-1234-5679');
 INSERT INTO STORE (STORE_NO, BRAND_NAME, STORE_NAME, STORE_HOUR, STORE_ADDR, STORE_MAP, STORE_PHONE) VALUES(52, '오빠닭', '두정점', '09:00~20:00', '서울시 두정동','19999997,3555545', '02-1234-5689');
SELECT * FROM STORE;

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

SELECT store_no, brand_name, store_hour, store_addr, store_map, store_phone FROM store WHERE 1=1;
------------------------------------------------------------------------------


--MINI PROJECT
--예약_시퀀스 생성
--CREATE SEQUENCE R_NO_SEQ
--INCREMENT BY 1
--START WITH 1
--NOCYCLE
--NOCACHE;
--
--예약_테이블 생성
--CREATE TABLE RESERVATION_TB (
--	r_no INTEGER NOT NULL PRIMARY KEY,	/*예약 번호*/
--	user_id VARCHAR2(20) NOT NULL,		/*예약자 ID*/
--	user_name VARCHAR2(20) NOT NULL,	/*예약자명*/
--	store_name VARCHAR2(50) NOT NULL,	/*지점명*/
--	store_phone VARCHAR2(15) NOT NULL, 	/*매장 연락처*/
--	r_person_cnt INTEGER NOT NULL,		/*방문 인원*/
--	r_time VARCHAR2(20) NOT NULL,		/*예약 시간*/
--		제약조건 예약_사용자
--	CONSTRAINT fk_reservation_user
--		FOREIGN KEY (user_id)
--		REFERENCES USER_TB (user_id)
--		ON DELETE CASCADE,
--		제약조건 예약_매장
--	CONSTRAINT fk_reservation_store
--		FOREIGN KEY (store_name)
--		REFERENCES STORE_TB (store_name)
--		ON DELETE CASCADE,
--	UNIQUE 제약조건
--	CONSTRAINT unique_reservation_combination UNIQUE (r_no, user_id)
--);
--
--예약_더미 데이터 생성
--INSERT INTO RESERVATION_TB (r_no, user_id, user_name, store_name, store_phone, r_person_cnt, r_time)
--VALUES (R_NO_SEQ.NEXTVAL, 'asdf1234', '두둥탁', '롤링파스타 가로수길점', '02-543-5688', 3, '13:00');
--
--INSERT INTO RESERVATION_TB (r_no, user_id, user_name, store_name, store_phone, r_person_cnt, r_time)
--VALUES (R_NO_SEQ.NEXTVAL, 'qwer1234', '둥두둥', '롤링파스타 가로수길점', '02-543-5688', 5, '15:00');
--
--INSERT INTO RESERVATION_TB (r_no, user_id, user_name, store_name, store_phone, r_person_cnt, r_time)
--VALUES (R_NO_SEQ.NEXTVAL, 'qwer1234', '둥두둥', '한신포차 중앙대점', '02-817-5238', 5, '23:00');
--
--예약_테스트용 쿼리문
--SELECT * FROM RESERVATION_TB;	/*전체 예약 조회*/
--
--DROP TABLE RESERVATION_TB;		/*예약 테이블 삭제*/
--
--DROP SEQUENCE R_NO_SEQ;			/*예약 시퀀스 삭제*/
--
--DELETE FROM MEMBER_INFO WHERE MEMBER_ID = ;
--
--COMMIT;
--
-------------------------------------------------
--
--MINI PROJECT
--리뷰_시퀀스 생성
--CREATE SEQUENCE RV_NO_SEQ
--INCREMENT BY 1
--START WITH 1
--NOCYCLE
--NOCACHE;
--
--리뷰_테이블 생성
--CREATE TABLE REVIEW_TB (
--	rv_no INTEGER NOT NULL PRIMARY KEY,	/*리뷰 번호*/
--	user_id VARCHAR2(20) NOT NULL,		/*사용자 아이디*/
--	rv_date DATE DEFAULT SYSDATE,		/*리뷰 작성일*/
--	store_name VARCHAR2(50),			/*예약 매장명*/
--	r_no INTEGER NOT NULL,				/*예약 번호*/
--	rv_price DECIMAL(3, 1) NOT NULL,	/*별점(가격)*/
--	rv_taste DECIMAL(3, 1) NOT NULL,	/*별점(맛)*/
--	rv_vibe DECIMAL(3, 1) NOT NULL,		/*별점(분위기)*/
--	rv_kind DECIMAL(3, 1) NOT NULL,		/*별점(친절도)*/
--		제약조건
--	CONSTRAINT fk_review_reservation
--		FOREIGN KEY (r_no, user_id)
--		REFERENCES RESERVATION_TB (r_no, user_id)
--		ON DELETE CASCADE,
--	 별점 범위(0~5) 제한
--    CONSTRAINT chk_rating_range CHECK (rv_price BETWEEN 0.0 AND 5.0),
--    CONSTRAINT chk_taste_range CHECK (rv_taste BETWEEN 0.0 AND 5.0),
--    CONSTRAINT chk_vibe_range CHECK (rv_vibe BETWEEN 0.0 AND 5.0),
--    CONSTRAINT chk_kind_range CHECK (rv_kind BETWEEN 0.0 AND 5.0)
--);
--
--리뷰_더미 데이터 생성
--INSERT INTO REVIEW_TB (rv_no, user_id, rv_date, store_name, r_no, rv_price, rv_taste, rv_vibe, rv_kind)
--VALUES (RV_NO_SEQ.NEXTVAL, 'asdf1234', TO_DATE('2024-11-28', 'YYYY-MM-DD'), '롤링파스타 가로수길점', 
--	(SELECT r_no FROM RESERVATION_TB WHERE user_id = 'asdf1234' AND store_name = '롤링파스타 가로수길점' 
--     AND r_time = '13:00'), 5.0, 4.5, 4.0, 5.0);
--
--리뷰_테스트용 쿼리문
--SELECT * FROM REVIEW_TB;	/*전체 리뷰 조회*/
--
--DROP TABLE REVIEW_TB;		/*리뷰 테이블 삭제*/
--
--DROP SEQUENCE RV_NO_SEQ;	/*리뷰 시퀀스 삭제*/
--
--DELETE FROM MEMBER_INFO WHERE MEMBER_ID = ;
--
--COMMIT;
--
--------------------------------------------------------
--
--MINI PROJECT
--매장_시퀀스 생성
--CREATE SEQUENCE STORE_NO_SEQ
--INCREMENT BY 1
--START WITH 1
--NOCYCLE
--NOCACHE;
--
--매장_테이블 생성
--CREATE TABLE STORE_TB(
--	store_no INTEGER NOT NULL PRIMARY KEY, -- 매장번호
--	brand_name VARCHAR2(20) NOT NULL, -- 브랜드명
--	store_name VARCHAR2(50) NOT NULL, -- 지점명
--	store_hour VARCHAR2(20)	NOT NULL, -- 매장 시간
--	store_addr VARCHAR2(100) NOT NULL, -- 매장 주소
--	store_map VARCHAR2(50) NOT NULL, -- 매장 위치(위도, 경도)
--	store_phone VARCHAR2(15) NOT NULL, -- 매장 연락처
--	UNIQUE 제약조건
--	CONSTRAINT unique_store_combination UNIQUE (store_name),
--    CONSTRAINT unique_store_combination2 UNIQUE (store_addr),
--    CONSTRAINT unique_store_combination3 UNIQUE (store_map),
--    CONSTRAINT unique_store_combination4 UNIQUE (store_phone)
--);
--
--매장_더미 데이터 생성
--INSERT INTO STORE_TB (store_no, brand_name, store_name, store_hour, store_addr, store_map, store_phone)
--VALUES (STORE_NO_SEQ.NEXTVAL, '빽다방', '빽다방 압구정역점', '08:00 - 22:00', '서울특별시 강남구 압구정로 156', '37.525900628636165, 127.02674815154175', '02-3446-0410');
--
--INSERT INTO STORE_TB (store_no, brand_name, store_name, store_hour, store_addr, store_map, store_phone)
--VALUES (STORE_NO_SEQ.NEXTVAL, '빽다방', '빽다방 대치동학원가점', '08:00 - 22:00', '서울특별시 강남구 도곡로77길 8', '37.49890042146514, 127.05864289147813', '02-553-1515');
--
--INSERT INTO STORE_TB (store_no, brand_name, store_name, store_hour, store_addr, store_map, store_phone)
--VALUES (STORE_NO_SEQ.NEXTVAL, '빽다방', '빽다방 신논현역점', '08:00 - 22:00', '서울특별시 서초구 사평대로 367', '37.504368304702986, 127.02312138903574', '02-548-0410');
--
--INSERT INTO STORE_TB (store_no, brand_name, store_name, store_hour, store_addr, store_map, store_phone)
--VALUES (STORE_NO_SEQ.NEXTVAL, '역전우동', '역전우동 회기역점', '10:00 - 22:00', '서울특별시 동대문구 회기로 186', '37.5898042030099, 127.056449633583', '02-957-0410');
--
--INSERT INTO STORE_TB (store_no, brand_name, store_name, store_hour, store_addr, store_map, store_phone)
--VALUES (STORE_NO_SEQ.NEXTVAL, '역전우동', '역전우동 홍대입구역점', '10:00 - 22:00', '서울특별시 마포구 어울마당로 127-1', '37.555951920751724, 126.92407827775432', '02-3144-0417');
--
--INSERT INTO STORE_TB (store_no, brand_name, store_name, store_hour, store_addr, store_map, store_phone)
--VALUES (STORE_NO_SEQ.NEXTVAL, '한신포차', '한신포차 홍대점', '17:00 - 01:00', '서울특별시 마포구 잔다리로 13', '37.5505767556212, 126.921607658947', '02-3143-0410');
--
--INSERT INTO STORE_TB (store_no, brand_name, store_name, store_hour, store_addr, store_map, store_phone)
--VALUES (STORE_NO_SEQ.NEXTVAL, '한신포차', '한신포차 중앙대점', '17:00 - 01:00', '서울특별시 동작구 흑석로 115', '37.5087881988654, 126.961409298742', '02-817-5238');
--
--INSERT INTO STORE_TB (store_no, brand_name, store_name, store_hour, store_addr, store_map, store_phone)
--VALUES (STORE_NO_SEQ.NEXTVAL, '롤링파스타', '롤링파스타 가로수길점', '11:00 - 21:00', '서울특별시 강남구 가로수길 16', '37.5190185886303, 127.0233566700615', '02-543-5688');
--
--INSERT INTO STORE_TB (store_no, brand_name, store_name, store_hour, store_addr, store_map, store_phone)
--VALUES (STORE_NO_SEQ.NEXTVAL, '롤링파스타', '롤링파스타 성신여대점', '11:00 - 21:00', '서울특별시 성북구 동소문로22길 5', '37.5928112876896, 127.017595928971', '02-927-7779');
--
--매장_테스트용 쿼리문
--SELECT * FROM STORE_TB;		/*전체 매장 조회*/
--
--DROP TABLE STORE_TB;		/*매장 테이블 삭제*/
--
--DROP SEQUENCE STORE_NO_SEQ;	/*매장 시퀀스 삭제*/
--
--
--
--
--ALTER TABLE STORE
--DROP COLUMN RV_AVG;
--
--SELECT * FROM STORE;
--
------------------------------------------
--
--MINI PROJECT
--유저_시퀀스 생성
--CREATE SEQUENCE USER_NO_SEQ
--INCREMENT BY 1
--START WITH 1
--NOCYCLE
--NOCACHE;
--
--유저_테이블 생성
--CREATE TABLE USER_TB (
--	user_no INTEGER NOT NULL PRIMARY KEY,	/*회원 번호*/
--	user_name VARCHAR2(20) NOT NULL,		/*사용자 이름*/
--	user_id VARCHAR2(20) NOT NULL,			/*사용자 아이디*/
--	user_pw VARCHAR2(20) NOT NULL,			/*비밀번호*/
--	user_mail VARCHAR2(20) NOT NULL,		/*메일*/
--	user_birth DATE NOT NULL,				/*생년월일*/
--	user_phone VARCHAR2(13) NOT NULL,		/*전화번호*/
--	user_img VARCHAR2(200) NOT NULL,		/*프로필이미지*/
--	UNIQUE 제약조건
--    CONSTRAINT unique_user_combination UNIQUE (user_id),
--    CONSTRAINT unique_user_combination2 UNIQUE (user_phone)  
--);
--
--유저_더미 데이터 생성
--INSERT INTO USER_TB (user_no, user_name, user_id, user_pw, user_mail, user_birth, user_phone, user_img)
--VALUES (USER_NO_SEQ.NEXTVAL, '두둥탁', 'asdf1234', 'qwer1234', 'asdf1234@gmail.com', '2001-06-15', '010-1234-5678', 'gs://kh-firebase-50b3f.firebasestorage.app/택2.jpg');
--
--INSERT INTO USER_TB (user_no, user_name, user_id, user_pw, user_mail, user_birth, user_phone, user_img)
--VALUES (USER_NO_SEQ.NEXTVAL, '둥두둥', 'qwer1234', 'asdf1234', 'qwer1234@naver.com', '2001-04-14', '010-5678-1234', 'gs://kh-firebase-50b3f.firebasestorage.app/랍1.jpg');
--
--유저_테스트용 쿼리문
--SELECT * FROM USER_TB;	/*전체 리뷰 조회*/
--
--DROP TABLE USER_TB;		/*리뷰 테이블 삭제*/
--
--DROP SEQUENCE USER_NO_SEQ;/*리뷰 시퀀스 삭제*/
--
--DELETE FROM MEMBER_INFO WHERE MEMBER_ID = ;
--
--COMMIT;
