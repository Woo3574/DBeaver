-- BRAND 테이블 생성
CREATE TABLE BRAND_TB(
	BRAND_NO INTEGER NOT NULL PRIMARY KEY, 							/* 브랜드번호 */
	BRAND_NAME VARCHAR2(20) NOT NULL, 								/* 브랜드명 */
    BRAND_OPEN VARCHAR2(20) NOT NULL, 								/* 영업시작시간 */
	BRAND_CLOSE VARCHAR2(20) NOT NULL,								/* 영업종료시간 */
	BRAND_FOOD VARCHAR2(20) NOT NULL,								/* 음식종류 */
	BRAND_LOGO1 VARCHAR2(500) NOT NULL,               			 	/* 브랜드 Logo 세로 이미지 URL */
	BRAND_LOGO2 VARCHAR2(500) NOT NULL,               			 	/* 브랜드 Logo 가로 이미지 URL */
	BRAND_MARKER VARCHAR2(500) NOT NULL,               				/* 브랜드 MARKER 세로 이미지 URL */
	BRAND_IMG VARCHAR2(500) NOT NULL,								/* 브랜드 지점 이미지 URL */
	

	--UNIQUE 제약조건
	CONSTRAINT UNIQUE_BRAND1 UNIQUE (BRAND_NAME), 					/* MENU */
	CONSTRAINT UNIQUE_BRAND2 UNIQUE (BRAND_NAME, BRAND_OPEN, BRAND_CLOSE, BRAND_LOGO1, BRAND_LOGO2, BRAND_MARKER, BRAND_IMG) 	/* STORE */
);


-- BRAND_NO 시퀀스 생성
CREATE SEQUENCE BRAND_NO_SEQ
INCREMENT BY 1
START WITH 1
NOCYCLE
NOCACHE;


-- BRAND 더미 데이터 생성
INSERT INTO BRAND_TB (BRAND_NO, BRAND_NAME, BRAND_OPEN, BRAND_CLOSE, BRAND_FOOD, BRAND_LOGO1, BRAND_LOGO2, BRAND_MARKER, BRAND_IMG)
VALUES (BRAND_NO_SEQ.NEXTVAL, '빽보이피자', '11', '22', '양식',
'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F01빽보이피자01.png?alt=media&token=73658b91-8b0f-4c8f-82e7-3acc11ef09ec',
'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F01빽보이피자02.png?alt=media&token=0ea99080-4d4e-42ae-8f6f-db36c4db3564',
'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2Fmarker_01.png?alt=media&token=9fd6776b-f1f3-43f9-a53e-118659aea335',
'https://firebasestorage.googleapis.com/v0/b/photo-island-eeaa3.firebasestorage.app/o/PAIKBOOKER_BRAND_IMG%2F1_%EB%B9%BD%EB%B3%B4%EC%9D%B4%ED%94%BC%EC%9E%90_IMG.png?alt=media&token=d2989620-c328-4ca8-bb5e-fc5e755842bc');

INSERT INTO BRAND_TB (BRAND_NO, BRAND_NAME, BRAND_OPEN, BRAND_CLOSE, BRAND_FOOD, BRAND_LOGO1, BRAND_LOGO2, BRAND_MARKER, BRAND_IMG)
VALUES (BRAND_NO_SEQ.NEXTVAL, '역전우동', '11', '21', '일식',
'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F02역전우동01.png?alt=media&token=0c235c92-8e33-4e42-93ff-f0cf05867bd0',
'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F02역전우동02.png?alt=media&token=ec82d374-fd66-46af-9a30-b768114bafd7',
'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2Fmarker_02.png?alt=media&token=118e0ae0-7927-4446-bff0-e06189dfde9e',
'https://firebasestorage.googleapis.com/v0/b/photo-island-eeaa3.firebasestorage.app/o/PAIKBOOKER_BRAND_IMG%2F2_%EC%97%AD%EC%A0%84%EC%9A%B0%EB%8F%99_IMG.png?alt=media&token=8f7f406f-dee5-4e36-b44d-c3e46a7f4cc0');

INSERT INTO BRAND_TB (BRAND_NO, BRAND_NAME, BRAND_OPEN, BRAND_CLOSE, BRAND_FOOD, BRAND_LOGO1, BRAND_LOGO2, BRAND_MARKER, BRAND_IMG)
VALUES (BRAND_NO_SEQ.NEXTVAL, '빽다방', '07', '22', '커피',
'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F03빽다방01.png?alt=media&token=e3682b85-0916-49d5-8366-1a0563673eb1',
'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F03빽다방02.png?alt=media&token=244dcfc0-98ca-473d-82dd-9e87924fb3e6',
'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2Fmarker_03.png?alt=media&token=1713a25a-b06f-4368-a159-403546d148b7',
'https://firebasestorage.googleapis.com/v0/b/photo-island-eeaa3.firebasestorage.app/o/PAIKBOOKER_BRAND_IMG%2F3_%EB%B9%BD%EB%8B%A4%EB%B0%A9_IMG.png?alt=media&token=fedaad01-f291-4818-9760-2587053d2eea');

INSERT INTO BRAND_TB (BRAND_NO, BRAND_NAME, BRAND_OPEN, BRAND_CLOSE, BRAND_FOOD, BRAND_LOGO1, BRAND_LOGO2, BRAND_MARKER, BRAND_IMG)
VALUES (BRAND_NO_SEQ.NEXTVAL, '홍콩반점', '11', '21', '중식',
'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F04홍콩반점01.png?alt=media&token=21bfafba-f254-4f97-bfe4-cf29481cc210',
'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F04홍콩반점02.png?alt=media&token=2afc294f-e914-416b-8b78-16db2de32ee2',
'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2Fmarker_04.png?alt=media&token=28497125-06e8-48c1-afa8-71194456c274',
'https://firebasestorage.googleapis.com/v0/b/photo-island-eeaa3.firebasestorage.app/o/PAIKBOOKER_BRAND_IMG%2F4_%ED%99%8D%EC%BD%A9%EB%B0%98%EC%A0%90_IMG.png?alt=media&token=3b87c418-2cf5-4e79-aaf6-8d80204cad92');

INSERT INTO BRAND_TB (BRAND_NO, BRAND_NAME, BRAND_OPEN, BRAND_CLOSE, BRAND_FOOD, BRAND_LOGO1, BRAND_LOGO2, BRAND_MARKER, BRAND_IMG)
VALUES (BRAND_NO_SEQ.NEXTVAL, '롤링파스타', '11', '21', '양식',
'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F05롤링파스타01.png?alt=media&token=9ce4e527-f189-4a25-8e84-dca500aac097',
'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F05롤링파스타02.png?alt=media&token=2a7b1176-2efc-4a13-a48f-ee493472f607',
'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2Fmarker_05.png?alt=media&token=2e7553ee-2302-4355-8c58-7ee454344bd0',
'https://firebasestorage.googleapis.com/v0/b/photo-island-eeaa3.firebasestorage.app/o/PAIKBOOKER_BRAND_IMG%2F5_%EB%A1%A4%EB%A7%81%ED%8C%8C%EC%8A%A4%ED%83%80_IMG.png?alt=media&token=1ec0e570-2bbc-474b-9596-e370b6e0bf8b');

INSERT INTO BRAND_TB (BRAND_NO, BRAND_NAME, BRAND_OPEN, BRAND_CLOSE, BRAND_FOOD, BRAND_LOGO1, BRAND_LOGO2, BRAND_MARKER, BRAND_IMG)
VALUES (BRAND_NO_SEQ.NEXTVAL, '한신포차', '17', '27', '술',
'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F06한신포차01.png?alt=media&token=f1811a7a-92b8-4b06-aaab-b91320f6b156',
'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F06한신포차02.png?alt=media&token=e73fa42f-72e6-4c4f-9321-10fae03eabca',
'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2Fmarker_06.png?alt=media&token=2a4eb939-131f-4449-8a17-59d004b78800',
'https://firebasestorage.googleapis.com/v0/b/photo-island-eeaa3.firebasestorage.app/o/PAIKBOOKER_BRAND_IMG%2F6_%ED%95%9C%EC%8B%A0%ED%8F%AC%EC%B0%A8_IMG.png?alt=media&token=11742ed4-ebd7-4a17-b106-513bb0495e1e');

