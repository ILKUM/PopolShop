/* 회원 */
DROP TABLE MEMBER 
	CASCADE CONSTRAINTS;

/* 찜목록 */
DROP TABLE JJIM 
	CASCADE CONSTRAINTS;

/* 리뷰게시판 */
DROP TABLE REBOARD 
	CASCADE CONSTRAINTS;

/* 미국영화게시판 */
DROP TABLE ARMOVIE 
	CASCADE CONSTRAINTS;

/* 일본영화게시판 */
DROP TABLE JNMOVIE 
	CASCADE CONSTRAINTS;

/* 회원등급 */
DROP TABLE ROLE 
	CASCADE CONSTRAINTS;

/* 중국영화게시판 */
DROP TABLE CNMOVIE 
	CASCADE CONSTRAINTS;

/* 영화게시판 */
DROP TABLE MOVIE 
	CASCADE CONSTRAINTS;

/* 유럽영화게시판 */
DROP TABLE EUMOVIE 
	CASCADE CONSTRAINTS;

/* 공지사항 */
DROP TABLE NOTICE 
	CASCADE CONSTRAINTS;

/* 덧글 */
DROP TABLE RECOMENT 
	CASCADE CONSTRAINTS;

/* 추천게시판 */
DROP TABLE recommend 
	CASCADE CONSTRAINTS;

/* 자유게시판 */
DROP TABLE FREE 
	CASCADE CONSTRAINTS;

/* 회원 */
CREATE TABLE MEMBER (
	EMAIL VARCHAR2(100) NOT NULL, /* 아이디 */
	PWD VARCHAR2(1000) NOT NULL, /* 비밀번호 */
	IDDATE DATE DEFAULT SYSDATE NOT NULL, /* 가입날짜 */
	PROFILE VARCHAR2(100), /* 프로필 */
	NAME VARCHAR2(30) NOT NULL /* 닉네임 */
);

COMMENT ON TABLE MEMBER IS '회원';

COMMENT ON COLUMN MEMBER.EMAIL IS '아이디';

COMMENT ON COLUMN MEMBER.PWD IS '비밀번호';

COMMENT ON COLUMN MEMBER.IDDATE IS '가입날짜';

COMMENT ON COLUMN MEMBER.PROFILE IS '프로필';

COMMENT ON COLUMN MEMBER.NAME IS '닉네임';

CREATE UNIQUE INDEX PK_MEMBER
	ON MEMBER (
		EMAIL ASC
	);

ALTER TABLE MEMBER
	ADD
		CONSTRAINT PK_MEMBER
		PRIMARY KEY (
			EMAIL
		);

/* 찜목록 */
CREATE TABLE JJIM (
	JSEQ NUMBER NOT NULL, /* 찜번호 */
	EMAIL VARCHAR2(100) NOT NULL, /* 아이디 */
	MOSEQ NUMBER NOT NULL /* 영화번호 */
);

COMMENT ON TABLE JJIM IS '찜목록';

COMMENT ON COLUMN JJIM.JSEQ IS '찜번호';

COMMENT ON COLUMN JJIM.EMAIL IS '아이디';

COMMENT ON COLUMN JJIM.MOSEQ IS '영화번호';

CREATE UNIQUE INDEX PK_JJIM
	ON JJIM (
		JSEQ ASC
	);

ALTER TABLE JJIM
	ADD
		CONSTRAINT PK_JJIM
		PRIMARY KEY (
			JSEQ
		);

/* 리뷰게시판 */
CREATE TABLE REBOARD (
	RESEQ NUMBER NOT NULL, /* 리뷰글번호 */
	RETITLE VARCHAR2(100) NOT NULL, /* 리뷰글이름 */
	RETIME TIMESTAMP DEFAULT SYSTIMESTAMP NOT NULL, /* 리뷰작성시간 */
	RECONTENT VARCHAR2(1000) NOT NULL, /* 리뷰내용 */
	REPHOTO VARCHAR2(100), /* 리뷰사진 */
	EMAIL VARCHAR2(100) NOT NULL, /* 작성자 */
	RELIKE NUMBER NOT NULL /* 리뷰추천수 */
);

COMMENT ON TABLE REBOARD IS '리뷰게시판';

COMMENT ON COLUMN REBOARD.RESEQ IS '리뷰글번호';

COMMENT ON COLUMN REBOARD.RETITLE IS '리뷰글이름';

COMMENT ON COLUMN REBOARD.RETIME IS '리뷰작성시간';

COMMENT ON COLUMN REBOARD.RECONTENT IS '리뷰내용';

COMMENT ON COLUMN REBOARD.REPHOTO IS '리뷰사진';

