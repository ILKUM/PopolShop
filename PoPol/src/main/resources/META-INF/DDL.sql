﻿/* 맴버 */
DROP TABLE Member 
	CASCADE CONSTRAINTS;

/* 로그인 종류 */
DROP TABLE LOGIN 
	CASCADE CONSTRAINTS;

/* 팀프로젝트 */
DROP TABLE TEAMPJT 
	CASCADE CONSTRAINTS;

/* 팀이슈 */
DROP TABLE TISSUE 
	CASCADE CONSTRAINTS;

/* 개인이슈 */
DROP TABLE MYISSUE 
	CASCADE CONSTRAINTS;

/* 의사결정 */
DROP TABLE VOTE 
	CASCADE CONSTRAINTS;

/* 알림 설정 */
DROP TABLE SETTING 
	CASCADE CONSTRAINTS;

/* 프로젝트 공지사항 */
DROP TABLE PJNOTICE 
	CASCADE CONSTRAINTS;

/* 팀캘린더 */
DROP TABLE TCALENDAR 
	CASCADE CONSTRAINTS;

/* 댓글 */
DROP TABLE REPLY 
	CASCADE CONSTRAINTS;

/* 개인 캘린더 */
DROP TABLE MYCALENDAR 
	CASCADE CONSTRAINTS;

/* 개인 링크 */
DROP TABLE MYLINK 
	CASCADE CONSTRAINTS;

/* 팀 링크 */
DROP TABLE TLINK 
	CASCADE CONSTRAINTS;

/* 숨김회원 */
DROP TABLE HIDEMEMBER 
	CASCADE CONSTRAINTS;

/* 팀프로잭트 맴버 */
DROP TABLE TPMEMBER 
	CASCADE CONSTRAINTS;

/* 의사결정 맴버 */
DROP TABLE VOTEMEMBER 
	CASCADE CONSTRAINTS;

/* 전체 공지사항 */
DROP TABLE NOTICE 
	CASCADE CONSTRAINTS;

/* 롤 */
DROP TABLE ROLE 
	CASCADE CONSTRAINTS;

/* 댓글알림 */
DROP TABLE replyAlert 
	CASCADE CONSTRAINTS;

/* 파일 드라이브 */
DROP TABLE FILEDRIVE 
	CASCADE CONSTRAINTS;

/* 프로잭트 등급 */
DROP TABLE PJRANK 
	CASCADE CONSTRAINTS;

/* 공지사항 알림 */
DROP TABLE PNALERT 
	CASCADE CONSTRAINTS;

/* 팀이슈알림 */
DROP TABLE TIAlert 
	CASCADE CONSTRAINTS;

/* 댓글알림2 */
DROP TABLE VOTEAlert 
	CASCADE CONSTRAINTS;

/* 팀멘션리스트 */
DROP TABLE TEAMMENTION 
	CASCADE CONSTRAINTS;

/* 북마크 */
DROP TABLE BOOKMARK 
	CASCADE CONSTRAINTS;

/* 개인파일드라이브 */
DROP TABLE PFILEDRIVE 
	CASCADE CONSTRAINTS;

/* 개인구글드라이브 */
DROP TABLE PGOOGLEDRIVE 
	CASCADE CONSTRAINTS;

/* 팀구글드라이브 */
DROP TABLE TEAMGOOGLEDRIVE 
	CASCADE CONSTRAINTS;

/* 팀할일주기 */
DROP TABLE TEAMDOWORK 
	CASCADE CONSTRAINTS;

/* 개인할일 */
DROP TABLE PDOWORK 
	CASCADE CONSTRAINTS;

/* 개인멘션리스트 */
DROP TABLE PMENTION 
	CASCADE CONSTRAINTS;

/* 알림 */
DROP TABLE SETTING
	CASCADE CONSTRAINTS;
/* 맴버 */
CREATE TABLE Member (
	email VARCHAR2(100) NOT NULL, /* 이메일 */
	pwd VARCHAR2(1000) NOT NULL, /* 비밀번호 */
	name VARCHAR2(30) NOT NULL, /* 이름 */
	dname VARCHAR(30), /* 부서 */
	drank VARCHAR2(30), /* 직함 */
	address VARCHAR2(300), /* 주소 */
	idtime TIMESTAMP NOT NULL, /* 계정생성날짜 */
	loginnum NUMBER NOT NULL, /* 로그인 종류 번호 */
	profile VARCHAR2(300) /* 프로필 */
);

COMMENT ON TABLE Member IS '맴버';

COMMENT ON COLUMN Member.email IS '이메일';

COMMENT ON COLUMN Member.pwd IS '비밀번호';

COMMENT ON COLUMN Member.name IS '이름';

COMMENT ON COLUMN Member.dname IS '부서';

COMMENT ON COLUMN Member.drank IS '직함';

COMMENT ON COLUMN Member.address IS '주소';

COMMENT ON COLUMN Member.idtime IS '계정생성날짜';

COMMENT ON COLUMN Member.loginnum IS '로그인 종류 번호';

COMMENT ON COLUMN Member.profile IS '프로필';

CREATE UNIQUE INDEX PK_Member
	ON Member (
		email ASC
	);

ALTER TABLE Member
	ADD
		CONSTRAINT PK_Member
		PRIMARY KEY (
			email
		);

/* 로그인 종류 */
CREATE TABLE LOGIN (
	LOGINNUM NUMBER NOT NULL, /* 로그인 종류 번호 */
	loginname VARCHAR2(20) NOT NULL /* 로그인 종류이름 */
);

COMMENT ON TABLE LOGIN IS '로그인 종류';

COMMENT ON COLUMN LOGIN.LOGINNUM IS '로그인 종류 번호';

COMMENT ON COLUMN LOGIN.loginname IS '로그인 종류이름';

CREATE UNIQUE INDEX PK_LOGIN
	ON LOGIN (
		LOGINNUM ASC
	);

ALTER TABLE LOGIN
	ADD
		CONSTRAINT PK_LOGIN
		PRIMARY KEY (
			LOGINNUM
		);

/* 팀프로젝트 */
CREATE TABLE TEAMPJT (
	tseq NUMBER NOT NULL, /* 프로젝트 번호 */
	email VARCHAR2(100) NOT NULL, /* 이메일 */
	pname VARCHAR2(300) NOT NULL, /* 프로젝트이름 */
	pcontent VARCHAR2(300) NOT NULL, /* 프로젝트설명 */
	ptime TIMESTAMP DEFAULT SYSTIMESTAMP NOT NULL, /* 생성날짜 */
	istpalarm NUMBER NOT NULL, /* 알림여부 */
	ischarge NUMBER NOT NULL /* 유료여부 */
);

COMMENT ON TABLE TEAMPJT IS '팀프로젝트';

COMMENT ON COLUMN TEAMPJT.tseq IS '프로젝트 번호';

COMMENT ON COLUMN TEAMPJT.email IS '이메일';

COMMENT ON COLUMN TEAMPJT.pname IS '프로젝트이름';

COMMENT ON COLUMN TEAMPJT.pcontent IS '프로젝트설명';

COMMENT ON COLUMN TEAMPJT.ptime IS '생성날짜';

COMMENT ON COLUMN TEAMPJT.istpalarm IS '알림여부';

COMMENT ON COLUMN TEAMPJT.ischarge IS '유료여부';

CREATE UNIQUE INDEX PK_TEAMPJT
	ON TEAMPJT (
		tseq ASC
	);

ALTER TABLE TEAMPJT
	ADD
		CONSTRAINT PK_TEAMPJT
		PRIMARY KEY (
			tseq
		);

