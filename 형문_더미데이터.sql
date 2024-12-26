
--회원 1명
INSERT INTO "FILOOM"."MEMBER" (USER_NO, USER_ID, USER_PWD, USER_NAME, GENDER, BIRTH, EMAIL, ENROLL_DATE, STATUS) VALUES ('1', '123', '123', '일이삼', 'M', '19920325', '123@naver.com', TO_DATE('2024-12-12 13:21:19', 'YYYY-MM-DD HH24:MI:SS'), 'Y');



--영화목록
INSERT INTO "FILOOM"."MOVIE" (MOVIE_NO, MOVIE_TITLE, PREMIERE, OPEN_DATE, DIRECTOR, GENRE, RUNTIME, SCREEN_TYPE, FILM_RATE, DESCRIPTION, STARRING, STATUS) VALUES ('1', '조커', 'Y', TO_DATE('2024-12-11 17:56:52', 'YYYY-MM-DD HH24:MI:SS'), '봉준호', '액션', '120', '2D', '19', '영화설명~~~~~~', '출연자정보~~~~~', 'Y');


--영화 이미지
INSERT INTO "FILOOM"."POSTER" (IMAGE_ID, MOVIE_NO, FILE_NAME, FILE_CODENAME, IMAGE_PATH, UPLOAD_DATE, FILE_LEVEL, STATUS) VALUES ('1', '1', 'ORIGINFILENAME', 'joker.jpg', 'resources/images/posters', TO_DATE('2024-12-11 18:14:15', 'YYYY-MM-DD HH24:MI:SS'), '1', 'Y');


--상영관정보

INSERT INTO "FILOOM"."SCREEN" (SCREEN_NO, SCREEN_NAME, SCREEN_CAPACITY,SCREEN_INFO) VALUES ('1', '1관', '50','상영관정보를 담을수 있는공간');

--스크린시트 테이블
INSERT INTO "FILOOM"."SCREEN_SEAT" (SSEAT_NO, SEAT_NO, SCREEN_NO) VALUES ('1', 'L1-1', '1');
INSERT INTO "FILOOM"."SCREEN_SEAT" (SSEAT_NO, SEAT_NO, SCREEN_NO) VALUES ('2', 'L2-2', '1');
INSERT INTO "FILOOM"."SCREEN_SEAT" (SSEAT_NO, SEAT_NO, SCREEN_NO) VALUES ('3', 'M1-3', '1');
INSERT INTO "FILOOM"."SCREEN_SEAT" (SSEAT_NO, SEAT_NO, SCREEN_NO) VALUES ('4', 'M2-4', '1');

--PLAYING 상영정보
INSERT INTO "FILOOM"."PLAYING" (PLAYING_NO, PLAYTIME, STATUS, MOVIE_NO, SCREEN_NO) VALUES ('1', TO_DATE('2024-12-25 13:57:05', 'YYYY-MM-DD HH24:MI:SS'), 'Y', '1', '1');

--상영,좌석


--쿠폰 생성
INSERT INTO "FILOOM"."COUPON" (COUPON_NO, COUPON_NAME, COUPON_STATUS, COUPON_LEVEL,COUPON_EXP_DATE) VALUES ('10', '웰컴쿠폰', 'Y', '1','25/06/19');
INSERT INTO "FILOOM"."COUPON" (COUPON_NO, COUPON_NAME, COUPON_STATUS, COUPON_LEVEL,COUPON_EXP_DATE) VALUES ('11', 'VIP쿠폰', 'Y', '1','25/06/31');
INSERT INTO "FILOOM"."COUPON" (COUPON_NO, COUPON_NAME, COUPON_STATUS, COUPON_LEVEL,COUPON_EXP_DATE) VALUES ('12', '이벤트쿠폰',  'Y', '1','25/06/21');
INSERT INTO "FILOOM"."COUPON" (COUPON_NO, COUPON_NAME, COUPON_STATUS, COUPON_LEVEL,COUPON_EXP_DATE) VALUES ('13', '댓글쿠폰',  'Y', '1','25/06/22');
INSERT INTO "FILOOM"."COUPON" (COUPON_NO, COUPON_NAME, COUPON_STATUS, COUPON_LEVEL,COUPON_EXP_DATE) VALUES ('14', '쿠폰',  'Y', '1','25/06/32');
INSERT INTO "FILOOM"."COUPON" (COUPON_NO, COUPON_NAME, COUPON_STATUS, COUPON_LEVEL,COUPON_EXP_DATE) VALUES ('15', '이벤트1쿠폰',  'Y', '1','25/06/24');
INSERT INTO "FILOOM"."COUPON" (COUPON_NO, COUPON_NAME, COUPON_STATUS, COUPON_LEVEL,COUPON_EXP_DATE) VALUES ('16', '이벤트2쿠폰',  'Y', '1','25/06/25');


--유저 쿠폰 생성
INSERT INTO "FILOOM"."COUPON_USER" (COUPON_NO, USER_NO, COUPON_USE) VALUES ('10', '1', 'X');
INSERT INTO "FILOOM"."COUPON_USER" (COUPON_NO, USER_NO, COUPON_USE) VALUES ('11', '1', 'X');
INSERT INTO "FILOOM"."COUPON_USER" (COUPON_NO, USER_NO, COUPON_USE) VALUES ('12', '1', 'X');
INSERT INTO "FILOOM"."COUPON_USER" (COUPON_NO, USER_NO, COUPON_USE) VALUES ('13', '1', 'X');
INSERT INTO "FILOOM"."COUPON_USER" (COUPON_NO, USER_NO, COUPON_USE) VALUES ('14', '1', 'X');
INSERT INTO "FILOOM"."COUPON_USER" (COUPON_NO, USER_NO, COUPON_USE) VALUES ('15', '1', 'X');

COMMIT;



--초기화 구문

INSERT INTO "FILOOM"."BOOKING" (BOOK_NO, USER_NO, BOOK_DATE, BOOK_TOTAL_COST, BOOK_COST, COST_PROCESS, COST_TID, STATUS) VALUES (SEQ_BNO.NEXTVAL, '1', TO_DATE('2024-12-25 22:18:42', 'YYYY-MM-DD HH24:MI:SS'), '300', '300', 'CARD', 'dsfgadfasdf', 'Y')

SELECT COUNT(BOOK_NO)
		  FROM BOOKING B
		 JOIN MEMBER M ON (B.USER_NO = M.USER_NO)
         COMMIT;