COMMENT ON COLUMN REBOARD.EMAIL IS '작성자';

COMMENT ON COLUMN REBOARD.RELIKE IS '리뷰추천수';

CREATE UNIQUE INDEX PK_REBOARD
	ON REBOARD (
		RESEQ ASC
	);

ALTER TABLE REBOARD
	ADD
		CONSTRAINT PK_REBOARD
		PRIMARY KEY (
			RESEQ
		);

/* 미국영화게시판 */
CREATE TABLE ARMOVIE (
	ARSEQ NUMBER NOT NULL, /* 미국영화번호 */
	ARNAME VARCHAR2(100) NOT NULL, /* 미국영화이름 */
	ARCONTENT VARCHAR2(300) NOT NULL, /* 미국영화설명 */
	ARPHOTO VARCHAR2(100) NOT NULL, /* 미국영화사진 */
	ARLIKE NUMBER NOT NULL, /* 미국영화추천수 */
	ARDATE DATE DEFAULT SYSDATE NOT NULL /* 미국개봉날짜 */
);

COMMENT ON TABLE ARMOVIE IS '미국영화게시판';

COMMENT ON COLUMN ARMOVIE.ARSEQ IS '미국영화번호';

COMMENT ON COLUMN ARMOVIE.ARNAME IS '미국영화이름';

COMMENT ON COLUMN ARMOVIE.ARCONTENT IS '미국영화설명';

COMMENT ON COLUMN ARMOVIE.ARPHOTO IS '미국영화사진';

COMMENT ON COLUMN ARMOVIE.ARLIKE IS '미국영화추천수';

COMMENT ON COLUMN ARMOVIE.ARDATE IS '미국개봉날짜';

CREATE UNIQUE INDEX PK_ARMOVIE
	ON ARMOVIE (
		ARSEQ ASC
	);

ALTER TABLE ARMOVIE
	ADD
		CONSTRAINT PK_ARMOVIE
		PRIMARY KEY (
			ARSEQ
		);

/* 일본영화게시판 */
CREATE TABLE JNMOVIE (
	JNSEQ NUMBER NOT NULL, /* 일본영화번호 */
	JNNAME VARCHAR2(100) NOT NULL, /* 일본영화이름 */
	JNCONTENT VARCHAR2(300) NOT NULL, /* 일본영화설명 */
	JNPHOTO VARCHAR2(100) NOT NULL, /* 일본영화사진 */
	JNLIKE NUMBER NOT NULL, /* 일본영화추천수 */
	JNDATE DATE DEFAULT SYSDATE NOT NULL /* 일본개봉날짜 */
);

COMMENT ON TABLE JNMOVIE IS '일본영화게시판';

COMMENT ON COLUMN JNMOVIE.JNSEQ IS '일본영화번호';

COMMENT ON COLUMN JNMOVIE.JNNAME IS '일본영화이름';

COMMENT ON COLUMN JNMOVIE.JNCONTENT IS '일본영화설명';

COMMENT ON COLUMN JNMOVIE.JNPHOTO IS '일본영화사진';

COMMENT ON COLUMN JNMOVIE.JNLIKE IS '일본영화추천수';

COMMENT ON COLUMN JNMOVIE.JNDATE IS '일본개봉날짜';

CREATE UNIQUE INDEX PK_JNMOVIE
	ON JNMOVIE (
		JNSEQ ASC
	);

ALTER TABLE JNMOVIE
	ADD
		CONSTRAINT PK_JNMOVIE
		PRIMARY KEY (
			JNSEQ
		);

/* 회원등급 */
CREATE TABLE ROLE (
	EMAIL VARCHAR2(100) NOT NULL, /* 아이디 */
	RNAME VARCHAR2(30) NOT NULL /* 롤이름 */
);

COMMENT ON TABLE ROLE IS '회원등급';

COMMENT ON COLUMN ROLE.EMAIL IS '아이디';

COMMENT ON COLUMN ROLE.RNAME IS '롤이름';

/* 중국영화게시판 */
CREATE TABLE CNMOVIE (
	CNSEQ NUMBER NOT NULL, /* 중국영화번호 */
	CNNAME VARCHAR2(100) NOT NULL, /* 중국영화이름 */
	CNCONTENT VARCHAR2(300) NOT NULL, /* 중국영화설명 */
	CNPHOTO VARCHAR2(100) NOT NULL, /* 중국영화사진 */
	CNLIKE NUMBER NOT NULL, /* 중국영화추천수 */
	CNDATE DATE DEFAULT SYSDATE NOT NULL /* 중국개봉날짜 */
);