/* 팀이슈 */
CREATE TABLE TISSUE (
	tiseq NUMBER NOT NULL, /* 팀이슈번호 */
	tseq NUMBER NOT NULL, /* 프로젝트 번호 */
	email VARCHAR2(100) NOT NULL, /* 이메일 */
	tititle VARCHAR2(100) NOT NULL, /* 팀일정제목 */
	ticontent VARCHAR2(4000) NOT NULL, /* 팀일정내용 */
	tistart TIMESTAMP DEFAULT SYSTIMESTAMP, /* 시작날짜 */
	tiend TIMESTAMP DEFAULT SYSTIMESTAMP, /* 종료날짜 */
	isprocess VARCHAR2(13) NOT NULL, /* 진행과정 */
	istbook NUMBER NOT NULL, /* 북마크여부 */
	issee NUMBER NOT NULL, /* 확인여부 */
	tidate TIMESTAMP DEFAULT SYSTIMESTAMP NOT NULL, /* 팀이슈 작성시간 */
	turl VARCHAR2(1000), /* 팀링크 */
	BACKGROUNDCOLOR VARCHAR2(100) DEFAULT '#3a87ad' NULL, /* 배경색 */
	TEXTCOLOR VARCHAR2(100) NULL, /* 글자색깔 */
	ALLDAY NUMBER NULL /* 하루종일여부 */
);

COMMENT ON TABLE TISSUE IS '팀이슈';

COMMENT ON COLUMN TISSUE.tiseq IS '팀이슈번호';

COMMENT ON COLUMN TISSUE.tseq IS '프로젝트 번호';

COMMENT ON COLUMN TISSUE.email IS '이메일';

COMMENT ON COLUMN TISSUE.tititle IS '팀일정제목';

COMMENT ON COLUMN TISSUE.ticontent IS '팀일정내용';

COMMENT ON COLUMN TISSUE.tistart IS '시작날짜';

COMMENT ON COLUMN TISSUE.tiend IS '종료날짜';

COMMENT ON COLUMN TISSUE.isprocess IS '진행과정';

COMMENT ON COLUMN TISSUE.istbook IS '북마크여부';

COMMENT ON COLUMN TISSUE.issee IS '확인여부';

COMMENT ON COLUMN TISSUE.tidate IS '팀이슈 작성시간';

COMMENT ON COLUMN TISSUE.turl IS '팀링크';

COMMENT ON COLUMN TISSUE.BACKGROUNDCOLOR IS '배경색';

COMMENT ON COLUMN TISSUE.TEXTCOLOR IS '글자색깔';

COMMENT ON COLUMN TISSUE.ALLDAY IS '하루종일여부';

CREATE UNIQUE INDEX PK_TISSUE
	ON TISSUE (
		tiseq ASC
	);

ALTER TABLE TISSUE
	ADD
		CONSTRAINT PK_TISSUE
		PRIMARY KEY (
			tiseq
		);

/* 개인이슈 */
CREATE TABLE MYISSUE (
	piseq NUMBER NOT NULL, /* 개인이슈번호 */
	pititle VARCHAR2(300) NOT NULL, /* 개인이슈제목 */
	picontent VARCHAR2(4000) NOT NULL, /* 개인이슈내용 */
	pistart TIMESTAMP DEFAULT SYSTIMESTAMP, /* 시작날짜 */
	piend TIMESTAMP DEFAULT SYSTIMESTAMP, /* 종료날짜 */
	ispibook NUMBER NOT NULL, /* 북마크여부 */
	email VARCHAR2(100) NOT NULL, /* 이메일 */
	pidate TIMESTAMP DEFAULT SYSTIMESTAMP NOT NULL, /* 마이이슈작성날짜 */
	backgroundcolor VARCHAR2(100) null,
	textcolor VARCHAR2(100) null,
	allday NUMBER default 1 null
);

COMMENT ON TABLE MYISSUE IS '개인이슈';

COMMENT ON COLUMN MYISSUE.piseq IS '개인이슈번호';

COMMENT ON COLUMN MYISSUE.pititle IS '개인이슈제목';

COMMENT ON COLUMN MYISSUE.picontent IS '개인이슈내용';

COMMENT ON COLUMN MYISSUE.pistart IS '시작날짜';

COMMENT ON COLUMN MYISSUE.piend IS '종료날짜';

COMMENT ON COLUMN MYISSUE.ispibook IS '북마크여부';

COMMENT ON COLUMN MYISSUE.email IS '이메일';

COMMENT ON COLUMN MYISSUE.pidate IS '마이이슈작성날짜';

CREATE UNIQUE INDEX PK_MYISSUE
	ON MYISSUE (
		piseq ASC
	);

ALTER TABLE MYISSUE
	ADD
		CONSTRAINT PK_MYISSUE
		PRIMARY KEY (
			piseq
		);

/* 의사결정 */
CREATE TABLE VOTE (
	vseq NUMBER NOT NULL, /* 의사결정번호 */
	vstart TIMESTAMP DEFAULT SYSTIMESTAMP NOT NULL, /* 의사결정 시작시간 */
	vend TIMESTAMP DEFAULT SYSTIMESTAMP NOT NULL, /* 의사결정 종료시간 */
	votecheck NUMBER NOT NULL, /* 결정여부 */
	vcontent VARCHAR2(600) NOT NULL, /* 투표내용 */
	tiseq NUMBER NOT NULL, /* 팀이슈번호 */
	email VARCHAR2(100) NOT NULL, /* 이메일 */
	vdate TIMESTAMP DEFAULT SYSTIMESTAMP NOT NULL /* 알림작성시간 */
);

COMMENT ON TABLE VOTE IS '의사결정';

COMMENT ON COLUMN VOTE.vseq IS '의사결정번호';

COMMENT ON COLUMN VOTE.vstart IS '의사결정 시작시간';

COMMENT ON COLUMN VOTE.vend IS '의사결정 종료시간';

COMMENT ON COLUMN VOTE.votecheck IS '결정여부';

COMMENT ON COLUMN VOTE.vcontent IS '투표내용';

COMMENT ON COLUMN VOTE.tiseq IS '팀이슈번호';

COMMENT ON COLUMN VOTE.email IS '이메일';

COMMENT ON COLUMN VOTE.vdate IS '알림작성시간';

CREATE UNIQUE INDEX PK_VOTE
	ON VOTE (
		vseq ASC
	);

ALTER TABLE VOTE
	ADD
		CONSTRAINT PK_VOTE
		PRIMARY KEY (
			vseq
		);

/* 알림 설정 */
CREATE TABLE SETTING (
	email VARCHAR2(100) NOT NULL, /* 이메일 */
	ismail NUMBER NOT NULL, /* 메일알림설정 */
	isalarm NUMBER NOT NULL /* 협업공간 알림설정 */
);

COMMENT ON TABLE SETTING IS '알림 설정';

COMMENT ON COLUMN SETTING.email IS '이메일';

COMMENT ON COLUMN SETTING.ismail IS '메일알림설정';

COMMENT ON COLUMN SETTING.isalarm IS '협업공간 알림설정';

CREATE UNIQUE INDEX PK_SETTING
	ON SETTING (
		email ASC
	);

ALTER TABLE SETTING
	ADD
		CONSTRAINT PK_SETTING
		PRIMARY KEY (
			email
		);

/* 프로젝트 공지사항 */
CREATE TABLE PJNOTICE (
	pnseq NUMBER NOT NULL, /* 프로젝트공지사항글번호 */
	pntitle VARCHAR2(300) NOT NULL, /* 글제목 */
	pncontent VARCHAR2(4000) NOT NULL, /* 글내용 */
	pntime TIMESTAMP DEFAULT SYSTIMESTAMP NOT NULL, /* 작성일 */
	email VARCHAR2(100) NOT NULL, /* 이메일 */
	tseq NUMBER NOT NULL /* 프로젝트 번호 */
);

