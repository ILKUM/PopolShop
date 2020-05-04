/* 회원 */
DROP TABLE MEMBER 
	CASCADE CONSTRAINTS;

/* 찜목록 */
DROP TABLE JJIM 
	CASCADE CONSTRAINTS;

/* 리뷰게시판 */
DROP TABLE REBOARD 
	CASCADE CONSTRAINTS;

/* 회원등급 */
DROP TABLE ROLE 
	CASCADE CONSTRAINTS;

/* 영화게시판 */
DROP TABLE MOVIE 
	CASCADE CONSTRAINTS;

/* 공지사항 */
DROP TABLE NOTICE 
	CASCADE CONSTRAINTS;

/* 추천게시판 */
DROP TABLE recommend 
	CASCADE CONSTRAINTS;

/* 추천리뷰글 */
DROP TABLE REVIEWMEM 
	CASCADE CONSTRAINTS;

/* 추천글 */
DROP TABLE RECOMMEM 
	CASCADE CONSTRAINTS;

/* 조회 기록 */
DROP TABLE HISTORY 
	CASCADE CONSTRAINTS;

/* 리뷰글덧글 */
DROP TABLE RVREPLY 
	CASCADE CONSTRAINTS;

/* 영화덧글 */
DROP TABLE MOREPLY 
	CASCADE CONSTRAINTS;

/* 리뷰글덧글2 */
DROP TABLE RCREPLY 
	CASCADE CONSTRAINTS;

/* 회원 */
CREATE TABLE MEMBER (
	EMAIL VARCHAR2(100) NOT NULL, /* 아이디 */
	PWD VARCHAR2(1000) NOT NULL, /* 비밀번호 */
	IDDATE DATE DEFAULT SYSDATE NOT NULL, /* 가입날짜 */
	PROFILE VARCHAR2(100), /* 프로필 */
	NAME VARCHAR2(30) NOT NULL, /* 닉네임 */
	POINT NUMBER NOT NULL, /* 포인트 */
	CPOINT NUMBER NOT NULL /* 쿠폰여부 */
);

COMMENT ON TABLE MEMBER IS '회원';

COMMENT ON COLUMN MEMBER.EMAIL IS '아이디';

COMMENT ON COLUMN MEMBER.PWD IS '비밀번호';

COMMENT ON COLUMN MEMBER.IDDATE IS '가입날짜';

COMMENT ON COLUMN MEMBER.PROFILE IS '프로필';

COMMENT ON COLUMN MEMBER.NAME IS '닉네임';

COMMENT ON COLUMN MEMBER.POINT IS '포인트';

COMMENT ON COLUMN MEMBER.CPOINT IS '쿠폰여부';

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
	RETIME DATE DEFAULT SYSDATE NOT NULL, /* 리뷰작성시간 */
	RECONTENT VARCHAR2(1000) NOT NULL, /* 리뷰내용 */
	REPHOTO VARCHAR2(100), /* 리뷰사진 */
	EMAIL VARCHAR2(100) NOT NULL, /* 작성자 */
	RELIKE NUMBER NOT NULL, /* 리뷰추천수 */
	RERNUM NUMBER NOT NULL /* 리뷰조회수 */
);

COMMENT ON TABLE REBOARD IS '리뷰게시판';

COMMENT ON COLUMN REBOARD.RESEQ IS '리뷰글번호';

COMMENT ON COLUMN REBOARD.RETITLE IS '리뷰글이름';

COMMENT ON COLUMN REBOARD.RETIME IS '리뷰작성시간';

COMMENT ON COLUMN REBOARD.RECONTENT IS '리뷰내용';

COMMENT ON COLUMN REBOARD.REPHOTO IS '리뷰사진';

COMMENT ON COLUMN REBOARD.EMAIL IS '작성자';

COMMENT ON COLUMN REBOARD.RELIKE IS '리뷰추천수';

COMMENT ON COLUMN REBOARD.RERNUM IS '리뷰조회수';

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

/* 회원등급 */
CREATE TABLE ROLE (
	EMAIL VARCHAR2(100) NOT NULL, /* 아이디 */
	RNAME VARCHAR2(30) NOT NULL /* 롤이름 */
);

COMMENT ON TABLE ROLE IS '회원등급';

COMMENT ON COLUMN ROLE.EMAIL IS '아이디';

COMMENT ON COLUMN ROLE.RNAME IS '롤이름';

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
	ISWISH NUMBER NOT NULL, /* 찜여부 */
	MPOINT NUMBER NOT NULL /* 가격포인트 */
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

COMMENT ON COLUMN MOVIE.MPOINT IS '가격포인트';

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