COMMENT ON TABLE CNMOVIE IS '중국영화게시판';

COMMENT ON COLUMN CNMOVIE.CNSEQ IS '중국영화번호';

COMMENT ON COLUMN CNMOVIE.CNNAME IS '중국영화이름';

COMMENT ON COLUMN CNMOVIE.CNCONTENT IS '중국영화설명';

COMMENT ON COLUMN CNMOVIE.CNPHOTO IS '중국영화사진';

COMMENT ON COLUMN CNMOVIE.CNLIKE IS '중국영화추천수';

COMMENT ON COLUMN CNMOVIE.CNDATE IS '중국개봉날짜';

CREATE UNIQUE INDEX PK_CNMOVIE
	ON CNMOVIE (
		CNSEQ ASC
	);

ALTER TABLE CNMOVIE
	ADD
		CONSTRAINT PK_CNMOVIE
		PRIMARY KEY (
			CNSEQ
		);

/* 영화게시판 */
CREATE TABLE MOVIE (
	MOSEQ NUMBER NOT NULL, /* 영화번호 */
	MONAME VARCHAR2(100) NOT NULL, /* 영화이름 */
	MOCONTENT VARCHAR2(300) NOT NULL, /* 영화설명 */
	MOPHOTO VARCHAR2(100) NOT NULL, /* 영화사진 */
	MOLIKE NUMBER NOT NULL, /* 영화추천수 */
	MODATE DATE DEFAULT SYSDATE NOT NULL, /* 개봉날짜 */
	MONUM NUMBER NOT NULL, /* 영화분류코드 */
	MODIRECTOR VARCHAR2(100) NOT NULL, /* 영화감독 */
	ISWISH NUMBER NOT NULL /* 찜여부 */
);

COMMENT ON TABLE MOVIE IS '영화게시판';

COMMENT ON COLUMN MOVIE.MOSEQ IS '영화번호';

COMMENT ON COLUMN MOVIE.MONAME IS '영화이름';

COMMENT ON COLUMN MOVIE.MOCONTENT IS '영화설명';

COMMENT ON COLUMN MOVIE.MOPHOTO IS '영화사진';

COMMENT ON COLUMN MOVIE.MOLIKE IS '영화추천수';

COMMENT ON COLUMN MOVIE.MODATE IS '개봉날짜';

COMMENT ON COLUMN MOVIE.MONUM IS '영화분류코드';

COMMENT ON COLUMN MOVIE.MODIRECTOR IS '영화감독';

COMMENT ON COLUMN MOVIE.ISWISH IS '찜여부';

CREATE UNIQUE INDEX PK_MOVIE
	ON MOVIE (
		MOSEQ ASC
	);

ALTER TABLE MOVIE
	ADD
		CONSTRAINT PK_MOVIE
		PRIMARY KEY (
			MOSEQ
		);

/* 유럽영화게시판 */
CREATE TABLE EUMOVIE (
	EUSEQ NUMBER NOT NULL, /* 유럽영화번호 */
	EUNAME VARCHAR2(100) NOT NULL, /* 유럽영화이름 */
	EUCONTENT VARCHAR2(300) NOT NULL, /* 유럽영화설명 */
	EUPHOTO VARCHAR2(100) NOT NULL, /* 유럽영화사진 */
	EULIKE NUMBER NOT NULL, /* 유럽영화추천수 */
	EUDATE DATE DEFAULT SYSDATE NOT NULL /* 유럽개봉날짜 */
);

COMMENT ON TABLE EUMOVIE IS '유럽영화게시판';

COMMENT ON COLUMN EUMOVIE.EUSEQ IS '유럽영화번호';

COMMENT ON COLUMN EUMOVIE.EUNAME IS '유럽영화이름';

COMMENT ON COLUMN EUMOVIE.EUCONTENT IS '유럽영화설명';

COMMENT ON COLUMN EUMOVIE.EUPHOTO IS '유럽영화사진';

COMMENT ON COLUMN EUMOVIE.EULIKE IS '유럽영화추천수';

COMMENT ON COLUMN EUMOVIE.EUDATE IS '유럽개봉날짜';

CREATE UNIQUE INDEX PK_EUMOVIE
	ON EUMOVIE (
		EUSEQ ASC
	);

ALTER TABLE EUMOVIE
	ADD
		CONSTRAINT PK_EUMOVIE
		PRIMARY KEY (
			EUSEQ
		);

