package kr.or.scoop.dto;

import java.sql.Date;

import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
//멤버
@Repository
public class Member {
	private String email; //이메일
	private String pwd; //비밀번호
	private String name; //이름
	private CommonsMultipartFile filesrc; //프로필사진
	private Date iddate; //가입 시간
	private String profile; //프로필 사진 파일 이름
	private String rname; //등급 이름
	private int point; //유저 포인트
	private int cpseq; //쿠폰 등록멤버 번호
	private int cpoint; //쿠폰여부
	private int mpoint; //영화 가격
	private int mlike; //회원 추천수
	private int ismlike; //추천 여부
	private int isstop; //정지 여부
	private String scontent; //정지사유
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public CommonsMultipartFile getFilesrc() {
		return filesrc;
	}
	public void setFilesrc(CommonsMultipartFile filesrc) {
		this.filesrc = filesrc;
	}
	public Date getIddate() {
		return iddate;
	}
	public void setIddate(Date iddate) {
		this.iddate = iddate;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getCpseq() {
		return cpseq;
	}
	public void setCpseq(int cpseq) {
		this.cpseq = cpseq;
	}
	public int getCpoint() {
		return cpoint;
	}
	public void setCpoint(int cpoint) {
		this.cpoint = cpoint;
	}
	public int getMpoint() {
		return mpoint;
	}
	public void setMpoint(int mpoint) {
		this.mpoint = mpoint;
	}
	public int getMlike() {
		return mlike;
	}
	public void setMlike(int mlike) {
		this.mlike = mlike;
	}
	public int getIsmlike() {
		return ismlike;
	}
	public void setIsmlike(int ismlike) {
		this.ismlike = ismlike;
	}
	
	public int getIsstop() {
		return isstop;
	}
	public void setIsstop(int isstop) {
		this.isstop = isstop;
	}
	public String getScontent() {
		return scontent;
	}
	public void setScontent(String scontent) {
		this.scontent = scontent;
	}
	
	@Override
	public String toString() {
		return "Member [email=" + email + ", pwd=" + pwd + ", name=" + name + ", filesrc=" + filesrc + ", iddate="
				+ iddate + ", profile=" + profile + ", rname=" + rname + ", point=" + point + ", cpseq=" + cpseq
				+ ", cpoint=" + cpoint + ", mpoint=" + mpoint + ", mlike=" + mlike + ", ismlike=" + ismlike
				+ ", isstop=" + isstop + ", scontent=" + scontent + "]";
	}
	
	
}