INSERT INTO BRAND_TB (BRAND_NO, BRAND_NAME, BRAND_OPEN, BRAND_CLOSE, BRAND_FOOD, BRAND_LOGO1, BRAND_LOGO2, BRAND_MARKER, BRAND_IMG)
VALUES (BRAND_NO_SEQ.NEXTVAL, '백스비어', '17', '25', '술',
'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F07백스비어01.png?alt=media&token=fa3f5d61-6a25-417a-98b0-fefb4acdf981',
'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F07백스비어02.png?alt=media&token=ae4f1a93-e15f-4d9d-b657-ba99d77fd662',
'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2Fmarker_07.png?alt=media&token=0e9aac5d-1a58-4f00-894d-a1886955b03b',
'https://firebasestorage.googleapis.com/v0/b/photo-island-eeaa3.firebasestorage.app/o/PAIKBOOKER_BRAND_IMG%2F7_%EB%B9%BD%EB%B9%84%EC%96%B4_IMG.png?alt=media&token=001f40f1-8e67-49d9-bfa6-56cf4152fd2c');

INSERT INTO BRAND_TB (BRAND_NO, BRAND_NAME, BRAND_OPEN, BRAND_CLOSE, BRAND_FOOD, BRAND_LOGO1, BRAND_LOGO2, BRAND_MARKER, BRAND_IMG)
VALUES (BRAND_NO_SEQ.NEXTVAL, '새마을식당', '11', '23', '한식',
'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F08새마을식당01.png?alt=media&token=eddf31f9-0ed7-48f9-9468-97b71e920530',
'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F08새마을식당02.png?alt=media&token=a972c102-df25-4aa1-ae46-39b0c8e0fd04',
'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2Fmarker_08.png?alt=media&token=c69ce962-2d20-43b2-b46c-06eb2fbebaee',
'https://firebasestorage.googleapis.com/v0/b/photo-island-eeaa3.firebasestorage.app/o/PAIKBOOKER_BRAND_IMG%2F8_%EC%83%88%EB%A7%88%EC%9D%84%EC%8B%9D%EB%8B%B9_IMG.png?alt=media&token=7bdaca20-f189-405c-bbb4-c969355eae86');

INSERT INTO BRAND_TB (BRAND_NO, BRAND_NAME, BRAND_OPEN, BRAND_CLOSE, BRAND_FOOD, BRAND_LOGO1, BRAND_LOGO2, BRAND_MARKER, BRAND_IMG)
VALUES (BRAND_NO_SEQ.NEXTVAL, '제순식당', '11', '19', '한식',
'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F09제순식당01.png?alt=media&token=60c400f6-ce3c-40f2-bc87-99fff289b1f0',
'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F09제순식당02.png?alt=media&token=34cd5224-6f5e-4e27-b3a1-06401aac747b',
'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2Fmarker_09.png?alt=media&token=fb47644e-3d0c-4ba2-97a8-9dbebd4b3e1b',
'https://firebasestorage.googleapis.com/v0/b/photo-island-eeaa3.firebasestorage.app/o/PAIKBOOKER_BRAND_IMG%2F9_%EC%A0%9C%EC%88%9C%EC%8B%9D%EB%8B%B9_IMG.png?alt=media&token=f0e1cf74-1b49-4c87-ab8d-062d20d75d8e');

INSERT INTO BRAND_TB (BRAND_NO, BRAND_NAME, BRAND_OPEN, BRAND_CLOSE, BRAND_FOOD, BRAND_LOGO1, BRAND_LOGO2, BRAND_MARKER, BRAND_IMG)
VALUES (BRAND_NO_SEQ.NEXTVAL, '리춘시장', '17', '24', '중식',
'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F10리춘시장01.png?alt=media&token=c852b849-de8e-4f72-ad97-31b510bdc99f',
'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F10리춘시장02.png?alt=media&token=7c9c6143-c7c8-464d-9402-63778ff66fa3',
'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2Fmarker_10.png?alt=media&token=9cf01424-e020-4303-a2d1-86ad0f90840a',
'https://firebasestorage.googleapis.com/v0/b/photo-island-eeaa3.firebasestorage.app/o/PAIKBOOKER_BRAND_IMG%2F10_%EB%A6%AC%EC%B6%98%EC%8B%9C%EC%9E%A5_IMG.png?alt=media&token=bcbbf896-4232-4b5d-8881-fc7194de9283');

INSERT INTO BRAND_TB (BRAND_NO, BRAND_NAME, BRAND_OPEN, BRAND_CLOSE, BRAND_FOOD, BRAND_LOGO1, BRAND_LOGO2, BRAND_MARKER, BRAND_IMG)
VALUES (BRAND_NO_SEQ.NEXTVAL, '고투웍', '10', '21', '중식',
'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F11고투웍01.png?alt=media&token=ccef839c-ae1d-4d8f-88e5-f2ab63ee9f67',
'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F11고투웍02.png?alt=media&token=fe20e09d-b3ca-48d6-a72c-a09d94abb9e7',
'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2Fmarker_11.png?alt=media&token=2c123e53-4be6-4a3a-b1f3-2c33fad02503',
'https://firebasestorage.googleapis.com/v0/b/photo-island-eeaa3.firebasestorage.app/o/PAIKBOOKER_BRAND_IMG%2F11_%EA%B3%A0%ED%88%AC%EC%9B%8D_IMG.png?alt=media&token=0d378773-71bb-4b46-8cbb-c54682b2a0e0');

INSERT INTO BRAND_TB (BRAND_NO, BRAND_NAME, BRAND_OPEN, BRAND_CLOSE, BRAND_FOOD, BRAND_LOGO1, BRAND_LOGO2, BRAND_MARKER, BRAND_IMG)
VALUES (BRAND_NO_SEQ.NEXTVAL, '홍콩분식', '11', '21', '중식',
'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F12홍콩분식01.png?alt=media&token=dd48f407-6319-430b-97ef-81c226f02ce5',
'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F12홍콩분식02.png?alt=media&token=903fc722-45f1-4109-8300-aa9039defeb6',
'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2Fmarker_12.png?alt=media&token=e39c9e93-0ca7-468c-81b6-5ad670c702cf',
'https://firebasestorage.googleapis.com/v0/b/photo-island-eeaa3.firebasestorage.app/o/PAIKBOOKER_BRAND_IMG%2F12_%ED%99%8D%EC%BD%A9%EB%B6%84%EC%8B%9D_IMG.png?alt=media&token=f8e1d187-d0e0-44c9-97e0-9fa858c319ef');

INSERT INTO BRAND_TB (BRAND_NO, BRAND_NAME, BRAND_OPEN, BRAND_CLOSE, BRAND_FOOD, BRAND_LOGO1, BRAND_LOGO2, BRAND_MARKER, BRAND_IMG)
VALUES (BRAND_NO_SEQ.NEXTVAL, '백종원의쌈밥', '11', '22', '한식',
'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F13쌈밥01.png?alt=media&token=34e41297-8b89-4e59-817f-59a1260a3eaa',
'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F13쌈밥02.png?alt=media&token=2c54579b-08d4-497b-be7b-912defbd4711',
'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2Fmarker_13.png?alt=media&token=ae61693f-6810-49b8-8067-bf338cd6e455',
'https://firebasestorage.googleapis.com/v0/b/photo-island-eeaa3.firebasestorage.app/o/PAIKBOOKER_BRAND_IMG%2F13_%EC%9B%90%EC%A1%B0%EC%8C%88%EB%B0%A5_IMG.png?alt=media&token=433ef744-d312-4da6-8c94-e13f0537e80e');