COMMENT ON TABLE PJNOTICE IS '프로젝트 공지사항';

COMMENT ON COLUMN PJNOTICE.pnseq IS '프로젝트공지사항글번호';

COMMENT ON COLUMN PJNOTICE.pntitle IS '글제목';

COMMENT ON COLUMN PJNOTICE.pncontent IS '글내용';

COMMENT ON COLUMN PJNOTICE.pntime IS '작성일';

COMMENT ON COLUMN PJNOTICE.email IS '이메일';

COMMENT ON COLUMN PJNOTICE.tseq IS '프로젝트 번호';

CREATE UNIQUE INDEX PK_PJNOTICE
	ON PJNOTICE (
		pnseq ASC
	);

ALTER TABLE PJNOTICE
	ADD
		CONSTRAINT PK_PJNOTICE
		PRIMARY KEY (
			pnseq
		);

/* 팀캘린더 */
CREATE TABLE TCALENDAR (
	tcseq NUMBER NOT NULL, /* 팀캘린더번호 */
	tcstart TIMESTAMP DEFAULT SYSTIMESTAMP NOT NULL, /* 시작날짜 */
	tcend TIMESTAMP DEFAULT SYSTIMESTAMP NOT NULL, /* 종료날짜 */
	isend NUMBER NOT NULL, /* 완료여부 */
	tcname VARCHAR2(30) NOT NULL, /* 캘린더이름 */
	email VARCHAR2(100) NOT NULL, /* 이메일 */
	tseq NUMBER NOT NULL, /* 프로젝트 번호 */
	color VARCHAR2(40) NOT NULL, /* 색깔 */
	tcdate TIMESTAMP DEFAULT SYSTIMESTAMP NOT NULL /* 팀캘린더 작성시간 */
);

COMMENT ON TABLE TCALENDAR IS '팀캘린더';

COMMENT ON COLUMN TCALENDAR.tcseq IS '팀캘린더번호';

COMMENT ON COLUMN TCALENDAR.tcstart IS '시작날짜';

COMMENT ON COLUMN TCALENDAR.tcend IS '종료날짜';

COMMENT ON COLUMN TCALENDAR.isend IS '완료여부';

COMMENT ON COLUMN TCALENDAR.tcname IS '캘린더이름';

COMMENT ON COLUMN TCALENDAR.email IS '이메일';

COMMENT ON COLUMN TCALENDAR.tseq IS '프로젝트 번호';

COMMENT ON COLUMN TCALENDAR.color IS '색깔';

COMMENT ON COLUMN TCALENDAR.tcdate IS '팀캘린더 작성시간';

CREATE UNIQUE INDEX PK_TCALENDAR
	ON TCALENDAR (
		tcseq ASC
	);

ALTER TABLE TCALENDAR
	ADD
		CONSTRAINT PK_TCALENDAR
		PRIMARY KEY (
			tcseq
		);

/* 댓글 */
CREATE TABLE REPLY (
	replyseq NUMBER NOT NULL, /* 댓글식별번호 */
	rcontent VARCHAR2(600) NOT NULL, /* 댓글내용 */
	email VARCHAR2(100) NOT NULL, /* 이메일 */
	rdate TIMESTAMP DEFAULT SYSTIMESTAMP NOT NULL, /* 댓글작성시간 */
	tiseq NUMBER NOT NULL /* 팀이슈번호 */
);

COMMENT ON TABLE REPLY IS '댓글';

COMMENT ON COLUMN REPLY.replyseq IS '댓글식별번호';

COMMENT ON COLUMN REPLY.rcontent IS '댓글내용';

COMMENT ON COLUMN REPLY.email IS '이메일';

COMMENT ON COLUMN REPLY.rdate IS '댓글작성시간';

COMMENT ON COLUMN REPLY.tiseq IS '팀이슈번호';

CREATE UNIQUE INDEX PK_REPLY
	ON REPLY (
		replyseq ASC
	);

ALTER TABLE REPLY
	ADD
		CONSTRAINT PK_REPLY
		PRIMARY KEY (
			replyseq
		);

/* 개인 캘린더 */
CREATE TABLE MYCALENDAR (
	pcseq NUMBER NOT NULL, /* 캘린더식별번호 */
	pcstart TIMESTAMP DEFAULT SYSTIMESTAMP NOT NULL, /* 시작날짜 */
	pcend TIMESTAMP DEFAULT SYSTIMESTAMP NOT NULL, /* 종료날짜 */
	pcsuccess NUMBER NOT NULL, /* 완료여부 */
	cname VARCHAR2(100) NOT NULL, /* 캘린더 이름 */
	pcolor VARCHAR2(100) NOT NULL, /* 색깔 */
	email VARCHAR2(100) NOT NULL /* 이메일 */
);

COMMENT ON TABLE MYCALENDAR IS '개인 캘린더';

COMMENT ON COLUMN MYCALENDAR.pcseq IS '캘린더식별번호';

COMMENT ON COLUMN MYCALENDAR.pcstart IS '시작날짜';

COMMENT ON COLUMN MYCALENDAR.pcend IS '종료날짜';

COMMENT ON COLUMN MYCALENDAR.pcsuccess IS '완료여부';

COMMENT ON COLUMN MYCALENDAR.cname IS '캘린더 이름';

COMMENT ON COLUMN MYCALENDAR.pcolor IS '색깔';

COMMENT ON COLUMN MYCALENDAR.email IS '이메일';

CREATE UNIQUE INDEX PK_MYCALENDAR
	ON MYCALENDAR (
		pcseq ASC
	);

ALTER TABLE MYCALENDAR
	ADD
		CONSTRAINT PK_MYCALENDAR
		PRIMARY KEY (
			pcseq
		);

/* 개인 링크 */
CREATE TABLE MYLINK (
	mylinkseq NUMBER NOT NULL, /* 개인링크 식별번호 */
	plink VARCHAR2(300) NOT NULL, /* 링크주소 */
	email VARCHAR2(100) NOT NULL, /* 이메일 */
	plinkdate TIMESTAMP DEFAULT SYSTIMESTAMP NOT NULL /* 마이링크작성날짜 */
);

COMMENT ON TABLE MYLINK IS '개인 링크';

COMMENT ON COLUMN MYLINK.mylinkseq IS '개인링크 식별번호';

COMMENT ON COLUMN MYLINK.plink IS '링크주소';

COMMENT ON COLUMN MYLINK.email IS '이메일';

COMMENT ON COLUMN MYLINK.plinkdate IS '마이링크작성날짜';

CREATE UNIQUE INDEX PK_MYLINK
	ON MYLINK (
		mylinkseq ASC
	);

ALTER TABLE MYLINK
	ADD
		CONSTRAINT PK_MYLINK
		PRIMARY KEY (
			mylinkseq
		);

/* 팀 링크 */
CREATE TABLE TLINK (
	tlinkseq NUMBER NOT NULL, /* 팀링크 식별번호 */
	tseq NUMBER NOT NULL, /* 프로젝트 번호 */
	tlink VARCHAR2(2000) NOT NULL, /* 링크 주소 */
	email VARCHAR2(100) NOT NULL, /* 이메일 */
	tlinkdate TIMESTAMP DEFAULT SYSTIMESTAMP NOT NULL /* 팀링크 작성시간 */
);

COMMENT ON TABLE TLINK IS '팀 링크';

COMMENT ON COLUMN TLINK.tlinkseq IS '팀링크 식별번호';

COMMENT ON COLUMN TLINK.tseq IS '프로젝트 번호';

COMMENT ON COLUMN TLINK.tlink IS '링크 주소';

