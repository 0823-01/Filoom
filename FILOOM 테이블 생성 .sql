-- 사용자 생성 및 권한 부여
-- CREATE USER FILOOM IDENTIFIED BY FILOOM;
-- GRANT CONNECT, RESOURCE TO FILOOM;
DROP TABLE BOOKING_SEAT_MAPPING CASCADE CONSTRAINTS;
DROP TABLE SEAT CASCADE CONSTRAINTS;

-- 기존 테이블 및 시퀀스 삭제
DROP TABLE BOOKING_SEAT CASCADE CONSTRAINTS;
DROP TABLE BOOKING CASCADE CONSTRAINTS;
DROP TABLE PLAYING CASCADE CONSTRAINTS;
DROP TABLE SCREEN_SEAT CASCADE CONSTRAINTS;
DROP TABLE SCREEN CASCADE CONSTRAINTS;
DROP TABLE FAVORITE CASCADE CONSTRAINTS;
DROP TABLE REVIEW CASCADE CONSTRAINTS;
DROP TABLE POSTER CASCADE CONSTRAINTS;
DROP TABLE MOVIE CASCADE CONSTRAINTS;
DROP TABLE APPLICANT CASCADE CONSTRAINTS;
DROP TABLE COUPON_USER CASCADE CONSTRAINTS;
DROP TABLE COUPON CASCADE CONSTRAINTS;
DROP TABLE REPLY CASCADE CONSTRAINTS;
DROP TABLE EVENT_ATTACHMENT CASCADE CONSTRAINTS;
DROP TABLE EVENT CASCADE CONSTRAINTS;
DROP TABLE NOTICE CASCADE CONSTRAINTS;
DROP TABLE CATEGORY CASCADE CONSTRAINTS;
DROP TABLE CERT CASCADE CONSTRAINTS;
DROP TABLE MEMBER CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_UNO;
DROP SEQUENCE SEQ_MNO;
DROP SEQUENCE SEQ_IMG;
DROP SEQUENCE SEQ_REV;
DROP SEQUENCE SEQ_ANO;
DROP SEQUENCE SEQ_NNO;
DROP SEQUENCE SEQ_ENO;
DROP SEQUENCE SEQ_EFNO;
DROP SEQUENCE SEQ_ERNO;
DROP SEQUENCE SEQ_CNO;
DROP SEQUENCE SEQ_CAT;
DROP SEQUENCE SEQ_BNO;
DROP SEQUENCE SEQ_SCR;
--DROP SEQUENCE SEQ_SEA; --존재하지 않는 시퀀스임
DROP SEQUENCE SEQ_PLA;
DROP SEQUENCE SEQ_SCRS;
DROP SEQUENCE SEQ_BSNO;

-- MEMBER 테이블 생성
CREATE TABLE MEMBER (
    USER_NO NUMBER PRIMARY KEY,
    USER_ID VARCHAR2(30) NOT NULL,
    USER_PWD VARCHAR2(100) NOT NULL,
    USER_NAME VARCHAR2(30) NOT NULL,
    EMAIL VARCHAR2(50) NOT NULL,
    BIRTH VARCHAR2(8) NOT NULL,
    GENDER CHAR(1) CHECK (GENDER IN ('M', 'F')),
    MARKETING CHAR(1) DEFAULT 'N' CHECK (MARKETING IN ('Y', 'N')),
    ENROLL_DATE DATE DEFAULT SYSDATE,
    STATUS CHAR(1) DEFAULT 'Y' CHECK (STATUS IN ('Y', 'N'))
);
COMMENT ON COLUMN MEMBER.USER_NO IS '회원번호';
COMMENT ON COLUMN MEMBER.USER_ID IS '아이디';
COMMENT ON COLUMN MEMBER.USER_PWD IS '비밀번호';
COMMENT ON COLUMN MEMBER.USER_NAME IS '이름';
COMMENT ON COLUMN MEMBER.EMAIL IS '이메일';
COMMENT ON COLUMN MEMBER.BIRTH IS '생년월일';
COMMENT ON COLUMN MEMBER.GENDER IS '성별';
COMMENT ON COLUMN MEMBER.MARKETING IS '마케팅동의여부';
COMMENT ON COLUMN MEMBER.ENROLL_DATE IS '회원가입일';
COMMENT ON COLUMN MEMBER.STATUS IS '상태'; -- 'Y' : 활성화 / 'N' : 비활성화(탈퇴)
CREATE SEQUENCE SEQ_UNO NOCACHE;