INSERT INTO BRAND_TB (BRAND_NO, BRAND_NAME, BRAND_OPEN, BRAND_CLOSE, BRAND_FOOD, BRAND_LOGO1, BRAND_LOGO2, BRAND_MARKER, BRAND_IMG)
VALUES (BRAND_NO_SEQ.NEXTVAL, '본가', '11', '22', '한식',
'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F14본가01.png?alt=media&token=a88b02d1-6e75-4e10-adc2-74d056d6c83b',
'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F14본가02.png?alt=media&token=c82e10e3-f4e7-4a90-92fe-8b122d07d95d',
'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2Fmarker_14.png?alt=media&token=be47ace5-be83-439f-a326-512e530d4017',
'https://firebasestorage.googleapis.com/v0/b/photo-island-eeaa3.firebasestorage.app/o/PAIKBOOKER_BRAND_IMG%2F14_%EB%B3%B8%EA%B0%80_IMG.png?alt=media&token=966c2024-ecf7-49d1-a625-2e8290555ff8');

INSERT INTO BRAND_TB (BRAND_NO, BRAND_NAME, BRAND_OPEN, BRAND_CLOSE, BRAND_FOOD, BRAND_LOGO1, BRAND_LOGO2, BRAND_MARKER, BRAND_IMG)
VALUES (BRAND_NO_SEQ.NEXTVAL, '인생설렁탕', '11', '22', '한식',
'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F15인생설렁탕01.png?alt=media&token=a5ab642d-c6cf-48df-9c4b-4220fc3a81cb',
'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F15인생설렁탕02.png?alt=media&token=7f2e9288-a6b2-48e5-83cb-f54a938d8488',
'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2Fmarker_15.png?alt=media&token=b187e8ee-1f92-4ccd-9e86-208a8bf5b0bb',
'https://firebasestorage.googleapis.com/v0/b/photo-island-eeaa3.firebasestorage.app/o/PAIKBOOKER_BRAND_IMG%2F15_%EC%9D%B8%EC%83%9D%EC%84%A4%EB%A0%81%ED%83%95_IMG.png?alt=media&token=f1470e06-6476-437e-83d7-c950ab4cdce3');

INSERT INTO BRAND_TB (BRAND_NO, BRAND_NAME, BRAND_OPEN, BRAND_CLOSE, BRAND_FOOD, BRAND_LOGO1, BRAND_LOGO2, BRAND_MARKER, BRAND_IMG)
VALUES (BRAND_NO_SEQ.NEXTVAL, '막이오름', '17', '26', '술',
'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F16막이오름01.png?alt=media&token=dd7007af-8b39-4292-a1cd-3fdd7f0d7bf7',
'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F16막이오름02.png?alt=media&token=b50da95c-576e-442f-9582-215a23a28c95',
'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2Fmarker_16.png?alt=media&token=f3910e03-288c-4a96-a44c-8a49bce7828e',
'https://firebasestorage.googleapis.com/v0/b/photo-island-eeaa3.firebasestorage.app/o/PAIKBOOKER_BRAND_IMG%2F16_%EB%A7%89%EC%9D%B4%EC%98%A4%EB%A6%84_IMG.png?alt=media&token=1d8d6077-4fd8-49d2-ae0e-23f35c5d304f');

INSERT INTO BRAND_TB (BRAND_NO, BRAND_NAME, BRAND_OPEN, BRAND_CLOSE, BRAND_FOOD, BRAND_LOGO1, BRAND_LOGO2, BRAND_MARKER, BRAND_IMG)
VALUES (BRAND_NO_SEQ.NEXTVAL, '연돈볼카츠', '11', '22', '일식',
'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F17연돈볼카츠01.png?alt=media&token=0c942129-57ba-4d59-84f0-59ee82e11b3e',
'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F17연돈볼카츠02.png?alt=media&token=dae163e8-72f8-461a-9476-137fadcabd70',
'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2Fmarker_17.png?alt=media&token=19ae41d6-b456-4dc7-97b2-2d446596fadf',
'https://firebasestorage.googleapis.com/v0/b/photo-island-eeaa3.firebasestorage.app/o/PAIKBOOKER_BRAND_IMG%2F17_%EC%97%B0%EB%8F%88%EB%B3%BC%EC%B9%B4%EC%B8%A0_IMG.png?alt=media&token=963c7269-7de8-4b23-a618-1b8a13287adb');

INSERT INTO BRAND_TB (BRAND_NO, BRAND_NAME, BRAND_OPEN, BRAND_CLOSE, BRAND_FOOD, BRAND_LOGO1, BRAND_LOGO2, BRAND_MARKER, BRAND_IMG)
VALUES (BRAND_NO_SEQ.NEXTVAL, '돌배기집', '08', '24', '한식',
'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F18돌배기집01.png?alt=media&token=66a0822c-e593-4c1d-bfeb-44f34f76f3a2',
'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F18돌배기집02.png?alt=media&token=9ee9f66b-fcbc-4331-996a-b5e959506c1b',
'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2Fmarker_18.png?alt=media&token=f7571884-f52f-4a00-af60-abcc85cf62af',
'https://firebasestorage.googleapis.com/v0/b/photo-island-eeaa3.firebasestorage.app/o/PAIKBOOKER_BRAND_IMG%2F18_%EB%8F%8C%EB%B0%B0%EA%B8%B0%EC%A7%91_IMG.png?alt=media&token=161b612d-bacf-479d-a320-4b690d2a451c');

INSERT INTO BRAND_TB (BRAND_NO, BRAND_NAME, BRAND_OPEN, BRAND_CLOSE, BRAND_FOOD, BRAND_LOGO1, BRAND_LOGO2, BRAND_MARKER, BRAND_IMG)
VALUES (BRAND_NO_SEQ.NEXTVAL, '미정국수', '08', '24', '한식',
'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F19미정국수01.png?alt=media&token=9cf1be65-71df-42e4-995f-c16fd81e4d5e',
'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F19미정국수02.png?alt=media&token=f045a3cc-d3dd-4f47-af90-7907078a4c4f',
'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2Fmarker_19.png?alt=media&token=7ef8f026-1ad0-4f86-9f3d-238719689b44',
'https://firebasestorage.googleapis.com/v0/b/photo-island-eeaa3.firebasestorage.app/o/PAIKBOOKER_BRAND_IMG%2F19_%EB%AF%B8%EC%A0%95%EA%B5%AD%EC%88%98_IMG.png?alt=media&token=4614013d-37bc-4752-9bae-5c53ec24195f');

INSERT INTO BRAND_TB (BRAND_NO, BRAND_NAME, BRAND_OPEN, BRAND_CLOSE, BRAND_FOOD, BRAND_LOGO1, BRAND_LOGO2, BRAND_MARKER, BRAND_IMG)
VALUES (BRAND_NO_SEQ.NEXTVAL, '백철판', '11', '23', '한식',
'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F20백철판01.png?alt=media&token=67e1a85e-e2f0-4aaa-8efa-bd6f28ec7144',
'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2F20백철판02.png?alt=media&token=7142b4ab-365b-41ad-bbe2-638199316daf',
'https://firebasestorage.googleapis.com/v0/b/kh-basic-frontend-react-f5a7b.firebasestorage.app/o/PAIKBOOKER%2Fmarker_20.png?alt=media&token=6303b095-35e2-418e-998e-fa376bc4e845',
'https://firebasestorage.googleapis.com/v0/b/photo-island-eeaa3.firebasestorage.app/o/PAIKBOOKER_BRAND_IMG%2F20_%EB%B0%B1%EC%B2%A0%ED%8C%90_IMG.png?alt=media&token=2167f9a4-6aaa-49d9-a44f-ea19417ca6be');


-- BRAND 테스트용 쿼리문
SELECT * FROM BRAND_TB;							/*전체 데이터 조회*/