/* 공지사항 */
CREATE TABLE NOTICE (
	NOSEQ NUMBER NOT NULL, /* 공지사항글번호 */
	NOTITLE VARCHAR2(100) NOT NULL, /* 공지사항이름 */
	NOCONTENT VARCHAR2(1000) NOT NULL, /* 공지사항내용 */
	NOTIME TIMESTAMP DEFAULT SYSTIMESTAMP NOT NULL, /* 공지사항작성시간 */
	NWRITER VARCHAR2(100) NOT NULL /* 공지사항작성자 */
);

COMMENT ON TABLE NOTICE IS '공지사항';

COMMENT ON COLUMN NOTICE.NOSEQ IS '공지사항글번호';

COMMENT ON COLUMN NOTICE.NOTITLE IS '공지사항이름';

COMMENT ON COLUMN NOTICE.NOCONTENT IS '공지사항내용';

COMMENT ON COLUMN NOTICE.NOTIME IS '공지사항작성시간';

COMMENT ON COLUMN NOTICE.NWRITER IS '공지사항작성자';

CREATE UNIQUE INDEX PK_NOTICE
	ON NOTICE (
		NOSEQ ASC
	);

ALTER TABLE NOTICE
	ADD
		CONSTRAINT PK_NOTICE
		PRIMARY KEY (
			NOSEQ
		);

/* 덧글 */
CREATE TABLE RECOMENT (
	RSEQ NUMBER NOT NULL, /* 덧글번호 */
	RCONTENT VARCHAR2(1000) NOT NULL, /* 덧글내용 */
	RTIME TIMESTAMP DEFAULT SYSTIMESTAMP NOT NULL, /* 덧글작성시간 */
	EMAIL VARCHAR2(100) NOT NULL, /* 댓글작성자 */
	FSEQ NUMBER NOT NULL, /* 질문글번호 */
	MOSEQ NUMBER NOT NULL, /* 영화번호 */
	RESEQ NUMBER NOT NULL, /* 리뷰글번호 */
	RCSEQ NUMBER NOT NULL /* 추천글번호 */
);

COMMENT ON TABLE RECOMENT IS '덧글';

COMMENT ON COLUMN RECOMENT.RSEQ IS '덧글번호';

COMMENT ON COLUMN RECOMENT.RCONTENT IS '덧글내용';

COMMENT ON COLUMN RECOMENT.RTIME IS '덧글작성시간';

COMMENT ON COLUMN RECOMENT.EMAIL IS '댓글작성자';

COMMENT ON COLUMN RECOMENT.FSEQ IS '질문글번호';

COMMENT ON COLUMN RECOMENT.MOSEQ IS '영화번호';

COMMENT ON COLUMN RECOMENT.RESEQ IS '리뷰글번호';

COMMENT ON COLUMN RECOMENT.RCSEQ IS '추천글번호';

CREATE UNIQUE INDEX PK_RECOMENT
	ON RECOMENT (
		RSEQ ASC
	);

ALTER TABLE RECOMENT
	ADD
		CONSTRAINT PK_RECOMENT
		PRIMARY KEY (
			RSEQ
		);

/* 추천게시판 */
CREATE TABLE recommend (
	RCSEQ NUMBER NOT NULL, /* 추천글번호 */
	RCTITLE VARCHAR2(100) NOT NULL, /* 추천글제목 */
	RCCONTENT VARCHAR2(1000) NOT NULL, /* 추천글내용 */
	RCPHOTO VARCHAR2(100) NOT NULL, /* 추천글사진 */
	EMAIL VARCHAR2(100) NOT NULL, /* 작성자 */
	RCTIME TIMESTAMP DEFAULT SYSTIMESTAMP NOT NULL, /* 추천작성시간 */
	RCLIKE NUMBER NOT NULL /* 추천수 */
);

COMMENT ON TABLE recommend IS '추천게시판';

COMMENT ON COLUMN recommend.RCSEQ IS '추천글번호';

COMMENT ON COLUMN recommend.RCTITLE IS '추천글제목';

COMMENT ON COLUMN recommend.RCCONTENT IS '추천글내용';

COMMENT ON COLUMN recommend.RCPHOTO IS '추천글사진';

COMMENT ON COLUMN recommend.EMAIL IS '작성자';

COMMENT ON COLUMN recommend.RCTIME IS '추천작성시간';

COMMENT ON COLUMN recommend.RCLIKE IS '추천수';

CREATE UNIQUE INDEX PK_recommend
	ON recommend (
		RCSEQ ASC
	);

ALTER TABLE recommend
	ADD
		CONSTRAINT PK_recommend
		PRIMARY KEY (
			RCSEQ
		);