-- CERT 테이블 생성
CREATE TABLE CERT (
    CERT_NUM VARCHAR2(100) NOT NULL,
    USER_EMAIL VARCHAR2(200) NOT NULL,
    CREATE_DATE DATE NOT NULL
);
COMMENT ON COLUMN CERT.CERT_NUM IS '인증번호';
COMMENT ON COLUMN CERT.USER_EMAIL IS '회원이메일';
COMMENT ON COLUMN CERT.CREATE_DATE IS '생성날짜';





-- CATEGORY 테이블 생성
CREATE TABLE CATEGORY(
  CATEGORY_NO NUMBER PRIMARY KEY,
  CATEGORY_NAME VARCHAR2(30) NOT NULL
);
COMMENT ON COLUMN CATEGORY.CATEGORY_NO IS '#';
COMMENT ON COLUMN CATEGORY.CATEGORY_NAME IS '#';
CREATE SEQUENCE SEQ_CAT NOCACHE;

-- NOTICE 테이블 생성
CREATE TABLE NOTICE(
  NOTICE_NO NUMBER PRIMARY KEY,
  NOTICE_TITLE VARCHAR2(200) NOT NULL,
  NOTICE_CONTENT VARCHAR2(4000) NOT NULL,
  CREATE_DATE DATE DEFAULT SYSDATE NOT NULL,
  COUNT NUMBER DEFAULT 0,
  STATUS VARCHAR2(1) DEFAULT 'Y' CHECK (STATUS IN ('Y', 'N'))
);
COMMENT ON COLUMN NOTICE.NOTICE_NO IS '#';
COMMENT ON COLUMN NOTICE.NOTICE_TITLE IS '#';
COMMENT ON COLUMN NOTICE.NOTICE_CONTENT IS '#';
COMMENT ON COLUMN NOTICE.CREATE_DATE IS '#';
COMMENT ON COLUMN NOTICE.COUNT IS '#';
COMMENT ON COLUMN NOTICE.STATUS IS '#';
CREATE SEQUENCE SEQ_NNO NOCACHE;

-- EVENT 테이블 생성
CREATE TABLE EVENT(
  EVENT_NO NUMBER PRIMARY KEY,
  EVENT_TITLE VARCHAR2(200) NOT NULL,
  EVENT_CONTENT VARCHAR2(4000) NOT NULL,
  START_DATE DATE,
  END_DATE DATE,
  STATUS VARCHAR2(1) DEFAULT 'Y' CHECK (STATUS IN ('Y', 'N')),
  EVENT_STATUS VARCHAR2(1) DEFAULT 'N' CHECK(EVENT_STATUS IN ('Y', 'N')),
  EVENT_TYPE NUMBER CHECK(EVENT_TYPE IN (1, 2, 3))
);
COMMENT ON COLUMN EVENT.EVENT_NO IS '#';
COMMENT ON COLUMN EVENT.EVENT_TITLE IS '#';
COMMENT ON COLUMN EVENT.EVENT_CONTENT IS '#';
COMMENT ON COLUMN EVENT.START_DATE IS '#';
COMMENT ON COLUMN EVENT.END_DATE IS '#';
COMMENT ON COLUMN EVENT.STATUS IS '#';
COMMENT ON COLUMN EVENT.EVENT_STATUS IS '#';
COMMENT ON COLUMN EVENT.EVENT_TYPE IS '#';
CREATE SEQUENCE SEQ_ENO NOCACHE;

-- APPLICANT 테이블 생성
CREATE TABLE APPLICANT(
  APPLICANT_NO NUMBER PRIMARY KEY,      
  REF_ENO NUMBER NOT NULL,              
  USER_NO NUMBER NOT NULL,              
  APPLICATION_DATE DATE DEFAULT SYSDATE, 
  WINNER_STATUS CHAR(1) DEFAULT 'N' CHECK (WINNER_STATUS IN ('Y', 'N')), 
  FOREIGN KEY (REF_ENO) REFERENCES EVENT(EVENT_NO),
  FOREIGN KEY (USER_NO) REFERENCES MEMBER(USER_NO)
);
COMMENT ON COLUMN APPLICANT.APPLICANT_NO IS '#';
COMMENT ON COLUMN APPLICANT.REF_ENO IS '#';
COMMENT ON COLUMN APPLICANT.USER_NO IS '#';
COMMENT ON COLUMN APPLICANT.APPLICATION_DATE IS '#';
COMMENT ON COLUMN APPLICANT.WINNER_STATUS IS '#';
CREATE SEQUENCE SEQ_ANO NOCACHE;