/* 공지사항 */
CREATE TABLE NOTICE (
	NOSEQ NUMBER NOT NULL, /* 공지사항글번호 */
	NOTITLE VARCHAR2(100) NOT NULL, /* 공지사항이름 */
	NOCONTENT VARCHAR2(1000) NOT NULL, /* 공지사항내용 */
	NOTIME DATE DEFAULT SYSDATE NOT NULL, /* 공지사항작성시간 */
	NRNUM NUMBER NOT NULL, /* 공지조회수 */
	EMAIL VARCHAR2(100) NOT NULL /* 아이디 */
);

COMMENT ON TABLE NOTICE IS '공지사항';

COMMENT ON COLUMN NOTICE.NOSEQ IS '공지사항글번호';

COMMENT ON COLUMN NOTICE.NOTITLE IS '공지사항이름';

COMMENT ON COLUMN NOTICE.NOCONTENT IS '공지사항내용';

COMMENT ON COLUMN NOTICE.NOTIME IS '공지사항작성시간';

COMMENT ON COLUMN NOTICE.NRNUM IS '공지조회수';

COMMENT ON COLUMN NOTICE.EMAIL IS '아이디';

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

/* 추천게시판 */
CREATE TABLE recommend (
	RCSEQ NUMBER NOT NULL, /* 추천글번호 */
	RCTITLE VARCHAR2(100) NOT NULL, /* 추천글제목 */
	RCCONTENT VARCHAR2(1000) NOT NULL, /* 추천글내용 */
	RCPHOTO VARCHAR2(100) NOT NULL, /* 추천글사진 */
	EMAIL VARCHAR2(100) NOT NULL, /* 작성자 */
	RCTIME DATE DEFAULT SYSDATE NOT NULL, /* 추천작성시간 */
	RCLIKE NUMBER NOT NULL, /* 추천수 */
	RCRNUM NUMBER NOT NULL /* 추천글조회수 */
);

COMMENT ON TABLE recommend IS '추천게시판';

COMMENT ON COLUMN recommend.RCSEQ IS '추천글번호';

COMMENT ON COLUMN recommend.RCTITLE IS '추천글제목';

COMMENT ON COLUMN recommend.RCCONTENT IS '추천글내용';

COMMENT ON COLUMN recommend.RCPHOTO IS '추천글사진';

COMMENT ON COLUMN recommend.EMAIL IS '작성자';

COMMENT ON COLUMN recommend.RCTIME IS '추천작성시간';

COMMENT ON COLUMN recommend.RCLIKE IS '추천수';

COMMENT ON COLUMN recommend.RCRNUM IS '추천글조회수';

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

/* 추천리뷰글 */
CREATE TABLE REVIEWMEM (
	RVSEQ NUMBER NOT NULL, /* 추천멤버시퀀스 */
	EMAIL VARCHAR2(100) NOT NULL, /* 아이디 */
	RESEQ NUMBER NOT NULL /* 리뷰글번호 */
);

COMMENT ON TABLE REVIEWMEM IS '추천리뷰글';

COMMENT ON COLUMN REVIEWMEM.RVSEQ IS '추천멤버시퀀스';

COMMENT ON COLUMN REVIEWMEM.EMAIL IS '아이디';

COMMENT ON COLUMN REVIEWMEM.RESEQ IS '리뷰글번호';

CREATE UNIQUE INDEX PK_REVIEWMEM
	ON REVIEWMEM (
		RVSEQ ASC
	);

ALTER TABLE REVIEWMEM
	ADD
		CONSTRAINT PK_REVIEWMEM
		PRIMARY KEY (
			RVSEQ
		);

/* 추천글 */
CREATE TABLE RECOMMEM (
	RLSEQ NUMBER NOT NULL, /* 추천시퀀스 */
	EMAIL VARCHAR2(100) NOT NULL, /* 아이디 */
	RCSEQ NUMBER NOT NULL /* 추천글번호 */
);

COMMENT ON TABLE RECOMMEM IS '추천글';

COMMENT ON COLUMN RECOMMEM.RLSEQ IS '추천시퀀스';

COMMENT ON COLUMN RECOMMEM.EMAIL IS '아이디';

COMMENT ON COLUMN RECOMMEM.RCSEQ IS '추천글번호';

CREATE UNIQUE INDEX PK_RECOMMEM
	ON RECOMMEM (
		RLSEQ ASC
	);

ALTER TABLE RECOMMEM
	ADD
		CONSTRAINT PK_RECOMMEM
		PRIMARY KEY (
			RLSEQ
		);

/* 조회 기록 */
CREATE TABLE HISTORY (
	HSEQ NUMBER NOT NULL, /* 지난기록번호 */
	EMAIL VARCHAR2(100) NOT NULL, /* 아이디 */
	MOSEQ NUMBER NOT NULL /* 영화번호 */
);

