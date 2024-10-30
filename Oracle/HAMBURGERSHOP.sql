-- 테이블 생성용 쿼리들
CREATE TABLE ACC_INFO(
	user_id varchar2(20) PRIMARY KEY,
	user_pw varchar2(20) CHECK(LENGTH(user_pw) > 7),
	user_name varchar2(15) NOT NULL,
	user_phone char(13) UNIQUE,
	join_date DATE DEFAULT SYSDATE,
	auth_lv NUMBER(1) NOT NULL,
	store_id varchar2(20) REFERENCES STORE (store_id)
);

CREATE TABLE INV_ORDER(
	menu_name varchar2(20) PRIMARY KEY,
	price number(5) NOT NULL,
	category varchar2(10) CHECK (category IN ('버거', '사이드', '음료')),
	descr varchar2(30)
);

CREATE TABLE INV(
	menu_name varchar2(20) REFERENCES INV_ORDER(menu_name),
	store_id varchar2(20) REFERENCES STORE(store_id),
	PRIMARY KEY (menu_name, store_id),
	price number(5) NOT NULL,
	stock number(4) NOT NULL
);

CREATE TABLE STORE(
	store_id varchar2(20) PRIMARY KEY,
	sales number(10) NOT NULL,
	capital number(10) NOT NULL
);

CREATE TABLE ORDER_RECORD(
	order_code varchar(20) PRIMARY KEY,
	order_list varchar(20) NOT NULL,
	order_time DATE NOT NULL,
	order_price number(10) NOT NULL,
	user_id varchar(20) REFERENCES ACC_INFO(user_id),
	store_id varchar(20) REFERENCES STORE(store_ID)
);

DROP TABLE STORE ;

-- SQL DB, STORE 테이블에 테스트를 위해 넣은 값.
INSERT INTO STORE (store_id, sales, capital)
	VALUES ('구로점', 100000, 1000000);
INSERT INTO STORE (store_id, sales, capital)
	VALUES ('화곡점', 200000, 2000000);
INSERT INTO STORE (store_id, sales, capital)
	VALUES ('시청점', 300000, 3000000);
INSERT INTO STORE (store_id, sales, capital)
	VALUES ('본사', 999999999, 999999999);
--들어갔는지 체크용
SELECT * FROM STORE;
SELECT * FROM ACC_INFO;
DELETE FROM STORE	
	WHERE store_id = '역삼점';

INSERT ALL
	INTO ACC_INFO (USER_ID,	USER_PW, USER_NAME, USER_PHONE, JOIN_DATE, AUTH_LV, STORE_ID)
		VALUES('RED', 'red12345', 'red', '010-1234-5678', SYSDATE, 1, '구로점')
	INTO ACC_INFO (USER_ID,	USER_PW, USER_NAME, USER_PHONE, JOIN_DATE, AUTH_LV, STORE_ID)
		VALUES('BLUE', 'blue12345', 'blue', '010-4567-8912', SYSDATE, 1, '화곡점')
	INTO ACC_INFO (USER_ID,	USER_PW, USER_NAME, USER_PHONE, JOIN_DATE, AUTH_LV, STORE_ID)
		VALUES('YELLOW', 'yellow12345', 'yellow', '010-7891-2345', SYSDATE, 1, '시청점')
	INTO ACC_INFO (USER_ID,	USER_PW, USER_NAME, USER_PHONE, JOIN_DATE, AUTH_LV, STORE_ID)
		VALUES('BLACK', 'black12345', 'black', '010-9871-2345', SYSDATE, 2, '본사')
SELECT * FROM dual;

INSERT ALL
	INTO INV_ORDER VALUES ('빅맥', 6300, '버거', '맥도날드의 간판 메뉴')
	INTO INV_ORDER VALUES ('슈비버거', 6600, '버거', '슈림프와 비프')
	INTO INV_ORDER VALUES ('치즈버거', 3600, '버거', '패티에 슬라이스 치즈')
	INTO INV_ORDER VALUES ('맥너겟', 3400, '사이드', '맥도날드의 치킨너겟')
	INTO INV_ORDER VALUES ('후렌치후라이', 2300, '사이드', '바싹 튀긴 감자튀김')
	INTO INV_ORDER VALUES ('치즈스틱', 3600, '사이드', '치즈가 쭈욱 늘어나요')
	INTO INV_ORDER VALUES ('코카콜라', 2600, '음료', '콜라는 역시 COKE')
	INTO INV_ORDER VALUES ('아메리카노', 3300, '음료', '얼죽아 아시죠?')
	INTO INV_ORDER VALUES ('바닐라쉐이크', 3500, '음료', '감튀 디핑소스')
SELECT * FROM dual;


INSERT ALL
	INTO INV VALUES ('빅맥','구로점' ,6800, 10)
	INTO INV VALUES ('슈비버거','구로점' , 7100, 10)
	INTO INV VALUES ('치즈버거','구로점' , 4100, 10)
	INTO INV VALUES ('맥너겟','구로점' , 3900, 10)
	INTO INV VALUES ('후렌치후라이','구로점' , 2800, 10)
	INTO INV VALUES ('치즈스틱','구로점' , 4100, 10)
	INTO INV VALUES ('코카콜라','구로점' , 3100, 10)
	INTO INV VALUES ('아메리카노','구로점' , 3800, 10)
	INTO INV VALUES ('바닐라쉐이크','구로점' , 4000, 10)
SELECT * FROM dual;

INSERT ALL
	INTO INV VALUES ('빅맥','화곡점' ,6800, 10)
	INTO INV VALUES ('슈비버거','화곡점' , 7100, 10)
	INTO INV VALUES ('치즈버거','화곡점' , 4100, 10)
	INTO INV VALUES ('맥너겟','화곡점' , 3900, 10)
	INTO INV VALUES ('후렌치후라이','화곡점' , 2800, 10)
	INTO INV VALUES ('치즈스틱','화곡점' , 4100, 10)
	INTO INV VALUES ('코카콜라','화곡점' , 3100, 10)
	INTO INV VALUES ('아메리카노','화곡점' , 3800, 10)
	INTO INV VALUES ('바닐라쉐이크','화곡점' , 4000, 10)
SELECT * FROM dual;

INSERT ALL
	INTO INV VALUES ('빅맥','시청점' ,6800, 10)
	INTO INV VALUES ('슈비버거','시청점' , 7100, 10)
	INTO INV VALUES ('치즈버거','시청점' , 4100, 10)
	INTO INV VALUES ('맥너겟','시청점' , 3900, 10)
	INTO INV VALUES ('후렌치후라이','시청점' , 2800, 10)
	INTO INV VALUES ('치즈스틱','시청점' , 4100, 10)
	INTO INV VALUES ('코카콜라','시청점' , 3100, 10)
	INTO INV VALUES ('아메리카노','시청점' , 3800, 10)
	INTO INV VALUES ('바닐라쉐이크','시청점' , 4000, 10)
SELECT * FROM dual;

SELECT * FROM inv;
SELECT sales FROM STORE
	WHERE STORE_ID = '시청점';
SELECT s.sales
FROM STORE s
JOIN ACC_INFO a ON s.store_id = a.store_id
WHERE a.user_id = 'RED';

SELECT sales
FROM STORE
	WHERE STORE_ID = (SELECT STORE_ID FROM ACC_INFO WHERE user_id = 'RED');


UPDATE STORE 
SET capital = capital + 3000 
WHERE store_id = (SELECT store_id FROM ACC_INFO WHERE user_id = 'RED');