COMMENT ON COLUMN TLINK.email IS '이메일';

COMMENT ON COLUMN TLINK.tlinkdate IS '팀링크 작성시간';

CREATE UNIQUE INDEX PK_TLINK
	ON TLINK (
		tlinkseq ASC
	);

ALTER TABLE TLINK
	ADD
		CONSTRAINT PK_TLINK
		PRIMARY KEY (
			tlinkseq
		);

/* 숨김회원 */
CREATE TABLE HIDEMEMBER (
	hemail VARCHAR2(100) NOT NULL, /* 숨기는 이메일 */
	email VARCHAR2(100) NOT NULL /* 이메일 */
);

COMMENT ON TABLE HIDEMEMBER IS '숨김회원';

COMMENT ON COLUMN HIDEMEMBER.hemail IS '숨기는 이메일';

COMMENT ON COLUMN HIDEMEMBER.email IS '이메일';

/* 팀프로잭트 맴버 */
CREATE TABLE TPMEMBER (
	tseq NUMBER NOT NULL, /* 프로젝트 번호 */
	email VARCHAR2(100) NOT NULL, /* 이메일 */
	PJUSERRANK NUMBER NOT NULL, /* 프로젝트 등급번호 */
	TPADDTIME TIMESTAMP /* 프로젝트 들어간시간 */
);

COMMENT ON TABLE TPMEMBER IS '팀프로잭트 맴버';

COMMENT ON COLUMN TPMEMBER.tseq IS '프로젝트 번호';

COMMENT ON COLUMN TPMEMBER.email IS '이메일';

COMMENT ON COLUMN TPMEMBER.PJUSERRANK IS '프로젝트 등급번호';

COMMENT ON COLUMN TPMEMBER.TPADDTIME IS '프로젝트 들어간시간';

/* 의사결정 맴버 */
CREATE TABLE VOTEMEMBER (
	vseq NUMBER NOT NULL, /* 의사결정번호 */
	vmemail VARCHAR2(300) NOT NULL, /* 프로젝트 맴버 이메일 */
	isvote NUMBER NOT NULL /* 개인결정여부 */
);

COMMENT ON TABLE VOTEMEMBER IS '의사결정 맴버';

COMMENT ON COLUMN VOTEMEMBER.vseq IS '의사결정번호';

COMMENT ON COLUMN VOTEMEMBER.vmemail IS '프로젝트 맴버 이메일';

COMMENT ON COLUMN VOTEMEMBER.isvote IS '개인결정여부';

/* 전체 공지사항 */
CREATE TABLE NOTICE (
	bnseq NUMBER NOT NULL, /* 전체공지사항 글번호 */
	bntitle VARCHAR2(300) NOT NULL, /* 글제목 */
	bncontent VARCHAR2(4000) NOT NULL, /* 글내용 */
	bntime TIMESTAMP DEFAULT SYSTIMESTAMP NOT NULL, /* 작성일 */
	email VARCHAR2(100) NOT NULL /* 이메일 */
);

COMMENT ON TABLE NOTICE IS '전체 공지사항';

COMMENT ON COLUMN NOTICE.bnseq IS '전체공지사항 글번호';

COMMENT ON COLUMN NOTICE.bntitle IS '글제목';

COMMENT ON COLUMN NOTICE.bncontent IS '글내용';

COMMENT ON COLUMN NOTICE.bntime IS '작성일';

COMMENT ON COLUMN NOTICE.email IS '이메일';

CREATE UNIQUE INDEX PK_NOTICE
	ON NOTICE (
		bnseq ASC
	);

ALTER TABLE NOTICE
	ADD
		CONSTRAINT PK_NOTICE
		PRIMARY KEY (
			bnseq
		);

/* 롤 */
CREATE TABLE ROLE (
	email VARCHAR2(100) NOT NULL, /* 이메일 */
	rname VARCHAR2(24) NOT NULL /* 롤이름 */
);

COMMENT ON TABLE ROLE IS '롤';

COMMENT ON COLUMN ROLE.email IS '이메일';

COMMENT ON COLUMN ROLE.rname IS '롤이름';

/* 댓글알림 */
CREATE TABLE replyAlert (
	email VARCHAR2(100) NOT NULL, /* 이메일 */
	ratitle VARCHAR2(300) NOT NULL, /* 알림 제목 */
	isra NUMBER NOT NULL, /* 읽음 여부 */
	replyseq NUMBER NOT NULL /* 댓글식별번호 */
);

COMMENT ON TABLE replyAlert IS '댓글알림';

COMMENT ON COLUMN replyAlert.email IS '이메일';

COMMENT ON COLUMN replyAlert.ratitle IS '알림 제목';

COMMENT ON COLUMN replyAlert.isra IS '읽음 여부';

COMMENT ON COLUMN replyAlert.replyseq IS '댓글식별번호';

/* 파일 드라이브 */
CREATE TABLE FILEDRIVE (
	fdseq NUMBER NOT NULL, /* 파일디스크식별번호 */
	tiseq NUMBER NOT NULL, /* 팀이슈번호 */
	fdcapa VARCHAR2(500) NOT NULL, /* 파일용량 */
	fdname VARCHAR2(300) NOT NULL, /* 파일명 */
	email VARCHAR2(100) NOT NULL, /* 이메일 */
	fddate TIMESTAMP DEFAULT SYSTIMESTAMP NOT NULL, /* 파일작성날짜 */
	tseq NUMBER NOT NULL /* 프로젝트 번호 */
);

COMMENT ON TABLE FILEDRIVE IS '파일 드라이브';

COMMENT ON COLUMN FILEDRIVE.fdseq IS '파일디스크식별번호';

COMMENT ON COLUMN FILEDRIVE.tiseq IS '팀이슈번호';

COMMENT ON COLUMN FILEDRIVE.fdcapa IS '파일용량';

COMMENT ON COLUMN FILEDRIVE.fdname IS '파일명';

COMMENT ON COLUMN FILEDRIVE.email IS '이메일';

COMMENT ON COLUMN FILEDRIVE.fddate IS '파일작성날짜';

COMMENT ON COLUMN FILEDRIVE.tseq IS '프로젝트 번호';

CREATE UNIQUE INDEX PK_FILEDRIVE
	ON FILEDRIVE (
		fdseq ASC
	);

ALTER TABLE FILEDRIVE
	ADD
		CONSTRAINT PK_FILEDRIVE
		PRIMARY KEY (
			fdseq
		);

/* 프로잭트 등급 */
CREATE TABLE PJRANK (
	PJUSERRANK NUMBER NOT NULL, /* 프로젝트 등급번호 */
	PJRANKNAME VARCHAR2(20) NOT NULL /* 프로잭트 등급이름 */
);

COMMENT ON TABLE PJRANK IS '프로잭트 등급';

COMMENT ON COLUMN PJRANK.PJUSERRANK IS '프로젝트 등급번호';

COMMENT ON COLUMN PJRANK.PJRANKNAME IS '프로잭트 등급이름';

CREATE UNIQUE INDEX PK_PJRANK
	ON PJRANK (
		PJUSERRANK ASC
	);

ALTER TABLE PJRANK
	ADD
		CONSTRAINT PK_PJRANK
		PRIMARY KEY (
			PJUSERRANK
		);

/* 공지사항 알림 */
CREATE TABLE PNALERT (
	pnatitle VARCHAR2(300) NOT NULL, /* 알림 제목 */
	ispna NUMBER NOT NULL, /* 읽음 여부 */
	pnseq NUMBER NOT NULL, /* 프로젝트공지사항글번호 */
	email VARCHAR2(100) NOT NULL /* 이메일 */
);

COMMENT ON TABLE PNALERT IS '공지사항 알림';