COMMENT ON TABLE HISTORY IS '조회 기록';

COMMENT ON COLUMN HISTORY.HSEQ IS '지난기록번호';

COMMENT ON COLUMN HISTORY.EMAIL IS '아이디';

COMMENT ON COLUMN HISTORY.MOSEQ IS '영화번호';

CREATE UNIQUE INDEX PK_HISTORY
	ON HISTORY (
		HSEQ ASC
	);

ALTER TABLE HISTORY
	ADD
		CONSTRAINT PK_HISTORY
		PRIMARY KEY (
			HSEQ
		);

/* 리뷰글덧글 */
CREATE TABLE RVREPLY (
	RVRSEQ NUMBER NOT NULL, /* 리뷰덧글번호 */
	RVRCONTENT VARCHAR2(1000) NOT NULL, /* 리뷰덧글내용 */
	RVRTIME DATE NOT NULL, /* 리뷰덧글작성시간 */
	EMAIL VARCHAR2(100) NOT NULL, /* 작성자 */
	RESEQ NUMBER NOT NULL /* 리뷰글번호 */
);

COMMENT ON TABLE RVREPLY IS '리뷰글덧글';

COMMENT ON COLUMN RVREPLY.RVRSEQ IS '리뷰덧글번호';

COMMENT ON COLUMN RVREPLY.RVRCONTENT IS '리뷰덧글내용';

COMMENT ON COLUMN RVREPLY.RVRTIME IS '리뷰덧글작성시간';

COMMENT ON COLUMN RVREPLY.EMAIL IS '작성자';

COMMENT ON COLUMN RVREPLY.RESEQ IS '리뷰글번호';

CREATE UNIQUE INDEX PK_RVREPLY
	ON RVREPLY (
		RVRSEQ ASC
	);

ALTER TABLE RVREPLY
	ADD
		CONSTRAINT PK_RVREPLY
		PRIMARY KEY (
			RVRSEQ
		);

/* 영화덧글 */
CREATE TABLE MOREPLY (
	MORSEQ NUMBER NOT NULL, /* 영화덧글번호 */
	MORCONTENT VARCHAR2 NOT NULL, /* 영화덧글내용 */
	MORTIME DATE NOT NULL, /* 영화덧글작성시간 */
	EMAIL VARCHAR2(100) NOT NULL, /* 작성자 */
	MOSEQ NUMBER NOT NULL /* 영화번호 */
);

COMMENT ON TABLE MOREPLY IS '영화덧글';

COMMENT ON COLUMN MOREPLY.MORSEQ IS '영화덧글번호';

COMMENT ON COLUMN MOREPLY.MORCONTENT IS '영화덧글내용';

COMMENT ON COLUMN MOREPLY.MORTIME IS '영화덧글작성시간';

COMMENT ON COLUMN MOREPLY.EMAIL IS '작성자';

COMMENT ON COLUMN MOREPLY.MOSEQ IS '영화번호';

CREATE UNIQUE INDEX PK_MOREPLY
	ON MOREPLY (
		MORSEQ ASC
	);

ALTER TABLE MOREPLY
	ADD
		CONSTRAINT PK_MOREPLY
		PRIMARY KEY (
			MORSEQ
		);

/* 리뷰글덧글2 */
CREATE TABLE RCREPLY (
	RCRSEQ NUMBER NOT NULL, /* 리뷰덧글번호 */
	RCRCONTENT VARCHAR2 NOT NULL, /* 리뷰덧글내용 */
	RCRTIME DATE NOT NULL, /* 리뷰덧글작성시간 */
	EMAIL VARCHAR2(100) NOT NULL, /* 작성자 */
	RCSEQ NUMBER NOT NULL /* 리뷰글번호 */
);

COMMENT ON TABLE RCREPLY IS '리뷰글덧글2';

COMMENT ON COLUMN RCREPLY.RCRSEQ IS '리뷰덧글번호';

COMMENT ON COLUMN RCREPLY.RCRCONTENT IS '리뷰덧글내용';

COMMENT ON COLUMN RCREPLY.RCRTIME IS '리뷰덧글작성시간';

COMMENT ON COLUMN RCREPLY.EMAIL IS '작성자';

COMMENT ON COLUMN RCREPLY.RCSEQ IS '리뷰글번호';

CREATE UNIQUE INDEX PK_RCREPLY
	ON RCREPLY (
		RCRSEQ ASC
	);