-- EVENT_ATTACHMENT 테이블 생성
CREATE TABLE EVENT_ATTACHMENT(
  EVENT_FILE_NO NUMBER PRIMARY KEY,
  REF_ENO NUMBER NOT NULL,
  ORIGIN_NAME VARCHAR2(300) NOT NULL,
  CHANGE_NAME VARCHAR2(300) NOT NULL,
  FILE_PATH VARCHAR2(1000) NOT NULL,
  UPLOAD_DATE DATE DEFAULT SYSDATE NOT NULL,
  STATUS VARCHAR2(1) DEFAULT 'Y' CHECK (STATUS IN ('Y', 'N')),
  FILE_LEVEL NUMBER DEFAULT 2 CHECK (FILE_LEVEL IN (1, 2)),
  FOREIGN KEY (REF_ENO) REFERENCES EVENT(EVENT_NO)
);
COMMENT ON COLUMN EVENT_ATTACHMENT.EVENT_FILE_NO IS '#';
COMMENT ON COLUMN EVENT_ATTACHMENT.REF_ENO IS '#';
COMMENT ON COLUMN EVENT_ATTACHMENT.ORIGIN_NAME IS '#';
COMMENT ON COLUMN EVENT_ATTACHMENT.CHANGE_NAME IS '#';
COMMENT ON COLUMN EVENT_ATTACHMENT.FILE_PATH IS '#';
COMMENT ON COLUMN EVENT_ATTACHMENT.UPLOAD_DATE IS '#';
COMMENT ON COLUMN EVENT_ATTACHMENT.STATUS IS '#';
COMMENT ON COLUMN EVENT_ATTACHMENT.FILE_LEVEL IS '#';
CREATE SEQUENCE SEQ_EFNO NOCACHE;

-- REPLY 테이블 생성
CREATE TABLE REPLY(
  REPLY_NO NUMBER PRIMARY KEY,
  REF_ENO NUMBER NOT NULL,
  REPLY_CONTENT VARCHAR2(4000) NOT NULL,
  REPLY_WRITER NUMBER NOT NULL,
  CREATE_DATE DATE DEFAULT SYSDATE NOT NULL,
  STATUS VARCHAR2(1) DEFAULT 'Y' CHECK (STATUS IN ('Y', 'N')),
  FOREIGN KEY (REF_ENO) REFERENCES EVENT(EVENT_NO),
  FOREIGN KEY (REPLY_WRITER) REFERENCES MEMBER(USER_NO)
);
COMMENT ON COLUMN REPLY.REPLY_NO IS '#';
COMMENT ON COLUMN REPLY.REF_ENO IS '#';
COMMENT ON COLUMN REPLY.REPLY_CONTENT IS '#';
COMMENT ON COLUMN REPLY.REPLY_WRITER IS '#';
COMMENT ON COLUMN REPLY.CREATE_DATE IS '#';
COMMENT ON COLUMN REPLY.STATUS IS '#';
CREATE SEQUENCE SEQ_ERNO NOCACHE;

-- COUPON 테이블 생성
CREATE TABLE COUPON(
  COUPON_NO NUMBER PRIMARY KEY,
  COUPON_NAME VARCHAR2(300) NOT NULL,
  COUPON_EXP_DATE DATE DEFAULT ADD_MONTHS(SYSDATE, 6),
  COUPON_STATUS VARCHAR2(1) DEFAULT 'Y' CHECK(COUPON_STATUS IN ('Y', 'N')),
  COUPON_LEVEL NUMBER CHECK(COUPON_LEVEL BETWEEN 1 AND 3),
  REF_ENO NUMBER,
  FOREIGN KEY (REF_ENO) REFERENCES EVENT(EVENT_NO)
);
COMMENT ON COLUMN COUPON.COUPON_NO IS '쿠폰고유번호 SEQ_CNO';
COMMENT ON COLUMN COUPON.COUPON_NAME IS '쿠폰이름';
COMMENT ON COLUMN COUPON.COUPON_EXP_DATE IS '쿠폰 사용 기한 DEFAULT:SYSDATE+6개월';
COMMENT ON COLUMN COUPON.COUPON_STATUS IS '쿠폰상태값 Y:유효, X:무효 (관리자가 전체 쿠폰을 삭제한경우 X)';
COMMENT ON COLUMN COUPON.COUPON_LEVEL IS '쿠폰레벨 1무대시사회,2영화관람권응모하기,3기타이벤트';
COMMENT ON COLUMN COUPON.REF_ENO IS '이벤트게시글번호 (외래키)';
CREATE SEQUENCE SEQ_CNO NOCACHE;