DELETE FROM BRAND_TB WHERE BRAND_NO = '';		/* 브랜드번호 단위로 데이터 삭제 */

DROP SEQUENCE BRAND_NO_SEQ;						/* BRAND_NO 시퀀스 삭제 */

DROP TABLE BRAND_TB;							/* BRAND 테이블 삭제 */

COMMIT;




-- STORE 테이블 생성
CREATE TABLE STORE_TB(
	STORE_NO INTEGER NOT NULL PRIMARY KEY, 						/* 매장번호 */
	STORE_NAME VARCHAR2(100) NOT NULL, 							/* 매장명 */
	STORE_PHONE VARCHAR2(15) NOT NULL, 							/* 매장 연락처 */
	STORE_ADDR VARCHAR2(100) NOT NULL, 							/* 매장 주소 */
	STORE_MAP VARCHAR2(50) NOT NULL, 							/* 매장 위치(위도, 경도) */
	BRAND_NAME VARCHAR2(20) NOT NULL, 							/* 브랜드명 */
    BRAND_OPEN VARCHAR2(20) NOT NULL, 							/* 영업 시작 시간 (날짜는 임의 값) */
    BRAND_CLOSE VARCHAR2(20) NOT NULL, 							/* 영업 종료 시간 (날짜는 임의 값) */
    BRAND_LOGO1 VARCHAR2(500) NOT NULL,               			/* 브랜드 Logo 세로 이미지 URL */
	BRAND_LOGO2 VARCHAR2(500) NOT NULL,               		 	/* 브랜드 Logo 가로 이미지 URL */
	BRAND_MARKER VARCHAR2(500) NOT NULL,               			/* 브랜드 MARKER 세로 이미지 URL */
	BRAND_IMG VARCHAR2(500) NOT NULL,							/* 브랜드 지점 이미지 URL */
	-- UNIQUE 제약조건
	CONSTRAINT UNIQUE_STORE1 UNIQUE (STORE_NO, STORE_NAME, STORE_PHONE, BRAND_NAME), 	/* RESERVATION */
	--	FK 제약조건
	CONSTRAINT FK_STORE_BRAND
		FOREIGN KEY (BRAND_NAME, BRAND_OPEN, BRAND_CLOSE, BRAND_LOGO1, BRAND_LOGO2, BRAND_MARKER, BRAND_IMG)
		REFERENCES BRAND_TB (BRAND_NAME, BRAND_OPEN, BRAND_CLOSE, BRAND_LOGO1, BRAND_LOGO2, BRAND_MARKER, BRAND_IMG)
		ON DELETE CASCADE
);


-- STORE_NO 시퀀스 생성
CREATE SEQUENCE STORE_NO_SEQ
INCREMENT BY 1
START WITH 1
NOCYCLE
NOCACHE;


-- STORE 더미 데이터 생성
INSERT INTO STORE_TB (STORE_NO, STORE_NAME, STORE_PHONE, STORE_ADDR, STORE_MAP, BRAND_NAME, BRAND_OPEN, BRAND_CLOSE, BRAND_LOGO1, BRAND_LOGO2, BRAND_MARKER, BRAND_IMG)
SELECT STORE_NO_SEQ.NEXTVAL, '백종원의 빽보이피자 신논현역점', '1668-3791', '서울 서초구 사평대로55길 18 1층', '37.504821583727015, 127.02274378520693', '빽보이피자',
B.BRAND_OPEN, B.BRAND_CLOSE, B.BRAND_LOGO1, B.BRAND_LOGO2, B.BRAND_MARKER, B.BRAND_IMG FROM BRAND_TB B WHERE B.BRAND_NAME = '빽보이피자';

INSERT INTO STORE_TB (STORE_NO, STORE_NAME, STORE_PHONE, STORE_ADDR, STORE_MAP, BRAND_NAME, BRAND_OPEN, BRAND_CLOSE, BRAND_LOGO1, BRAND_LOGO2, BRAND_MARKER, BRAND_IMG)
SELECT STORE_NO_SEQ.NEXTVAL, '백종원의 빽보이피자 서초점', '070-8840-3804', '서울 서초구 서초대로 280 1층', '37.492990664525664, 127.01233127061306', '빽보이피자',
B.BRAND_OPEN, B.BRAND_CLOSE, B.BRAND_LOGO1, B.BRAND_LOGO2, B.BRAND_MARKER, B.BRAND_IMG FROM BRAND_TB B WHERE B.BRAND_NAME = '빽보이피자';

INSERT INTO STORE_TB (STORE_NO, STORE_NAME, STORE_PHONE, STORE_ADDR, STORE_MAP, BRAND_NAME, BRAND_OPEN, BRAND_CLOSE, BRAND_LOGO1, BRAND_LOGO2, BRAND_MARKER, BRAND_IMG)
SELECT STORE_NO_SEQ.NEXTVAL, '백종원의 빽보이피자 강남청담점', '02-3446-7776', '서울 강남구 삼성로145길 14 103호', '37.52250555013786, 127.04721495360617', '빽보이피자',
B.BRAND_OPEN, B.BRAND_CLOSE, B.BRAND_LOGO1, B.BRAND_LOGO2, B.BRAND_MARKER, B.BRAND_IMG FROM BRAND_TB B WHERE B.BRAND_NAME = '빽보이피자';

INSERT INTO STORE_TB (STORE_NO, STORE_NAME, STORE_PHONE, STORE_ADDR, STORE_MAP, BRAND_NAME, BRAND_OPEN, BRAND_CLOSE, BRAND_LOGO1, BRAND_LOGO2, BRAND_MARKER, BRAND_IMG)
SELECT STORE_NO_SEQ.NEXTVAL, '백종원의 빽보이피자 건대점', '1668-1089', '서울 광진구 능동로13길 54 1층', '37.54425350218965, 127.06985146298014', '빽보이피자',
B.BRAND_OPEN, B.BRAND_CLOSE, B.BRAND_LOGO1, B.BRAND_LOGO2, B.BRAND_MARKER, B.BRAND_IMG FROM BRAND_TB B WHERE B.BRAND_NAME = '빽보이피자';

INSERT INTO STORE_TB (STORE_NO, STORE_NAME, STORE_PHONE, STORE_ADDR, STORE_MAP, BRAND_NAME, BRAND_OPEN, BRAND_CLOSE, BRAND_LOGO1, BRAND_LOGO2, BRAND_MARKER, BRAND_IMG)
SELECT STORE_NO_SEQ.NEXTVAL, '백종원의 빽보이피자 송파헬리오시티점', '1668-5490', '서울 송파구 가락로12길 4 1층', '37.499778661506284, 127.10513344077887', '빽보이피자',
B.BRAND_OPEN, B.BRAND_CLOSE, B.BRAND_LOGO1, B.BRAND_LOGO2, B.BRAND_MARKER, B.BRAND_IMG FROM BRAND_TB B WHERE B.BRAND_NAME = '빽보이피자';

INSERT INTO STORE_TB (STORE_NO, STORE_NAME, STORE_PHONE, STORE_ADDR, STORE_MAP, BRAND_NAME, BRAND_OPEN, BRAND_CLOSE, BRAND_LOGO1, BRAND_LOGO2, BRAND_MARKER, BRAND_IMG)
SELECT STORE_NO_SEQ.NEXTVAL, '역전우동0410 역삼테헤란로점', '02-553-2111', '서울 강남구 테헤란로10길 25 104호', '37.497588576835305, 127.03305220574101', '역전우동',
B.BRAND_OPEN, B.BRAND_CLOSE, B.BRAND_LOGO1, B.BRAND_LOGO2, B.BRAND_MARKER, B.BRAND_IMG FROM BRAND_TB B WHERE B.BRAND_NAME = '역전우동';

