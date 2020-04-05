package kr.or.scoop.dto;

import java.sql.Timestamp;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class Recommend {
	private int rcseq; //추천글번호
	private String rctitle; //추천글제목
	private String rccontent; //추천글내용
	private CommonsMultipartFile filesrc;
	private String rcphoto; //추천사진
	private Timestamp rctime; //추천글쓴시간
	private String email; //글쓴이메일
	private int rclike; //추천수
	private String name; //글쓴이 이름
	private int rcrnum; //조회수
	
	public int getRcseq() {
		return rcseq;
	}
	public void setRcseq(int rcseq) {
		this.rcseq = rcseq;
	}
	public String getRctitle() {
		return rctitle;
	}
	public void setRctitle(String rctitle) {
		this.rctitle = rctitle;
	}
	public String getRccontent() {
		return rccontent;
	}
	public void setRccontent(String rccontent) {
		this.rccontent = rccontent;
	}
	public String getRcphoto() {
		return rcphoto;
	}
	public void setRcphoto(String rcphoto) {
		this.rcphoto = rcphoto;
	}
	public Timestamp getRctime() {
		return rctime;
	}
	public void setRctime(Timestamp rctime) {
		this.rctime = rctime;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getRclike() {
		return rclike;
	}
	public void setRclike(int rclike) {
		this.rclike = rclike;
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
	public int getRcrnum() {
		return rcrnum;
	}
	public void setRcrnum(int rcrnum) {
		this.rcrnum = rcrnum;
	}
	@Override
	public String toString() {
		return "Recommend [rcseq=" + rcseq + ", rctitle=" + rctitle + ", rccontent=" + rccontent + ", filesrc="
				+ filesrc + ", rcphoto=" + rcphoto + ", rctime=" + rctime + ", email=" + email + ", rclike=" + rclike
				+ ", name=" + name + ", rcrnum=" + rcrnum + "]";
	}
	
	
	
}