-- MOVIE 테이블 생성


CREATE TABLE MOVIE(
    MOVIE_NO        NUMBER          PRIMARY KEY,
    MOVIE_TITLE     VARCHAR2(200)   NOT NULL,
    PREMIERE        CHAR(1)         DEFAULT 'N' CHECK(PREMIERE IN ('Y', 'N')) NOT NULL,
    OPEN_DATE       DATE            NOT NULL,
    DIRECTOR        VARCHAR2(50)    NOT NULL,
    GENRE           VARCHAR2(200),
    RUNTIME         NUMBER          NOT NULL,
    SCREEN_TYPE     VARCHAR2(200),
    FILM_RATE       NUMBER          CHECK(FILM_RATE IN (3,12,15,19)) NOT NULL,
    DESCRIPTION     VARCHAR2(2000),
    STARRING        VARCHAR2(500),
    STATUS          CHAR(1)         DEFAULT 'Y' CHECK(STATUS IN ('Y','N')),
    TRAILER         VARCHAR2(500)
);
COMMENT ON COLUMN MOVIE.MOVIE_NO IS '영화번호 시퀀스';
COMMENT ON COLUMN MOVIE.MOVIE_TITLE IS '영화 제목';
COMMENT ON COLUMN MOVIE.PREMIERE IS '상영여부 Y,N';
COMMENT ON COLUMN MOVIE.OPEN_DATE IS '개봉일자';
COMMENT ON COLUMN MOVIE.DIRECTOR IS '감독';
COMMENT ON COLUMN MOVIE.GENRE IS '장르';
COMMENT ON COLUMN MOVIE.RUNTIME IS '러닝타임 (정수형)';
COMMENT ON COLUMN MOVIE.SCREEN_TYPE IS '상영타입 (2D,3D,IMAX)';
COMMENT ON COLUMN MOVIE.FILM_RATE IS '상영등급 (3[전체]/12/15/19)';
COMMENT ON COLUMN MOVIE.DESCRIPTION IS '영화설명';
COMMENT ON COLUMN MOVIE.STARRING IS '출연자정보';
COMMENT ON COLUMN MOVIE.STATUS IS '존속여부 Y,N';
CREATE SEQUENCE SEQ_MNO NOCACHE;

-- POSTER 테이블 생성
CREATE TABLE POSTER(
    IMAGE_ID        NUMBER          PRIMARY KEY,
    MOVIE_NO        NUMBER          NOT NULL,
    FILE_NAME       VARCHAR2(1000)  NOT NULL,
    FILE_CODENAME   VARCHAR2(1000)  NOT NULL,
    IMAGE_PATH      VARCHAR2(1000),
    UPLOAD_DATE     DATE            DEFAULT SYSDATE,
    FILE_LEVEL      NUMBER          DEFAULT 2 CHECK(FILE_LEVEL IN (1,2)),
    STATUS          CHAR(1)         DEFAULT 'Y' CHECK(STATUS IN ('Y','N')),
    FOREIGN KEY(MOVIE_NO) REFERENCES MOVIE(MOVIE_NO)
);
COMMENT ON COLUMN POSTER.IMAGE_ID IS '이미지번호 (시퀀스 SEQ_IMG)';
COMMENT ON COLUMN POSTER.MOVIE_NO IS '영화번호';
COMMENT ON COLUMN POSTER.FILE_NAME IS '원본파일명';
COMMENT ON COLUMN POSTER.FILE_CODENAME IS '수정파일명';
COMMENT ON COLUMN POSTER.IMAGE_PATH IS '경로+수정파일명';
COMMENT ON COLUMN POSTER.UPLOAD_DATE IS '업로드일자';
COMMENT ON COLUMN POSTER.FILE_LEVEL IS '파일레벨 1-썸네일 2-기타';
COMMENT ON COLUMN POSTER.STATUS IS '상태값';
CREATE SEQUENCE SEQ_IMG NOCACHE;