INSERT INTO STORE_TB (STORE_NO, STORE_NAME, STORE_PHONE, STORE_ADDR, STORE_MAP, BRAND_NAME, BRAND_OPEN, BRAND_CLOSE, BRAND_LOGO1, BRAND_LOGO2, BRAND_MARKER, BRAND_IMG)
SELECT STORE_NO_SEQ.NEXTVAL, '역전우동0410 강남역태극당점', '02-563-8582', '서울 강남구 테헤란로4길 46 쌍용플레티넘밸류 B107', '37.49520380035758, 127.03068490584577', '역전우동',
B.BRAND_OPEN, B.BRAND_CLOSE, B.BRAND_LOGO1, B.BRAND_LOGO2, B.BRAND_MARKER, B.BRAND_IMG FROM BRAND_TB B WHERE B.BRAND_NAME = '역전우동';

INSERT INTO STORE_TB (STORE_NO, STORE_NAME, STORE_PHONE, STORE_ADDR, STORE_MAP, BRAND_NAME, BRAND_OPEN, BRAND_CLOSE, BRAND_LOGO1, BRAND_LOGO2, BRAND_MARKER, BRAND_IMG)
SELECT STORE_NO_SEQ.NEXTVAL, '역전우동0410 신논현역점', '02-2088-0410', '서울 서초구 사평대로 349 102호', '37.503790220696324, 127.02119406623822', '역전우동',
B.BRAND_OPEN, B.BRAND_CLOSE, B.BRAND_LOGO1, B.BRAND_LOGO2, B.BRAND_MARKER, B.BRAND_IMG FROM BRAND_TB B WHERE B.BRAND_NAME = '역전우동';

INSERT INTO STORE_TB (STORE_NO, STORE_NAME, STORE_PHONE, STORE_ADDR, STORE_MAP, BRAND_NAME, BRAND_OPEN, BRAND_CLOSE, BRAND_LOGO1, BRAND_LOGO2, BRAND_MARKER, BRAND_IMG)
SELECT STORE_NO_SEQ.NEXTVAL, '역전우동0410 서초점', '070-4102-0410', '서울 서초구 서초대로 280 1층', '37.49300417756612, 127.01235106167228', '역전우동',
B.BRAND_OPEN, B.BRAND_CLOSE, B.BRAND_LOGO1, B.BRAND_LOGO2, B.BRAND_MARKER, B.BRAND_IMG FROM BRAND_TB B WHERE B.BRAND_NAME = '역전우동';

INSERT INTO STORE_TB (STORE_NO, STORE_NAME, STORE_PHONE, STORE_ADDR, STORE_MAP, BRAND_NAME, BRAND_OPEN, BRAND_CLOSE, BRAND_LOGO1, BRAND_LOGO2, BRAND_MARKER, BRAND_IMG)
SELECT STORE_NO_SEQ.NEXTVAL, '역전우동0410 강남터미널점', '02-532-0904', '서울 서초구 신반포로 194 강남고속버스터미널', '37.505967846671204, 127.00693011812535', '역전우동',
B.BRAND_OPEN, B.BRAND_CLOSE, B.BRAND_LOGO1, B.BRAND_LOGO2, B.BRAND_MARKER, B.BRAND_IMG FROM BRAND_TB B WHERE B.BRAND_NAME = '역전우동';

INSERT INTO STORE_TB (STORE_NO, STORE_NAME, STORE_PHONE, STORE_ADDR, STORE_MAP, BRAND_NAME, BRAND_OPEN, BRAND_CLOSE, BRAND_LOGO1, BRAND_LOGO2, BRAND_MARKER, BRAND_IMG)
SELECT STORE_NO_SEQ.NEXTVAL, '빽다방 강남역지하도점', '02-3452-3989', '서울 강남구 강남대로 396 강남역 지하쇼핑센터 E-36호', '37.498042662738996, 127.02789565393452', '빽다방',
B.BRAND_OPEN, B.BRAND_CLOSE, B.BRAND_LOGO1, B.BRAND_LOGO2, B.BRAND_MARKER, B.BRAND_IMG FROM BRAND_TB B WHERE B.BRAND_NAME = '빽다방';

INSERT INTO STORE_TB (STORE_NO, STORE_NAME, STORE_PHONE, STORE_ADDR, STORE_MAP, BRAND_NAME, BRAND_OPEN, BRAND_CLOSE, BRAND_LOGO1, BRAND_LOGO2, BRAND_MARKER, BRAND_IMG)
SELECT STORE_NO_SEQ.NEXTVAL, '홍콩반점0410 강남역점', '02-555-8883', '서울 강남구 테헤란로4길 27 2층', '37.49668826437164, 127.03047065243365', '홍콩반점',
B.BRAND_OPEN, B.BRAND_CLOSE, B.BRAND_LOGO1, B.BRAND_LOGO2, B.BRAND_MARKER, B.BRAND_IMG FROM BRAND_TB B WHERE B.BRAND_NAME = '홍콩반점';

INSERT INTO STORE_TB (STORE_NO, STORE_NAME, STORE_PHONE, STORE_ADDR, STORE_MAP, BRAND_NAME, BRAND_OPEN, BRAND_CLOSE, BRAND_LOGO1, BRAND_LOGO2, BRAND_MARKER, BRAND_IMG)
SELECT STORE_NO_SEQ.NEXTVAL, '롤링파스타 가로수길점', '0507-1366-5688', '서울 강남구 가로수길 16 2층', '37.519028037516684, 127.02341549453799', '롤링파스타',
B.BRAND_OPEN, B.BRAND_CLOSE, B.BRAND_LOGO1, B.BRAND_LOGO2, B.BRAND_MARKER, B.BRAND_IMG FROM BRAND_TB B WHERE B.BRAND_NAME = '롤링파스타';

INSERT INTO STORE_TB (STORE_NO, STORE_NAME, STORE_PHONE, STORE_ADDR, STORE_MAP, BRAND_NAME, BRAND_OPEN, BRAND_CLOSE, BRAND_LOGO1, BRAND_LOGO2, BRAND_MARKER, BRAND_IMG)
SELECT STORE_NO_SEQ.NEXTVAL, '한신포차 구의역점', '02-454-0654', '서울 광진구 자양로18길 25 1층', '37.53784429828354, 127.0848911694459', '한신포차',
B.BRAND_OPEN, B.BRAND_CLOSE, B.BRAND_LOGO1, B.BRAND_LOGO2, B.BRAND_MARKER, B.BRAND_IMG FROM BRAND_TB B WHERE B.BRAND_NAME = '한신포차';

INSERT INTO STORE_TB (STORE_NO, STORE_NAME, STORE_PHONE, STORE_ADDR, STORE_MAP, BRAND_NAME, BRAND_OPEN, BRAND_CLOSE, BRAND_LOGO1, BRAND_LOGO2, BRAND_MARKER, BRAND_IMG)
SELECT STORE_NO_SEQ.NEXTVAL, '백스비어 방배역점', '0507-1382-8988', '서울 서초구 효령로31길 17 1층', '37.48194038463768, 126.99624067529642', '백스비어',
B.BRAND_OPEN, B.BRAND_CLOSE, B.BRAND_LOGO1, B.BRAND_LOGO2, B.BRAND_MARKER, B.BRAND_IMG FROM BRAND_TB B WHERE B.BRAND_NAME = '백스비어';

INSERT INTO STORE_TB (STORE_NO, STORE_NAME, STORE_PHONE, STORE_ADDR, STORE_MAP, BRAND_NAME, BRAND_OPEN, BRAND_CLOSE, BRAND_LOGO1, BRAND_LOGO2, BRAND_MARKER, BRAND_IMG)
SELECT STORE_NO_SEQ.NEXTVAL, '새마을식당 역삼스타타워점', '0507-1339-1587', '서울 강남구 테헤란로20길 19 엘지역삼에클라트 1층', '37.498540760142774, 127.03523521253456', '새마을식당',
B.BRAND_OPEN, B.BRAND_CLOSE, B.BRAND_LOGO1, B.BRAND_LOGO2, B.BRAND_MARKER, B.BRAND_IMG FROM BRAND_TB B WHERE B.BRAND_NAME = '새마을식당';

