package kr.or.scoop.dto;

import java.sql.Timestamp;

public class FileReply {
	private int fseq; //파일 글 번호
	private int frseq; //파일 댓글번호
	private String frcontent; //파일 댓글내용 
	private Timestamp frtime; //파일 댓글 작성시간
	private String email; //작성자 이메일
	private String profile; //작성자 이미지
	private String name; //작성자 닉네임
	
	public int getFseq() {
		return fseq;
	}
	public void setFseq(int fseq) {
		this.fseq = fseq;
	}
	public int getFrseq() {
		return frseq;
	}
	public void setFrseq(int frseq) {
		this.frseq = frseq;
	}
	public String getFrcontent() {
		return frcontent;
	}
	public void setFrcontent(String frcontent) {
		this.frcontent = frcontent;
	}
	public Timestamp getFrtime() {
		return frtime;
	}
	public void setFrtime(Timestamp frtime) {
		this.frtime = frtime;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Override
	public String toString() {
		return "FileReply [fseq=" + fseq + ", frseq=" + frseq + ", frcontent=" + frcontent + ", frtime=" + frtime
				+ ", email=" + email + ", profile=" + profile + ", name=" + name + "]";
	}
	
	
	
}