-- REVIEW 테이블 생성
CREATE TABLE REVIEW(
    REVIEW_ID	    NUMBER	        PRIMARY KEY,
    USER_NO         NUMBER          NOT NULL,
    MOVIE_NO        NUMBER          NOT NULL,
    REVIEW_TITLE    VARCHAR2(200)   NOT NULL,
    REVIEW_DATE     DATE            DEFAULT SYSDATE,
    SCORE           NUMBER          CHECK(SCORE IN (1,2,3,4,5)) NOT NULL,
    IS_WATCHED      CHAR(1)         DEFAULT 'N' CHECK(IS_WATCHED IN ('Y', 'N')),
    REVIEW_CONTENT  VARCHAR2(2000)  NOT NULL,
    IS_DELETED      CHAR(1)         DEFAULT 'N' CHECK(IS_DELETED IN ('Y', 'N')),
    FOREIGN KEY(USER_NO) REFERENCES MEMBER(USER_NO),
    FOREIGN KEY(MOVIE_NO) REFERENCES MOVIE(MOVIE_NO)
);
COMMENT ON COLUMN REVIEW.REVIEW_ID IS '#';
COMMENT ON COLUMN REVIEW.USER_NO IS '#';
COMMENT ON COLUMN REVIEW.MOVIE_NO IS '#';
COMMENT ON COLUMN REVIEW.REVIEW_TITLE IS '#';
COMMENT ON COLUMN REVIEW.REVIEW_DATE IS '#';
COMMENT ON COLUMN REVIEW.SCORE IS '#';
COMMENT ON COLUMN REVIEW.IS_WATCHED IS '#';
COMMENT ON COLUMN REVIEW.REVIEW_CONTENT IS '#';
COMMENT ON COLUMN REVIEW.IS_DELETED IS '#';
CREATE SEQUENCE SEQ_REV NOCACHE;

-- FAVORITE 테이블 생성
CREATE TABLE FAVORITE(
    USER_NO NUMBER NOT NULL,
    MOVIE_NO NUMBER NOT NULL,
    FOREIGN KEY(USER_NO) REFERENCES MEMBER(USER_NO),
    FOREIGN KEY(MOVIE_NO) REFERENCES MOVIE(MOVIE_NO)
);
COMMENT ON COLUMN FAVORITE.USER_NO IS '#';
COMMENT ON COLUMN FAVORITE.MOVIE_NO IS '#';

-- BOOKING 테이블 생성
CREATE TABLE BOOKING(
    BOOK_NO NUMBER PRIMARY KEY,
    USER_NO NUMBER NOT NULL,
    BOOK_DATE DATE DEFAULT SYSDATE NOT NULL,
    BOOK_TOTAL_COST NUMBER,
    BOOK_COST NUMBER,
    COST_PROCESS VARCHAR2(200),
    COST_TID VARCHAR2(200),
    STATUS CHAR(1) DEFAULT 'Y' CHECK (STATUS IN ('Y', 'N')),
    MODIFY_DATE DATE,
    
    FOREIGN KEY (USER_NO) REFERENCES MEMBER(USER_NO)
);
COMMENT ON COLUMN BOOKING.BOOK_NO IS '영화예매번호 SEQ_BNO';
COMMENT ON COLUMN BOOKING.USER_NO IS '회원번호';
COMMENT ON COLUMN BOOKING.BOOK_DATE IS '예매날짜';
COMMENT ON COLUMN BOOKING.BOOK_TOTAL_COST IS '총금액';
COMMENT ON COLUMN BOOKING.BOOK_COST IS '결제된 금액 (총금액-할인(쿠폰))';
COMMENT ON COLUMN BOOKING.COST_PROCESS IS '결제방식(카드,계좌,모바일 등)';
COMMENT ON COLUMN BOOKING.COST_TID IS '결제번호 (결제시 부여받는 번호,결제취소시 필요)';
COMMENT ON COLUMN BOOKING.STATUS IS 'Y,N(결제취소시N)';
COMMENT ON COLUMN BOOKING.MODIFY_DATE IS '수정날짜(결제취소날짜)';
CREATE SEQUENCE SEQ_BNO NOCACHE;

-- SCREEN 테이블 생성
CREATE TABLE SCREEN(
    SCREEN_NO NUMBER PRIMARY KEY,
    SCREEN_NAME VARCHAR2(50),
    SCREEN_CAPACITY NUMBER,
    SCREEN_INFO VARCHAR2(200)
);
COMMENT ON COLUMN SCREEN.SCREEN_NO IS '상영관번호';
COMMENT ON COLUMN SCREEN.SCREEN_NAME IS '상영관이름';
COMMENT ON COLUMN SCREEN.SCREEN_CAPACITY IS '수용인원';
COMMENT ON COLUMN SCREEN.SCREEN_INFO IS '상영관정보';
CREATE SEQUENCE SEQ_SCR NOCACHE;