INSERT INTO STORE_TB (STORE_NO, STORE_NAME, STORE_PHONE, STORE_ADDR, STORE_MAP, BRAND_NAME, BRAND_OPEN, BRAND_CLOSE, BRAND_LOGO1, BRAND_LOGO2, BRAND_MARKER, BRAND_IMG)
SELECT STORE_NO_SEQ.NEXTVAL, '제순식당 대학로직영점', '0507-1434-8220', '서울 종로구 대명길 39-4', '37.58278274741988, 126.99947638189154', '제순식당',
B.BRAND_OPEN, B.BRAND_CLOSE, B.BRAND_LOGO1, B.BRAND_LOGO2, B.BRAND_MARKER, B.BRAND_IMG FROM BRAND_TB B WHERE B.BRAND_NAME = '제순식당';

INSERT INTO STORE_TB (STORE_NO, STORE_NAME, STORE_PHONE, STORE_ADDR, STORE_MAP, BRAND_NAME, BRAND_OPEN, BRAND_CLOSE, BRAND_LOGO1, BRAND_LOGO2, BRAND_MARKER, BRAND_IMG)
SELECT STORE_NO_SEQ.NEXTVAL, '리춘시장 강남역점', '070-8633-8280', '서울 강남구 테헤란로1길 30 2층', '37.500272737199225, 127.02753742269141', '리춘시장',
B.BRAND_OPEN, B.BRAND_CLOSE, B.BRAND_LOGO1, B.BRAND_LOGO2, B.BRAND_MARKER, B.BRAND_IMG FROM BRAND_TB B WHERE B.BRAND_NAME = '리춘시장';

INSERT INTO STORE_TB (STORE_NO, STORE_NAME, STORE_PHONE, STORE_ADDR, STORE_MAP, BRAND_NAME, BRAND_OPEN, BRAND_CLOSE, BRAND_LOGO1, BRAND_LOGO2, BRAND_MARKER, BRAND_IMG)
SELECT STORE_NO_SEQ.NEXTVAL, '고투웍 두타몰점', '02-3398-4470', '서울 중구 장충단로 275 두산타워 B2층', '37.56886430947535, 127.00877533817996', '고투웍',
B.BRAND_OPEN, B.BRAND_CLOSE, B.BRAND_LOGO1, B.BRAND_LOGO2, B.BRAND_MARKER, B.BRAND_IMG FROM BRAND_TB B WHERE B.BRAND_NAME = '고투웍';

INSERT INTO STORE_TB (STORE_NO, STORE_NAME, STORE_PHONE, STORE_ADDR, STORE_MAP, BRAND_NAME, BRAND_OPEN, BRAND_CLOSE, BRAND_LOGO1, BRAND_LOGO2, BRAND_MARKER, BRAND_IMG)
SELECT STORE_NO_SEQ.NEXTVAL, '홍콩분식 용산문배점', '02-719-3864', '서울 용산구 백범로90길 38 2층', '37.53667707827815, 126.96962340026128', '홍콩분식',
B.BRAND_OPEN, B.BRAND_CLOSE, B.BRAND_LOGO1, B.BRAND_LOGO2, B.BRAND_MARKER, B.BRAND_IMG FROM BRAND_TB B WHERE B.BRAND_NAME = '홍콩분식';

INSERT INTO STORE_TB (STORE_NO, STORE_NAME, STORE_PHONE, STORE_ADDR, STORE_MAP, BRAND_NAME, BRAND_OPEN, BRAND_CLOSE, BRAND_LOGO1, BRAND_LOGO2, BRAND_MARKER, BRAND_IMG)
SELECT STORE_NO_SEQ.NEXTVAL, '백종원의 원조쌈밥집 영등포역점', '02-2676-7626', '서울 영등포구 영등포로36길 10', '37.51921392274543, 126.90348438373019', '백종원의쌈밥',
B.BRAND_OPEN, B.BRAND_CLOSE, B.BRAND_LOGO1, B.BRAND_LOGO2, B.BRAND_MARKER, B.BRAND_IMG FROM BRAND_TB B WHERE B.BRAND_NAME = '백종원의쌈밥';

INSERT INTO STORE_TB (STORE_NO, STORE_NAME, STORE_PHONE, STORE_ADDR, STORE_MAP, BRAND_NAME, BRAND_OPEN, BRAND_CLOSE, BRAND_LOGO1, BRAND_LOGO2, BRAND_MARKER, BRAND_IMG)
SELECT STORE_NO_SEQ.NEXTVAL, '본가 일원점', '02-445-9233', '서울 강남구 일원로9길 64 승민빌딩 1, 2층', '37.490733952662595, 127.0867742451947', '본가',
B.BRAND_OPEN, B.BRAND_CLOSE, B.BRAND_LOGO1, B.BRAND_LOGO2, B.BRAND_MARKER, B.BRAND_IMG FROM BRAND_TB B WHERE B.BRAND_NAME = '본가';

INSERT INTO STORE_TB (STORE_NO, STORE_NAME, STORE_PHONE, STORE_ADDR, STORE_MAP, BRAND_NAME, BRAND_OPEN, BRAND_CLOSE, BRAND_LOGO1, BRAND_LOGO2, BRAND_MARKER, BRAND_IMG)
SELECT STORE_NO_SEQ.NEXTVAL, '인생설렁탕 고대안암역점', '02-6402-0121', '서울 성북구 고려대로24길 24', '37.58515775384176, 127.02922164882652', '인생설렁탕',
B.BRAND_OPEN, B.BRAND_CLOSE, B.BRAND_LOGO1, B.BRAND_LOGO2, B.BRAND_MARKER, B.BRAND_IMG FROM BRAND_TB B WHERE B.BRAND_NAME = '인생설렁탕';

INSERT INTO STORE_TB (STORE_NO, STORE_NAME, STORE_PHONE, STORE_ADDR, STORE_MAP, BRAND_NAME, BRAND_OPEN, BRAND_CLOSE, BRAND_LOGO1, BRAND_LOGO2, BRAND_MARKER, BRAND_IMG)
SELECT STORE_NO_SEQ.NEXTVAL, '막이오름 건대점', '02-461-0410', '서울 광진구 동일로22길 69-3 1층~2층', '37.541666405653636, 127.06809801431976', '막이오름',
B.BRAND_OPEN, B.BRAND_CLOSE, B.BRAND_LOGO1, B.BRAND_LOGO2, B.BRAND_MARKER, B.BRAND_IMG FROM BRAND_TB B WHERE B.BRAND_NAME = '막이오름';

INSERT INTO STORE_TB (STORE_NO, STORE_NAME, STORE_PHONE, STORE_ADDR, STORE_MAP, BRAND_NAME, BRAND_OPEN, BRAND_CLOSE, BRAND_LOGO1, BRAND_LOGO2, BRAND_MARKER, BRAND_IMG)
SELECT STORE_NO_SEQ.NEXTVAL, '연돈볼카츠 강남CGV점', '070-8666-4637', '서울 강남구 강남대로 438 213호', '37.50162902378058, 127.02634197209417', '연돈볼카츠',
B.BRAND_OPEN, B.BRAND_CLOSE, B.BRAND_LOGO1, B.BRAND_LOGO2, B.BRAND_MARKER, B.BRAND_IMG FROM BRAND_TB B WHERE B.BRAND_NAME = '연돈볼카츠';

INSERT INTO STORE_TB (STORE_NO, STORE_NAME, STORE_PHONE, STORE_ADDR, STORE_MAP, BRAND_NAME, BRAND_OPEN, BRAND_CLOSE, BRAND_LOGO1, BRAND_LOGO2, BRAND_MARKER, BRAND_IMG)
SELECT STORE_NO_SEQ.NEXTVAL, '돌배기집 영등포역점', '02-2676-7596', '서울 영등포구 영중로4길 6-1 1층', '37.517070245354205, 126.90718036039823', '돌배기집',
B.BRAND_OPEN, B.BRAND_CLOSE, B.BRAND_LOGO1, B.BRAND_LOGO2, B.BRAND_MARKER, B.BRAND_IMG FROM BRAND_TB B WHERE B.BRAND_NAME = '돌배기집';