COMMENT ON COLUMN PNALERT.pnatitle IS '알림 제목';

COMMENT ON COLUMN PNALERT.ispna IS '읽음 여부';

COMMENT ON COLUMN PNALERT.pnseq IS '프로젝트공지사항글번호';

COMMENT ON COLUMN PNALERT.email IS '이메일';

/* 팀이슈알림 */
CREATE TABLE TIAlert (
	tiatitle VARCHAR2(300) NOT NULL, /* 알림 제목 */
	istia NUMBER NOT NULL, /* 읽음 여부 */
	email VARCHAR2(100) NOT NULL, /* 이메일 */
	tiseq NUMBER NOT NULL /* 팀이슈번호 */
);

COMMENT ON TABLE TIAlert IS '팀이슈알림';

COMMENT ON COLUMN TIAlert.tiatitle IS '알림 제목';

COMMENT ON COLUMN TIAlert.istia IS '읽음 여부';

COMMENT ON COLUMN TIAlert.email IS '이메일';

COMMENT ON COLUMN TIAlert.tiseq IS '팀이슈번호';

/* 댓글알림2 */
CREATE TABLE VOTEAlert (
	email VARCHAR2(100) NOT NULL, /* 이메일 */
	vatitle VARCHAR2(300) NOT NULL, /* 알림 제목 */
	isva NUMBER NOT NULL, /* 읽음 여부 */
	vseq NUMBER NOT NULL /* 의사결정번호 */
);

COMMENT ON TABLE VOTEAlert IS '댓글알림2';

COMMENT ON COLUMN VOTEAlert.email IS '이메일';

COMMENT ON COLUMN VOTEAlert.vatitle IS '알림 제목';

COMMENT ON COLUMN VOTEAlert.isva IS '읽음 여부';

COMMENT ON COLUMN VOTEAlert.vseq IS '의사결정번호';

/* 팀멘션리스트 */
CREATE TABLE TEAMMENTION (
	tiseq NUMBER NOT NULL, /* 팀이슈번호 */
	tmseq NUMBER NOT NULL, /* 팀멘션번호 */
	tmemail VARCHAR2(300) NOT NULL /* 팀멘션이메일 */
);

COMMENT ON TABLE TEAMMENTION IS '팀멘션리스트';

COMMENT ON COLUMN TEAMMENTION.tiseq IS '팀이슈번호';

COMMENT ON COLUMN TEAMMENTION.tmseq IS '팀멘션번호';

COMMENT ON COLUMN TEAMMENTION.tmemail IS '팀멘션이메일';

CREATE UNIQUE INDEX PK_TEAMMENTION
	ON TEAMMENTION (
		tmseq ASC
	);

ALTER TABLE TEAMMENTION
	ADD
		CONSTRAINT PK_TEAMMENTION
		PRIMARY KEY (
			tmseq
		);

/* 북마크 */
CREATE TABLE BOOKMARK (
	bseq NUMBER NOT NULL, /* 북마크번호 */
	email VARCHAR2(100) NOT NULL, /* 이메일 */
	tiseq NUMBER, /* 팀이슈번호 */
	piseq NUMBER /* 개인이슈번호 */
);

COMMENT ON TABLE BOOKMARK IS '북마크';

COMMENT ON COLUMN BOOKMARK.bseq IS '북마크번호';

COMMENT ON COLUMN BOOKMARK.email IS '이메일';

COMMENT ON COLUMN BOOKMARK.tiseq IS '팀이슈번호';

COMMENT ON COLUMN BOOKMARK.piseq IS '개인이슈번호';

CREATE UNIQUE INDEX PK_BOOKMARK
	ON BOOKMARK (
		bseq ASC
	);

ALTER TABLE BOOKMARK
	ADD
		CONSTRAINT PK_BOOKMARK
		PRIMARY KEY (
			bseq
		);

/* 개인파일드라이브 */
CREATE TABLE PFILEDRIVE (
	pdseq NUMBER NOT NULL, /* 파일디스크식별번호 */
	pdcapa VARCHAR2(500) NOT NULL, /* 파일용량 */
	pfdname VARCHAR2(300) NOT NULL, /* 파일명 */
	pfddate TIMESTAMP DEFAULT SYSTIMESTAMP NOT NULL, /* 파일작성날짜 */
	email VARCHAR2(100) NOT NULL, /* 이메일 */
	piseq NUMBER /* 개인이슈번호 */
);

COMMENT ON TABLE PFILEDRIVE IS '개인파일드라이브';

COMMENT ON COLUMN PFILEDRIVE.pdseq IS '파일디스크식별번호';

COMMENT ON COLUMN PFILEDRIVE.pdcapa IS '파일용량';

COMMENT ON COLUMN PFILEDRIVE.pfdname IS '파일명';

COMMENT ON COLUMN PFILEDRIVE.pfddate IS '파일작성날짜';

COMMENT ON COLUMN PFILEDRIVE.email IS '이메일';

COMMENT ON COLUMN PFILEDRIVE.piseq IS '개인이슈번호';

CREATE UNIQUE INDEX PK_PFILEDRIVE
	ON PFILEDRIVE (
		pdseq ASC
	);

ALTER TABLE PFILEDRIVE
	ADD
		CONSTRAINT PK_PFILEDRIVE
		PRIMARY KEY (
			pdseq
		);

/* 개인구글드라이브 */
CREATE TABLE PGOOGLEDRIVE (
	pgseq NUMBER NOT NULL, /* 개인구글파일번호 */
	pgfilename VARCHAR2(500), /* 개인구글파일이름 */
	pgurl VARCHAR2(200), /* 개인구글URL */
	piseq NUMBER /* 개인이슈번호 */
);

COMMENT ON TABLE PGOOGLEDRIVE IS '개인구글드라이브';

COMMENT ON COLUMN PGOOGLEDRIVE.pgseq IS '개인구글파일번호';

COMMENT ON COLUMN PGOOGLEDRIVE.pgfilename IS '개인구글파일이름';

COMMENT ON COLUMN PGOOGLEDRIVE.pgurl IS '개인구글URL';

COMMENT ON COLUMN PGOOGLEDRIVE.piseq IS '개인이슈번호';

CREATE UNIQUE INDEX PK_PGOOGLEDRIVE
	ON PGOOGLEDRIVE (
		pgseq ASC
	);

ALTER TABLE PGOOGLEDRIVE
	ADD
		CONSTRAINT PK_PGOOGLEDRIVE
		PRIMARY KEY (
			pgseq
		);

/* 팀구글드라이브 */
CREATE TABLE TEAMGOOGLEDRIVE (
	tgseq NUMBER NOT NULL, /* 팀구글파일번호 */
	tgfilename VARCHAR2(500) NOT NULL, /* 팀구글파일이름 */
	tgurl VARCHAR2(200) NOT NULL, /* 팀구글링크 */
	tiseq NUMBER NOT NULL /* 팀이슈번호 */
);

COMMENT ON TABLE TEAMGOOGLEDRIVE IS '팀구글드라이브';

COMMENT ON COLUMN TEAMGOOGLEDRIVE.tgseq IS '팀구글파일번호';

COMMENT ON COLUMN TEAMGOOGLEDRIVE.tgfilename IS '팀구글파일이름';

COMMENT ON COLUMN TEAMGOOGLEDRIVE.tgurl IS '팀구글링크';

COMMENT ON COLUMN TEAMGOOGLEDRIVE.tiseq IS '팀이슈번호';

CREATE UNIQUE INDEX PK_TEAMGOOGLEDRIVE
	ON TEAMGOOGLEDRIVE (
		tgseq ASC
	);

ALTER TABLE TEAMGOOGLEDRIVE
	ADD
		CONSTRAINT PK_TEAMGOOGLEDRIVE
		PRIMARY KEY (
			tgseq
		);