-- PLAYING 테이블 생성
CREATE TABLE PLAYING(
    PLAYING_NO NUMBER PRIMARY KEY,
    PLAYTIME DATE NOT NULL,
    STATUS CHAR(1) DEFAULT 'Y' CHECK (STATUS IN ('Y', 'N')),
    MOVIE_NO NUMBER NOT NULL,
    SCREEN_NO NUMBER NOT NULL,
    FOREIGN KEY (MOVIE_NO) REFERENCES MOVIE(MOVIE_NO),
    FOREIGN KEY (SCREEN_NO) REFERENCES SCREEN(SCREEN_NO)
);
COMMENT ON COLUMN PLAYING.PLAYING_NO IS '상영번호 SEQ_PLA';
COMMENT ON COLUMN PLAYING.PLAYTIME IS '상영시간 DATE타입';
COMMENT ON COLUMN PLAYING.STATUS IS '삭제여부';
COMMENT ON COLUMN PLAYING.MOVIE_NO IS '영화번호';
COMMENT ON COLUMN PLAYING.SCREEN_NO IS '상영관번호';
CREATE SEQUENCE SEQ_PLA NOCACHE;

-- SCREEN_SEAT 테이블 생성
CREATE TABLE SCREEN_SEAT(
    SSEAT_NO NUMBER PRIMARY KEY,
    SEAT_NO VARCHAR2(20) NOT NULL,
    SCREEN_NO NUMBER NOT NULL,
    FOREIGN KEY (SCREEN_NO) REFERENCES SCREEN(SCREEN_NO)
);
COMMENT ON COLUMN SCREEN_SEAT.SSEAT_NO IS '좌석일렬번호 SEQ_SCRS';
COMMENT ON COLUMN SCREEN_SEAT.SEAT_NO IS '좌석번호';
COMMENT ON COLUMN SCREEN_SEAT.SCREEN_NO IS '상영관번호';
CREATE SEQUENCE SEQ_SCRS NOCACHE;

-- BOOKING_SEAT 테이블 생성
CREATE TABLE BOOKING_SEAT(
    BOOKING_SEAT_NO NUMBER PRIMARY KEY,
    TIMELIMIT DATE,
    SSEAT_NO NUMBER NOT NULL,
    PLAYING_NO NUMBER NOT NULL,
    BOOK_NO NUMBER,
    FOREIGN KEY (SSEAT_NO) REFERENCES SCREEN_SEAT(SSEAT_NO),
    FOREIGN KEY (PLAYING_NO) REFERENCES PLAYING(PLAYING_NO),
    FOREIGN KEY (BOOK_NO) REFERENCES BOOKING(BOOK_NO)
);
COMMENT ON COLUMN BOOKING_SEAT.BOOKING_SEAT_NO IS '상영좌석 일련번호 SEQ_BSNO';
COMMENT ON COLUMN BOOKING_SEAT.TIMELIMIT IS '유효시간';
COMMENT ON COLUMN BOOKING_SEAT.SSEAT_NO IS '좌석일렬번호';
COMMENT ON COLUMN BOOKING_SEAT.PLAYING_NO IS '영화상영번호';
CREATE SEQUENCE SEQ_BSNO NOCACHE;

-- COUPON_USER 테이블 생성
CREATE TABLE COUPON_USER(
  COUPON_NO NUMBER,
  USER_NO NUMBER,
  BOOK_NO NUMBER,
  COUPON_USE CHAR(1) DEFAULT 'X' CHECK(COUPON_USE IN ('O', 'X')),
  FOREIGN KEY (COUPON_NO) REFERENCES COUPON(COUPON_NO),
  FOREIGN KEY (USER_NO) REFERENCES MEMBER(USER_NO),
  FOREIGN KEY (BOOK_NO) REFERENCES BOOKING(BOOK_NO)
);

COMMENT ON COLUMN COUPON_USER.COUPON_NO IS '쿠폰번호';
COMMENT ON COLUMN COUPON_USER.USER_NO IS '회원번호';
COMMENT ON COLUMN BOOKING.BOOK_NO IS '예매번호';
COMMENT ON COLUMN COUPON_USER.COUPON_USE IS '쿠폰사용유무 O-사용O X-사용X';

commit;