ALTER TABLE RCREPLY
	ADD
		CONSTRAINT PK_RCREPLY
		PRIMARY KEY (
			RCRSEQ
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

ALTER TABLE NOTICE
	ADD
		CONSTRAINT FK_MEMBER_TO_NOTICE
		FOREIGN KEY (
			EMAIL
		)
		REFERENCES MEMBER (
			EMAIL
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

ALTER TABLE REVIEWMEM
	ADD
		CONSTRAINT FK_MEMBER_TO_REVIEWMEM
		FOREIGN KEY (
			EMAIL
		)
		REFERENCES MEMBER (
			EMAIL
		)ON DELETE CASCADE;

ALTER TABLE REVIEWMEM
	ADD
		CONSTRAINT FK_REBOARD_TO_REVIEWMEM
		FOREIGN KEY (
			RESEQ
		)
		REFERENCES REBOARD (
			RESEQ
		)ON DELETE CASCADE;

ALTER TABLE RECOMMEM
	ADD
		CONSTRAINT FK_MEMBER_TO_RECOMMEM
		FOREIGN KEY (
			EMAIL
		)
		REFERENCES MEMBER (
			EMAIL
		)ON DELETE CASCADE;

ALTER TABLE RECOMMEM
	ADD
		CONSTRAINT FK_recommend_TO_RECOMMEM
		FOREIGN KEY (
			RCSEQ
		)
		REFERENCES recommend (
			RCSEQ
		)ON DELETE CASCADE;

ALTER TABLE HISTORY
	ADD
		CONSTRAINT FK_MEMBER_TO_HISTORY
		FOREIGN KEY (
			EMAIL
		)
		REFERENCES MEMBER (
			EMAIL
		)ON DELETE CASCADE;

ALTER TABLE HISTORY
	ADD
		CONSTRAINT FK_MOVIE_TO_HISTORY
		FOREIGN KEY (
			MOSEQ
		)
		REFERENCES MOVIE (
			MOSEQ
		)ON DELETE CASCADE;

ALTER TABLE RVREPLY
	ADD
		CONSTRAINT FK_MEMBER_TO_RVREPLY
		FOREIGN KEY (
			EMAIL
		)
		REFERENCES MEMBER (
			EMAIL
		)ON DELETE CASCADE;

ALTER TABLE RVREPLY
	ADD
		CONSTRAINT FK_REBOARD_TO_RVREPLY
		FOREIGN KEY (
			RESEQ
		)
		REFERENCES REBOARD (
			RESEQ
		)ON DELETE CASCADE;

ALTER TABLE MOREPLY
	ADD
		CONSTRAINT FK_MEMBER_TO_MOREPLY
		FOREIGN KEY (
			EMAIL
		)
		REFERENCES MEMBER (
			EMAIL
		)ON DELETE CASCADE;

ALTER TABLE MOREPLY
	ADD
		CONSTRAINT FK_MOVIE_TO_MOREPLY
		FOREIGN KEY (
			MOSEQ
		)
		REFERENCES MOVIE (
			MOSEQ
		)ON DELETE CASCADE;

ALTER TABLE RCREPLY
	ADD
		CONSTRAINT FK_recommend_TO_RCREPLY
		FOREIGN KEY (
			RCSEQ
		)
		REFERENCES recommend (
			RCSEQ
		)ON DELETE CASCADE;

ALTER TABLE RCREPLY
	ADD
		CONSTRAINT FK_MEMBER_TO_RCREPLY
		FOREIGN KEY (
			EMAIL
		)
		REFERENCES MEMBER (
			EMAIL
		)ON DELETE CASCADE;
   
--추천글 시퀀스
CREATE SEQUENCE RCSEQ_RECOMMED_SEQ
 START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCYCLE;		
		
--찜 목록 시퀀스
CREATE SEQUENCE JSEQ_JJIM_SEQ
 START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCYCLE;
		
--영화 시퀀스
CREATE SEQUENCE MOSEQ_MOVIE_SEQ
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
  
--추천번호 시퀀스 
  CREATE SEQUENCE RLSEQ_RECOMMEM_SEQ
 START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCYCLE;
  
  --리뷰 추천멤버 시퀀스
   CREATE SEQUENCE RVSEQ_REVIEWMEM_SEQ
 START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCYCLE;
  
  --히스토리 시퀀스
  CREATE SEQUENCE HSEQ_HISTORY_SEQ
 START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCYCLE;
  
  CREATE SEQUENCE RCRSEQ_RCREPLY_SEQ
 START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCYCLE;
  
  --영화 덧글번호  
CREATE SEQUENCE MORSEQ_MOREPLY_SEQ
 START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCYCLE;
  
 --리뷰글 덧글번호         
CREATE SEQUENCE RVRSEQ_RVREPLY_SEQ
 START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCYCLE;
  
  --멤버 등급 트리거
    create or replace trigger insert_tri_role
after insert on member
for each row
BEGIN
  insert INTO role VALUES (:NEW.email, 'ROLE_USER');
END;