INSERT INTO STORE_TB (STORE_NO, STORE_NAME, STORE_PHONE, STORE_ADDR, STORE_MAP, BRAND_NAME, BRAND_OPEN, BRAND_CLOSE, BRAND_LOGO1, BRAND_LOGO2, BRAND_MARKER, BRAND_IMG)
SELECT STORE_NO_SEQ.NEXTVAL, '미정국수0410 강남역점', '02-532-4937', '서울 서초구 서초대로77길 37 서초동월드1308상가', '37.501023353169195, 127.025168438514', '미정국수',
B.BRAND_OPEN, B.BRAND_CLOSE, B.BRAND_LOGO1, B.BRAND_LOGO2, B.BRAND_MARKER, B.BRAND_IMG FROM BRAND_TB B WHERE B.BRAND_NAME = '미정국수';

INSERT INTO STORE_TB (STORE_NO, STORE_NAME, STORE_PHONE, STORE_ADDR, STORE_MAP, BRAND_NAME, BRAND_OPEN, BRAND_CLOSE, BRAND_LOGO1, BRAND_LOGO2, BRAND_MARKER, BRAND_IMG)
SELECT STORE_NO_SEQ.NEXTVAL, '백철판0410 건대역점', '02-499-0410', '서울 광진구 동일로22길 105 지하1층', '37.54093106859639, 127.06984836333254', '백철판',
B.BRAND_OPEN, B.BRAND_CLOSE, B.BRAND_LOGO1, B.BRAND_LOGO2, B.BRAND_MARKER, B.BRAND_IMG FROM BRAND_TB B WHERE B.BRAND_NAME = '백철판';


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
    R_TIME VARCHAR2(20) NOT NULL,                        						/* 예약 시간 (날짜와 시간 포함) */
    R_PERSON_CNT INTEGER NOT NULL,             				   					/* 예약 인원수 */
    R_SUBMIT_TIME DATE DEFAULT SYSDATE,											/* 예약버튼 누른 시간 */
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
    CONSTRAINT UNIQUE_RESERVATION1 UNIQUE (R_NO, R_TIME, R_SUBMIT_TIME, USER_ID, STORE_NAME) 	/* REVIEW */
);


-- R_NO 시퀀스 생성
CREATE SEQUENCE R_NO_SEQ
INCREMENT BY 1
START WITH 1
NOCYCLE
NOCACHE;


--RESERVATION 더미 데이터 생성
INSERT INTO RESERVATION_TB (R_NO, R_TIME, R_PERSON_CNT, R_SUBMIT_TIME, USER_ID, USER_NAME, STORE_NO, STORE_NAME, STORE_PHONE, BRAND_NAME)
SELECT R_NO_SEQ.NEXTVAL, '1:00', 3, SYSDATE, 'testid01',
U.USER_NAME, 1, S.STORE_NAME, S.STORE_PHONE, S.BRAND_NAME FROM USER_TB U, STORE_TB S WHERE U.USER_ID = 'testid01' AND S.STORE_NO = 1;

INSERT INTO RESERVATION_TB (R_NO, R_TIME, R_PERSON_CNT, R_SUBMIT_TIME, USER_ID, USER_NAME, STORE_NO, STORE_NAME, STORE_PHONE, BRAND_NAME)
SELECT R_NO_SEQ.NEXTVAL, '2:00', 5, SYSDATE, 'testid02',
U.USER_NAME, 1, S.STORE_NAME, S.STORE_PHONE, S.BRAND_NAME FROM USER_TB U, STORE_TB S WHERE U.USER_ID = 'testid02' AND S.STORE_NO = 1;

INSERT INTO RESERVATION_TB (R_NO, R_TIME, R_PERSON_CNT, R_SUBMIT_TIME, USER_ID, USER_NAME, STORE_NO, STORE_NAME, STORE_PHONE, BRAND_NAME)
SELECT R_NO_SEQ.NEXTVAL, '3:00', 4, SYSDATE, 'testid03',
U.USER_NAME, 1, S.STORE_NAME, S.STORE_PHONE, S.BRAND_NAME FROM USER_TB U, STORE_TB S WHERE U.USER_ID = 'testid03' AND S.STORE_NO = 1;

INSERT INTO RESERVATION_TB (R_NO, R_TIME, R_PERSON_CNT, R_SUBMIT_TIME, USER_ID, USER_NAME, STORE_NO, STORE_NAME, STORE_PHONE, BRAND_NAME)
SELECT R_NO_SEQ.NEXTVAL, '4:00', 2, SYSDATE, 'testid04',
U.USER_NAME, 6, S.STORE_NAME, S.STORE_PHONE, S.BRAND_NAME FROM USER_TB U, STORE_TB S WHERE U.USER_ID = 'testid04' AND S.STORE_NO = 6;

INSERT INTO RESERVATION_TB (R_NO, R_TIME, R_PERSON_CNT, R_SUBMIT_TIME, USER_ID, USER_NAME, STORE_NO, STORE_NAME, STORE_PHONE, BRAND_NAME)
SELECT R_NO_SEQ.NEXTVAL, '5:00', 6, SYSDATE, 'testid05',
U.USER_NAME, 6, S.STORE_NAME, S.STORE_PHONE, S.BRAND_NAME FROM USER_TB U, STORE_TB S WHERE U.USER_ID = 'testid05' AND S.STORE_NO = 6;

INSERT INTO RESERVATION_TB (R_NO, R_TIME, R_PERSON_CNT, R_SUBMIT_TIME, USER_ID, USER_NAME, STORE_NO, STORE_NAME, STORE_PHONE, BRAND_NAME)
SELECT R_NO_SEQ.NEXTVAL, '20', 1, SYSDATE, 'testid06',
U.USER_NAME, 6, S.STORE_NAME, S.STORE_PHONE, S.BRAND_NAME FROM USER_TB U, STORE_TB S WHERE U.USER_ID = 'testid06' AND S.STORE_NO = 6;

INSERT INTO RESERVATION_TB (R_NO, R_TIME, R_PERSON_CNT, R_SUBMIT_TIME, USER_ID, USER_NAME, STORE_NO, STORE_NAME, STORE_PHONE, BRAND_NAME)
SELECT R_NO_SEQ.NEXTVAL, '24', 1, SYSDATE, 'testid07',
U.USER_NAME, 14, S.STORE_NAME, S.STORE_PHONE, S.BRAND_NAME FROM USER_TB U, STORE_TB S WHERE U.USER_ID = 'testid07' AND S.STORE_NO = 14;

INSERT INTO RESERVATION_TB (R_NO, R_TIME, R_PERSON_CNT, R_SUBMIT_TIME, USER_ID, USER_NAME, STORE_NO, STORE_NAME, STORE_PHONE, BRAND_NAME)
SELECT R_NO_SEQ.NEXTVAL, '26', 1, SYSDATE, 'testid08',
U.USER_NAME, 14, S.STORE_NAME, S.STORE_PHONE, S.BRAND_NAME FROM USER_TB U, STORE_TB S WHERE U.USER_ID = 'testid08' AND S.STORE_NO = 14;


-- RESERVATION 테스트용 쿼리문
SELECT * FROM RESERVATION_TB;	/* 전체 데이터 조회 */

DELETE FROM RESERVATION_TB WHERE STORE_NO = '6'; /* 매장명 단위로 데이터 삭제 */

DROP SEQUENCE R_NO_SEQ;			/* R_NO 시퀀스 삭제 */

DROP TABLE RESERVATION_TB;		/* RESERVATION 테이블 삭제 */

COMMIT;