/* 팀할일주기 */
CREATE TABLE TEAMDOWORK (
	tdseq NUMBER NOT NULL, /* 팀할일번호 */
	tiseq NUMBER NOT NULL, /* 팀이슈번호 */
	email VARCHAR2(100) NOT NULL, /* 이메일 */
	toemail VARCHAR(100) NOT NULL, /* 받는사람이메일 */
	dowork VARCHAR2(1000) NOT NULL /* 할일내용 */
);

COMMENT ON TABLE TEAMDOWORK IS '팀할일주기';

COMMENT ON COLUMN TEAMDOWORK.tdseq IS '팀할일번호';

COMMENT ON COLUMN TEAMDOWORK.tiseq IS '팀이슈번호';

COMMENT ON COLUMN TEAMDOWORK.email IS '이메일';

COMMENT ON COLUMN TEAMDOWORK.toemail IS '받는사람이메일';

COMMENT ON COLUMN TEAMDOWORK.dowork IS '할일내용';

CREATE UNIQUE INDEX PK_TEAMDOWORK
	ON TEAMDOWORK (
		tdseq ASC
	);

ALTER TABLE TEAMDOWORK
	ADD
		CONSTRAINT PK_TEAMDOWORK
		PRIMARY KEY (
			tdseq
		);
/* 알림 설정 */
CREATE TABLE SETTING (
   email VARCHAR2(100) NOT NULL, /* 이메일 */
   isalarm NUMBER NOT NULL /* 전체알림 */

);

COMMENT ON TABLE SETTING IS '알림 설정';

COMMENT ON COLUMN SETTING.email IS '이메일';



COMMENT ON COLUMN SETTING.isalarm IS '전체알림';



CREATE UNIQUE INDEX PK_SETTING
   ON SETTING (
      email ASC
   );

/* 개인할일 */
CREATE TABLE PDOWORK (
	pwseq NUMBER NOT NULL, /* 개인할일번호 */
	piseq NUMBER NOT NULL, /* 개인이슈번호 */
	email VARCHAR2(100) NOT NULL, /* 이메일 */
	ptoemail VARCHAR(100) NOT NULL, /* 받는사람이메일 */
	pdowork VARCHAR2(1000) NOT NULL /* 할일내용 */
);

COMMENT ON TABLE PDOWORK IS '개인할일';

COMMENT ON COLUMN PDOWORK.pwseq IS '개인할일번호';

COMMENT ON COLUMN PDOWORK.piseq IS '개인이슈번호';

COMMENT ON COLUMN PDOWORK.email IS '이메일';

COMMENT ON COLUMN PDOWORK.ptoemail IS '받는사람이메일';

COMMENT ON COLUMN PDOWORK.pdowork IS '할일내용';

CREATE UNIQUE INDEX PK_PDOWORK
	ON PDOWORK (
		pwseq ASC
	);

ALTER TABLE PDOWORK
	ADD
		CONSTRAINT PK_PDOWORK
		PRIMARY KEY (
			pwseq
		);

/* 개인멘션리스트 */
CREATE TABLE PMENTION (
	pmseq NUMBER NOT NULL, /* 개인멘션번호 */
	pemail VARCHAR2(300) NOT NULL, /* 개인멘션이메일 */
	piseq NUMBER NOT NULL /* 개인이슈번호 */
);

COMMENT ON TABLE PMENTION IS '개인멘션리스트';

COMMENT ON COLUMN PMENTION.pmseq IS '개인멘션번호';

COMMENT ON COLUMN PMENTION.pemail IS '개인멘션이메일';

COMMENT ON COLUMN PMENTION.piseq IS '개인이슈번호';

CREATE UNIQUE INDEX PK_PMENTION
	ON PMENTION (
		pmseq ASC
	);

ALTER TABLE PMENTION
	ADD
		CONSTRAINT PK_PMENTION
		PRIMARY KEY (
			pmseq
		);

ALTER TABLE Member
	ADD
		CONSTRAINT FK_LOGIN_TO_Member
		FOREIGN KEY (
			loginnum
		)
		REFERENCES LOGIN (
			LOGINNUM
		)ON DELETE CASCADE;

ALTER TABLE TEAMPJT
	ADD
		CONSTRAINT FK_Member_TO_TEAMPJT
		FOREIGN KEY (
			email
		)
		REFERENCES Member (
			email
		)ON DELETE CASCADE;

ALTER TABLE TISSUE
	ADD
		CONSTRAINT FK_TEAMPJT_TO_TISSUE
		FOREIGN KEY (
			tseq
		)
		REFERENCES TEAMPJT (
			tseq
		)ON DELETE CASCADE;

ALTER TABLE MYISSUE
	ADD
		CONSTRAINT FK_Member_TO_MYISSUE
		FOREIGN KEY (
			email
		)
		REFERENCES Member (
			email
		)ON DELETE CASCADE;

ALTER TABLE VOTE
	ADD
		CONSTRAINT FK_TISSUE_TO_VOTE
		FOREIGN KEY (
			tiseq
		)
		REFERENCES TISSUE (
			tiseq
		)ON DELETE CASCADE;

ALTER TABLE SETTING
	ADD
		CONSTRAINT FK_Member_TO_SETTING
		FOREIGN KEY (
			email
		)
		REFERENCES Member (
			email
		)ON DELETE CASCADE;

ALTER TABLE PJNOTICE
	ADD
		CONSTRAINT FK_TEAMPJT_TO_PJNOTICE
		FOREIGN KEY (
			tseq
		)
		REFERENCES TEAMPJT (
			tseq
		)ON DELETE CASCADE;

ALTER TABLE TCALENDAR
	ADD
		CONSTRAINT FK_TEAMPJT_TO_TCALENDAR
		FOREIGN KEY (
			tseq
		)
		REFERENCES TEAMPJT (
			tseq
		)ON DELETE CASCADE;

ALTER TABLE REPLY
	ADD
		CONSTRAINT FK_TISSUE_TO_REPLY
		FOREIGN KEY (
			tiseq
		)
		REFERENCES TISSUE (
			tiseq
		)ON DELETE CASCADE;

ALTER TABLE MYCALENDAR
	ADD
		CONSTRAINT FK_Member_TO_MYCALENDAR
		FOREIGN KEY (
			email
		)
		REFERENCES Member (
			email
		)ON DELETE CASCADE;

ALTER TABLE MYLINK
	ADD
		CONSTRAINT FK_Member_TO_MYLINK
		FOREIGN KEY (
			email
		)
		REFERENCES Member (
			email
		)ON DELETE CASCADE;

ALTER TABLE TLINK
	ADD
		CONSTRAINT FK_TEAMPJT_TO_TLINK
		FOREIGN KEY (
			tseq
		)
		REFERENCES TEAMPJT (
			tseq
		)ON DELETE CASCADE;

ALTER TABLE HIDEMEMBER
	ADD
		CONSTRAINT FK_Member_TO_HIDEMEMBER
		FOREIGN KEY (
			email
		)
		REFERENCES Member (
			email
		)ON DELETE CASCADE;

ALTER TABLE TPMEMBER
	ADD
		CONSTRAINT FK_TEAMPJT_TO_TPMEMBER
		FOREIGN KEY (
			tseq
		)
		REFERENCES TEAMPJT (
			tseq
		)ON DELETE CASCADE;

ALTER TABLE TPMEMBER
	ADD
		CONSTRAINT FK_PJRANK_TO_TPMEMBER
		FOREIGN KEY (
			PJUSERRANK
		)
		REFERENCES PJRANK (
			PJUSERRANK
		)ON DELETE CASCADE;

