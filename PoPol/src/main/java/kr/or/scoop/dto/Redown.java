package kr.or.scoop.dto;

import java.sql.Timestamp;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class Redown {
	private int rdseq; //다운받은번호
	private String email; //이메일
	private int moseq; //영화 글번호
	private int mcseq; //영화 추천방지 번호
	private String moname; //영화 제목
	private String mocontent; //영화 설명
	private CommonsMultipartFile filesrc; //영화사진
	private String mophoto; //영화 사진
	private int molike; //영화 추천수	
	private int monum; //영화 분류코드
	private String modate; //영화 개봉날짜
	private String modirector; //영화 감독
	private int iswish; //위시리스트 여부
	private int mpoint; //영화 가격
	private Timestamp downtime; //다운받은시간
	
	public int getRdseq() {
		return rdseq;
	}
	public void setRdseq(int rdseq) {
		this.rdseq = rdseq;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getMoseq() {
		return moseq;
	}
	public void setMoseq(int moseq) {
		this.moseq = moseq;
	}
	public int getMcseq() {
		return mcseq;
	}
	public void setMcseq(int mcseq) {
		this.mcseq = mcseq;
	}
	public String getMoname() {
		return moname;
	}
	public void setMoname(String moname) {
		this.moname = moname;
	}
	public String getMocontent() {
		return mocontent;
	}
	public void setMocontent(String mocontent) {
		this.mocontent = mocontent;
	}
	public CommonsMultipartFile getFilesrc() {
		return filesrc;
	}
	public void setFilesrc(CommonsMultipartFile filesrc) {
		this.filesrc = filesrc;
	}
	public String getMophoto() {
		return mophoto;
	}
	public void setMophoto(String mophoto) {
		this.mophoto = mophoto;
	}
	public int getMolike() {
		return molike;
	}
	public void setMolike(int molike) {
		this.molike = molike;
	}
	public int getMonum() {
		return monum;
	}
	public void setMonum(int monum) {
		this.monum = monum;
	}
	public String getModate() {
		return modate;
	}
	public void setModate(String modate) {
		this.modate = modate;
	}
	public String getModirector() {
		return modirector;
	}
	public void setModirector(String modirector) {
		this.modirector = modirector;
	}
	public int getIswish() {
		return iswish;
	}
	public void setIswish(int iswish) {
		this.iswish = iswish;
	}
	public int getMpoint() {
		return mpoint;
	}
	public void setMpoint(int mpoint) {
		this.mpoint = mpoint;
	}
	public Timestamp getDowntime() {
		return downtime;
	}
	public void setDowntime(Timestamp downtime) {
		this.downtime = downtime;
	}
	
	@Override
	public String toString() {
		return "Redown [rdseq=" + rdseq + ", email=" + email + ", moseq=" + moseq + ", mcseq=" + mcseq + ", moname="
				+ moname + ", mocontent=" + mocontent + ", filesrc=" + filesrc + ", mophoto=" + mophoto + ", molike="
				+ molike + ", monum=" + monum + ", modate=" + modate + ", modirector=" + modirector + ", iswish="
				+ iswish + ", mpoint=" + mpoint + ", downtime=" + downtime + "]";
	}
	
	
	
}