/* 자유게시판 */
CREATE TABLE FREE (
	FSEQ NUMBER NOT NULL, /* 질문글번호 */
	FTITLE VARCHAR2(100) NOT NULL, /* 질문제목 */
	FCONTENT VARCHAR2(1000) NOT NULL, /* 질문내용 */
	FTIME TIMESTAMP NOT NULL /* 질문작성시간 */
);

COMMENT ON TABLE FREE IS '자유게시판';

COMMENT ON COLUMN FREE.FSEQ IS '질문글번호';

COMMENT ON COLUMN FREE.FTITLE IS '질문제목';

COMMENT ON COLUMN FREE.FCONTENT IS '질문내용';

COMMENT ON COLUMN FREE.FTIME IS '질문작성시간';

CREATE UNIQUE INDEX PK_FREE
	ON FREE (
		FSEQ ASC
	);

ALTER TABLE FREE
	ADD
		CONSTRAINT PK_FREE
		PRIMARY KEY (
			FSEQ
		);

ALTER TABLE JJIM
	ADD
		CONSTRAINT FK_MEMBER_TO_JJIM
		FOREIGN KEY (
			EMAIL
		)
		REFERENCES MEMBER (
			EMAIL
		)ON DELETE CASCADE;

ALTER TABLE JJIM
	ADD
		CONSTRAINT FK_MOVIE_TO_JJIM
		FOREIGN KEY (
			MOSEQ
		)
		REFERENCES MOVIE (
			MOSEQ
		)ON DELETE CASCADE;

ALTER TABLE REBOARD
	ADD
		CONSTRAINT FK_MEMBER_TO_REBOARD
		FOREIGN KEY (
			EMAIL
		)
		REFERENCES MEMBER (
			EMAIL
		)ON DELETE CASCADE;

ALTER TABLE ROLE
	ADD
		CONSTRAINT FK_MEMBER_TO_ROLE
		FOREIGN KEY (
			EMAIL
		)
		REFERENCES MEMBER (
			EMAIL
		)ON DELETE CASCADE;

ALTER TABLE RECOMENT
	ADD
		CONSTRAINT FK_MEMBER_TO_RECOMENT
		FOREIGN KEY (
			EMAIL
		)
		REFERENCES MEMBER (
			EMAIL
		)ON DELETE CASCADE;

ALTER TABLE RECOMENT
	ADD
		CONSTRAINT FK_FREE_TO_RECOMENT
		FOREIGN KEY (
			FSEQ
		)
		REFERENCES FREE (
			FSEQ
		)ON DELETE CASCADE;

ALTER TABLE RECOMENT
	ADD
		CONSTRAINT FK_MOVIE_TO_RECOMENT
		FOREIGN KEY (
			MOSEQ
		)
		REFERENCES MOVIE (
			MOSEQ
		)ON DELETE CASCADE;

ALTER TABLE RECOMENT
	ADD
		CONSTRAINT FK_REBOARD_TO_RECOMENT
		FOREIGN KEY (
			RESEQ
		)
		REFERENCES REBOARD (
			RESEQ
		)ON DELETE CASCADE;

ALTER TABLE RECOMENT
	ADD
		CONSTRAINT FK_recommend_TO_RECOMENT
		FOREIGN KEY (
			RCSEQ
		)
		REFERENCES recommend (
			RCSEQ
		)ON DELETE CASCADE;

ALTER TABLE recommend
	ADD
		CONSTRAINT FK_MEMBER_TO_recommend
		FOREIGN KEY (
			EMAIL
		)
		REFERENCES MEMBER (
			EMAIL
		)ON DELETE CASCADE;       
 
  --영화 시퀀스   
  CREATE SEQUENCE MOSEQ_NOVIE_SEQ
 START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCYCLE;
  
 --공지사항 시퀀스   
  CREATE SEQUENCE NOSEQ_NOTICE_SEQ
 START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCYCLE;
 
  --덧글 시퀀스  
  CREATE SEQUENCE RSEQ_RECOMENT_SEQ
 START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCYCLE;

 --찜목록 시퀀스   
  CREATE SEQUENCE JSEQ_JJIM_SEQ
 START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCYCLE;
  
  --리뷰게시판 시퀀스  
  CREATE SEQUENCE RESEQ_REBOARD_SEQ
 START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCYCLE;
  
  --추천게시판 시퀀스 
  CREATE SEQUENCE RCSEQ_RCOMMEND_SEQ
 START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCYCLE;
  
    --자유게시판 시퀀스 
  CREATE SEQUENCE FSEQ_FREE_SEQ
 START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCYCLE;
 
 --롤 트리거 
  create or replace trigger insert_tri_role
after insert on member
for each row
BEGIN
  insert INTO role VALUES (:NEW.email, 'ROLE_USER');
END;