ALTER TABLE TPMEMBER
	ADD
		CONSTRAINT FK_Member_TO_TPMEMBER
		FOREIGN KEY (
			email
		)
		REFERENCES Member (
			email
		)ON DELETE CASCADE;

ALTER TABLE VOTEMEMBER
	ADD
		CONSTRAINT FK_VOTE_TO_VOTEMEMBER
		FOREIGN KEY (
			vseq
		)
		REFERENCES VOTE (
			vseq
		)ON DELETE CASCADE;

ALTER TABLE NOTICE
	ADD
		CONSTRAINT FK_Member_TO_NOTICE
		FOREIGN KEY (
			email
		)
		REFERENCES Member (
			email
		)ON DELETE CASCADE;

ALTER TABLE ROLE
	ADD
		CONSTRAINT FK_Member_TO_ROLE
		FOREIGN KEY (
			email
		)
		REFERENCES Member (
			email
		)ON DELETE CASCADE;

ALTER TABLE replyAlert
	ADD
		CONSTRAINT FK_REPLY_TO_replyAlert
		FOREIGN KEY (
			replyseq
		)
		REFERENCES REPLY (
			replyseq
		)ON DELETE CASCADE;

ALTER TABLE replyAlert
	ADD
		CONSTRAINT FK_Member_TO_replyAlert
		FOREIGN KEY (
			email
		)
		REFERENCES Member (
			email
		)ON DELETE CASCADE;

ALTER TABLE FILEDRIVE
	ADD
		CONSTRAINT FK_Member_TO_FILEDRIVE
		FOREIGN KEY (
			email
		)
		REFERENCES Member (
			email
		)ON DELETE CASCADE;

ALTER TABLE FILEDRIVE
	ADD
		CONSTRAINT FK_TISSUE_TO_FILEDRIVE
		FOREIGN KEY (
			tiseq
		)
		REFERENCES TISSUE (
			tiseq
		)ON DELETE CASCADE;

ALTER TABLE FILEDRIVE
	ADD
		CONSTRAINT FK_TEAMPJT_TO_FILEDRIVE
		FOREIGN KEY (
			tseq
		)
		REFERENCES TEAMPJT (
			tseq
		)ON DELETE CASCADE;

ALTER TABLE PNALERT
	ADD
		CONSTRAINT FK_PJNOTICE_TO_PNALERT
		FOREIGN KEY (
			pnseq
		)
		REFERENCES PJNOTICE (
			pnseq
		)ON DELETE CASCADE;

ALTER TABLE PNALERT
	ADD
		CONSTRAINT FK_Member_TO_PNALERT
		FOREIGN KEY (
			email
		)
		REFERENCES Member (
			email
		)ON DELETE CASCADE;

ALTER TABLE TIAlert
	ADD
		CONSTRAINT FK_TISSUE_TO_TIAlert
		FOREIGN KEY (
			tiseq
		)
		REFERENCES TISSUE (
			tiseq
		)ON DELETE CASCADE;

ALTER TABLE TIAlert
	ADD
		CONSTRAINT FK_Member_TO_TIAlert
		FOREIGN KEY (
			email
		)
		REFERENCES Member (
			email
		)ON DELETE CASCADE;

ALTER TABLE VOTEAlert
	ADD
		CONSTRAINT FK_VOTE_TO_VOTEAlert
		FOREIGN KEY (
			vseq
		)
		REFERENCES VOTE (
			vseq
		)ON DELETE CASCADE;

ALTER TABLE VOTEAlert
	ADD
		CONSTRAINT FK_Member_TO_VOTEAlert
		FOREIGN KEY (
			email
		)
		REFERENCES Member (
			email
		)ON DELETE CASCADE;

ALTER TABLE TEAMMENTION
	ADD
		CONSTRAINT FK_TISSUE_TO_TEAMMENTION
		FOREIGN KEY (
			tiseq
		)
		REFERENCES TISSUE (
			tiseq
		)ON DELETE CASCADE;

ALTER TABLE BOOKMARK
	ADD
		CONSTRAINT FK_Member_TO_BOOKMARK
		FOREIGN KEY (
			email
		)
		REFERENCES Member (
			email
		)ON DELETE CASCADE;

ALTER TABLE BOOKMARK
	ADD
		CONSTRAINT FK_TISSUE_TO_BOOKMARK
		FOREIGN KEY (
			tiseq
		)
		REFERENCES TISSUE (
			tiseq
		)ON DELETE CASCADE;

ALTER TABLE BOOKMARK
	ADD
		CONSTRAINT FK_MYISSUE_TO_BOOKMARK
		FOREIGN KEY (
			piseq
		)
		REFERENCES MYISSUE (
			piseq
		)ON DELETE CASCADE;

ALTER TABLE PFILEDRIVE
	ADD
		CONSTRAINT FK_Member_TO_PFILEDRIVE
		FOREIGN KEY (
			email
		)
		REFERENCES Member (
			email
		)ON DELETE CASCADE;

ALTER TABLE PFILEDRIVE
	ADD
		CONSTRAINT FK_MYISSUE_TO_PFILEDRIVE
		FOREIGN KEY (
			piseq
		)
		REFERENCES MYISSUE (
			piseq
		)ON DELETE CASCADE;

ALTER TABLE PGOOGLEDRIVE
	ADD
		CONSTRAINT FK_MYISSUE_TO_PGOOGLEDRIVE
		FOREIGN KEY (
			piseq
		)
		REFERENCES MYISSUE (
			piseq
		)ON DELETE CASCADE;

ALTER TABLE TEAMGOOGLEDRIVE
	ADD
		CONSTRAINT FK_TISSUE_TO_TEAMGOOGLEDRIVE
		FOREIGN KEY (
			tiseq
		)
		REFERENCES TISSUE (
			tiseq
		)ON DELETE CASCADE;

ALTER TABLE TEAMDOWORK
	ADD
		CONSTRAINT FK_TISSUE_TO_TEAMDOWORK
		FOREIGN KEY (
			tiseq
		)
		REFERENCES TISSUE (
			tiseq
		)ON DELETE CASCADE;

ALTER TABLE TEAMDOWORK
	ADD
		CONSTRAINT FK_Member_TO_TEAMDOWORK
		FOREIGN KEY (
			email
		)
		REFERENCES Member (
			email
		)ON DELETE CASCADE;

ALTER TABLE PDOWORK
	ADD
		CONSTRAINT FK_MYISSUE_TO_PDOWORK
		FOREIGN KEY (
			piseq
		)
		REFERENCES MYISSUE (
			piseq
		)ON DELETE CASCADE;

ALTER TABLE PDOWORK
	ADD
		CONSTRAINT FK_Member_TO_PDOWORK
		FOREIGN KEY (
			email
		)
		REFERENCES Member (
			email
		)ON DELETE CASCADE;

ALTER TABLE PMENTION
	ADD
		CONSTRAINT FK_MYISSUE_TO_PMENTION
		FOREIGN KEY (
			piseq
		)
		REFERENCES MYISSUE (
			piseq
		)ON DELETE CASCADE;

ALTER TABLE SETTING
   ADD
      CONSTRAINT FK_Member_TO_SETTING
      FOREIGN KEY (
         email
      )
      REFERENCES Member (
         email
      )ON DELETE CASCADE;









/* 전체공지사항  시퀀스 삭제 */
drop sequence BNSEQ_NOTICE_SEQ;


/* 개인 파일번호 시퀀스 삭제 */
drop sequence FDSEQ_MYISSUE_SEQ;



/* 의사결정번호 시퀀스  삭제 */
drop sequence VSEQ_VOTE_SEQ;


/* 개인이슈 번호 시퀀스 삭제 */
drop sequence PISEQ_MYISSUE_SEQ;