-- REVIEW 테이블 생성
CREATE TABLE REVIEW_TB (
	RV_NO INTEGER NOT NULL PRIMARY KEY,	/* 리뷰번호 */
	RV_DATE DATE DEFAULT SYSDATE,		/* 작성일자 */
	R_NO INTEGER NOT NULL,				/* 예약번호 */
	R_TIME VARCHAR2(20) NOT NULL,	    /* 예약시간 (날짜와 시간 포함) */
	R_SUBMIT_TIME DATE NOT NULL,		/* 예약버튼 누른 시간 */
	USER_ID VARCHAR2(20) NOT NULL,		/* 작성자ID */
	STORE_NAME VARCHAR2(400),			/* 방문매장명 */
	RV_PRICE DECIMAL(3, 1) NOT NULL,	/* 별점(가격) */
	RV_TASTE DECIMAL(3, 1) NOT NULL,	/* 별점(맛) */
	RV_VIBE DECIMAL(3, 1) NOT NULL,		/* 별점(분위기) */
	RV_KIND DECIMAL(3, 1) NOT NULL,		/* 별점(친절도) */
	RV_AVERAGE DECIMAL(3, 1) NOT NULL,  /* 별점(평균) */
	--	FK 제약조건
	CONSTRAINT FK_REVIEW_RESERVATION
		FOREIGN KEY (R_NO, R_TIME, R_SUBMIT_TIME, USER_ID, STORE_NAME)
		REFERENCES RESERVATION_TB (R_NO, R_TIME, R_SUBMIT_TIME, USER_ID, STORE_NAME)
		ON DELETE CASCADE,
	-- 별점 범위(0~5) 제한
    CONSTRAINT CHK_PRICE_RANGE CHECK (RV_PRICE BETWEEN 0.0 AND 5.0),
    CONSTRAINT CHK_TASTE_RANGE CHECK (RV_TASTE BETWEEN 0.0 AND 5.0),
    CONSTRAINT CHK_VIBE_RANGE CHECK (RV_VIBE BETWEEN 0.0 AND 5.0),
    CONSTRAINT CHECK_KIND_RANGE CHECK (RV_KIND BETWEEN 0.0 AND 5.0),
    CONSTRAINT CHECK_AVERAGE_RANGE CHECK (RV_AVERAGE BETWEEN 0.0 AND 5.0)
);


-- RV_NO 시퀀스 생성
CREATE SEQUENCE RV_NO_SEQ
INCREMENT BY 1
START WITH 1
NOCYCLE
NOCACHE;


-- REVIEW 더미 데이터 생성
INSERT INTO REVIEW_TB (RV_NO, RV_DATE, R_NO, R_TIME, R_SUBMIT_TIME, USER_ID, STORE_NAME, RV_PRICE, RV_TASTE, RV_VIBE, RV_KIND, RV_AVERAGE)
SELECT RV_NO_SEQ.NEXTVAL, SYSDATE, 1,
R.R_TIME, R.R_SUBMIT_TIME, R.USER_ID, R.STORE_NAME, 5.0, 4.5, 4.0, 5.0, 3.5
FROM RESERVATION_TB R WHERE R.R_NO = 1;

INSERT INTO REVIEW_TB (RV_NO, RV_DATE, R_NO, R_TIME, R_SUBMIT_TIME, USER_ID, STORE_NAME, RV_PRICE, RV_TASTE, RV_VIBE, RV_KIND, RV_AVERAGE)
SELECT RV_NO_SEQ.NEXTVAL, SYSDATE, 2,
R.R_TIME, R.R_SUBMIT_TIME, R.USER_ID, R.STORE_NAME, 5.0, 5.0, 5.0, 5.0, 2.4
FROM RESERVATION_TB R WHERE R.R_NO = 2;

INSERT INTO REVIEW_TB (RV_NO, RV_DATE, R_NO, R_TIME, R_SUBMIT_TIME, USER_ID, STORE_NAME, RV_PRICE, RV_TASTE, RV_VIBE, RV_KIND, RV_AVERAGE)
SELECT RV_NO_SEQ.NEXTVAL, SYSDATE, 3,
R.R_TIME, R.R_SUBMIT_TIME, R.USER_ID, R.STORE_NAME, 3.0, 1.0, 2.5, 5.0, 4.0
FROM RESERVATION_TB R WHERE R.R_NO = 3;

INSERT INTO REVIEW_TB (RV_NO, RV_DATE, R_NO, R_TIME, R_SUBMIT_TIME, USER_ID, STORE_NAME, RV_PRICE, RV_TASTE, RV_VIBE, RV_KIND, RV_AVERAGE)
SELECT RV_NO_SEQ.NEXTVAL, SYSDATE, 4,
R.R_TIME, R.R_SUBMIT_TIME, R.USER_ID, R.STORE_NAME, 2.0, 5.0, 3.5, 1.0, 0.5
FROM RESERVATION_TB R WHERE R.R_NO = 4;

INSERT INTO REVIEW_TB (RV_NO, RV_DATE, R_NO, R_TIME, R_SUBMIT_TIME, USER_ID, STORE_NAME, RV_PRICE, RV_TASTE, RV_VIBE, RV_KIND, RV_AVERAGE)
SELECT RV_NO_SEQ.NEXTVAL, SYSDATE, 5,
R.R_TIME, R.R_SUBMIT_TIME, R.USER_ID, R.STORE_NAME, 3.0, 4.0, 1.5, 0.0, 2.0
FROM RESERVATION_TB R WHERE R.R_NO = 5;


-- REVIEW 테스트용 쿼리문
SELECT * FROM REVIEW_TB;					/* 전체 데이터 조회 */

DELETE FROM REVIEW_TB WHERE RV_NO = '5'; 	/* 리뷰번호 단위로 데이터 삭제 */

DROP SEQUENCE RV_NO_SEQ;					/* 리뷰 시퀀스 삭제 */

DROP TABLE REVIEW_TB;						/* 리뷰 테이블 삭제 */

COMMIT;


-- * 테스트용 쿼리문
SELECT * FROM BRAND_TB;
SELECT * FROM STORE_TB;
SELECT * FROM USER_TB;
SELECT * FROM RESERVATION_TB;
SELECT * FROM REVIEW_TB;

DROP TABLE BRAND_TB;
DROP TABLE STORE_TB;
DROP TABLE USER_TB;
DROP TABLE RESERVATION_TB;
DROP TABLE REVIEW_TB;	

DROP SEQUENCE BRAND_NO_SEQ;	
DROP SEQUENCE STORE_NO_SEQ;
DROP SEQUENCE USER_NO_SEQ;
DROP SEQUENCE R_NO_SEQ;	
DROP SEQUENCE RV_NO_SEQ;

-- 참조 무결성이 유지되는지 확인

SELECT * 
FROM STORE_TB 
WHERE BRAND_NAME = '빽보이피자';

SELECT B.BRAND_NAME, R.R_TIME, S.STORE_NO, S.STORE_NAME, S.STORE_PHONE, S.STORE_ADDR FROM RESERVATION_TB R
JOIN STORE_TB S ON R.STORE_NO = S.STORE_NO
JOIN BRAND_TB B ON S.BRAND_NAME = B.BRAND_NAME   WHERE 1=1;
                    
SELECT DISTINCT BRAND_NAME FROM BRAND_TB;
SELECT DISTINCT STORE_ADDR FROM STORE_TB;



SELECT s.STORE_NAME, 
       b.BRAND_NAME, 
       b.BRAND_LOGO2 AS brandLogo2, 
       b.BRAND_IMG AS brandImg, 
       b.BRAND_FOOD AS brandFood, 
       s.STORE_ADDR AS storeAddr 
FROM STORE_TB s 
JOIN BRAND_TB b ON s.BRAND_NAME = b.BRAND_NAME 
LEFT JOIN REVIEW_TB r ON s.STORE_NAME = r.STORE_NAME 
LEFT JOIN RESERVATION_TB res ON s.STORE_NO = res.STORE_NO 
WHERE 1=1;