/* 팀이슈 번호 시퀀스 삭제 */
drop sequence TISEQ_TISSUE_SEQ;


/* 팀 프로젝트 번호 시퀀스 */
drop sequence TSEQ_TEAMPJT_SEQ;


/* 팀 캘린더 시퀀스 삭제 */
drop sequence TCSEQ_TCALENDAR_SEQ;


/* 개인 캘린더 시퀀스 삭제 */
drop sequence PCNUM_MYCALENDAR_SEQ;

/* 덧글 식별번호 시퀀스 삭제 */
drop sequence REPLYSEQ_REPLY_SEQ;

/* 프로젝트 공지사항 시퀀스 삭제 */
drop sequence PNSEQ_PJNOTICE_SEQ;

/* 팀링크 시퀀스 삭제 */
drop sequence MYLINKSEQ_MYLINK_SEQ;

/* 팀링크 시퀀스 삭제 */
drop sequence TLINKSEQ_TLINK_SEQ;

/* 파일 드라이브 시퀀스 삭제 */
drop sequence FDSEQ_FILEDRIVE_SEQ;

/* 북마크 시퀀스 삭제  */
drop sequence BSEQ_BOOKMARK_SEQ;

/* 개인 파일 드라이브 시퀀스 삭제 */
drop sequence PDSEQ_PFILEDRIVE_SEQ;

/*팀멘션 번호 시퀀스 삭제*/
drop sequence TMSEQ_TEAMMENTION_SEQ;

/*개인 구글드라이브 시퀀스 삭제*/
drop sequence PGSEQ_PGOOGLEDRIVE_SEQ;

/*개인 할일 번호 시퀀스 삭제*/
drop sequence PWSEQ_PDOWORK_SEQ;

/*팀 구글드라이브 시퀀스 삭제*/
drop sequence TGSEQ_TEAMGOOGLEDRIVE_SEQ;

/*팀 할일 번호 시퀀스 삭제*/
drop sequence TDSEQ_TEAMDOWORK_SEQ;

/*개인 멘션 시퀀스 삭제*/
drop sequence PMSEQ_PMENTION_SEQ;




/* 전체공지사항 글번호 시퀀스 생성 */
CREATE SEQUENCE BNSEQ_NOTICE_SEQ
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCYCLE;

/* 팀멘션 번호 시퀀스 생성*/
CREATE SEQUENCE TMSEQ_TEAMMENTION_SEQ
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCYCLE;

/* 개인파일 번호 시퀀스 생성 */
CREATE SEQUENCE FDSEQ_MYISSUE_SEQ
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCYCLE;

/* 의사결정번호 시퀀스 생성  */
CREATE SEQUENCE VSEQ_VOTE_SEQ
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCYCLE;

/* 개인이슈 번호 시퀀스 생성 */
CREATE SEQUENCE PISEQ_MYISSUE_SEQ
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCYCLE;

/* 팀이슈 번호 시퀀스 생성  */
CREATE SEQUENCE TISEQ_TISSUE_SEQ
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCYCLE;

/* 팀 프로젝트 번호 시퀀스 생성 */
CREATE SEQUENCE TSEQ_TEAMPJT_SEQ
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCYCLE;

/* 팀 캘린더 시퀀스 생성 */
CREATE SEQUENCE TCSEQ_TCALENDAR_SEQ
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCYCLE;

/* 댓글 식별번호 시퀀스 생성 */
CREATE SEQUENCE REPLYSEQ_REPLY_SEQ
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCYCLE;


/* 개인 캘린더 시퀀스 생성 */
CREATE SEQUENCE PCSEQ_MYCALENDAR_SEQ
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCYCLE;

/* 프로젝트 공지사항 글번호 시퀀스 생성 */
CREATE SEQUENCE PNSEQ_PJNOTICE_SEQ
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCYCLE;

/* 개인링크 글번호 시퀀스 생성 */
CREATE SEQUENCE MYLINKSEQ_MYLINK_SEQ
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCYCLE;

/* 팀링크 글번호 시퀀스 생성 */
CREATE SEQUENCE TLINKSEQ_TLINK_SEQ
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCYCLE;

/* 파일드라이브 시퀀스 생성 */
CREATE SEQUENCE FDSEQ_FILEDRIVE_SEQ
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCYCLE;

/* 북마크 시퀀스 */
CREATE SEQUENCE BSEQ_BOOKMARK_SEQ
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCYCLE;

/* 개인 파일드라이브 시퀀스 */
CREATE SEQUENCE PDSEQ_PFILEDRIVE_SEQ
 START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCYCLE;

/* 개인 구글드라이브 시퀀스 */
CREATE SEQUENCE PGSEQ_PGOOGLEDRIVE_SEQ
 START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCYCLE;

/* 개인 할일주기 시퀀스 */
CREATE SEQUENCE PWSEQ_PDOWORK_SEQ
 START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCYCLE;

/* 팀 구글드라이브 시퀀스 */
CREATE SEQUENCE TGSEQ_TEAMGOOGLEDRIVE_SEQ
 START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCYCLE;

/* 팀 할일 주기 시퀀스 */
CREATE SEQUENCE TDSEQ_TEAMDOWORK_SEQ
 START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCYCLE;

/* 개인멘션 번호 시퀀스 */
CREATE SEQUENCE PMSEQ_PMENTION_SEQ
 START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCYCLE;


-- 회원가입 시 롤 추가 삭제
drop trigger insert_tri_role;

-- 팀프로젝트 생성 시 맴버 등급 추가 삭제
drop trigger insert_tri_tpmember;

-- tissue trigger delete
drop trigger insert_tissue_alert;

-- reply alert
drop trigger insert_reply_alert;

-- vote trigger delete
drop trigger insert_vote_alert;

-- pjnotice trigger delete
drop trigger insert_pjnotice_alert;

-- 회원가입 시 롤 생성
create or replace trigger insert_tri_role
after insert on member
for each row
BEGIN
  insert INTO role VALUES (:NEW.email, 'ROLE_USER');
END;


-- 팀프로잭트 생성시 맴버생성
create or replace trigger insert_tri_tpmember
after insert on teampjt
for each row
BEGIN
  if :NEW.tseq is null then
  insert INTO tpmember VALUES (:NEW.tseq,:NEW.email, 300,systimestamp);
  else
  insert INTO tpmember VALUES (:NEW.tseq,:NEW.email, 100,systimestamp);
  END if;
END;

-- tissue trigger
create or replace trigger insert_tissue_alert
after insert on tissue
for each row
BEGIN
  insert INTO tialert VALUES (:NEW.tititle, 0,:NEW.email,:NEW.tiseq);
END;

-- reply trigger
create or replace trigger insert_reply_alert
after insert on reply
for each row
BEGIN
  insert INTO replyalert VALUES (:NEW.email, :NEW.rcontent,0,:NEW.replyseq);
END;

-- vote trigger
create or replace trigger insert_vote_alert
after insert on vote
for each row
BEGIN
  insert INTO votealert VALUES (:NEW.email, :NEW.vcontent,0,:NEW.vseq);
END;
-- pjnotice trigger
create or replace trigger insert_pjnotice_alert
after insert on pjnotice
for each row
BEGIN
  insert INTO pnalert VALUES (:NEW.pntitle, 0,:NEW.pnseq,:NEW.email);
END;

--member setting trigger
create or replace trigger insert_tri_setting
after insert on member
for each row
BEGIN
  insert INTO setting VALUES (:NEW.email, 0);
END;

insert into login values (1,'NORMAL');
insert into login values (2,'NAVER');
insert into login values (3,'GOOGLE');

insert into pjrank values (100,'COMMON');
insert into pjrank values (300,'CHIEF');

