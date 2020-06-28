package kr.or.scoop.dto;

import java.sql.Timestamp;

public class MoReply {
	private int morseq; //영화댓글번호
	private String morcontent; //영화댓글 내용
 	private Timestamp mortime; //영화댓글 작성시간
 	private String email; //영화댓글 작성자
 	private String name; //영화댓글 작성자 이름
 	private int moseq; //영화번호
 	private String profile; //프로필 이미지
 	
	public int getMorseq() {
		return morseq;
	}
	public void setMorseq(int morseq) {
		this.morseq = morseq;
	}
	public String getMorcontent() {
		return morcontent;
	}
	public void setMorcontent(String morcontent) {
		this.morcontent = morcontent;
	}
	public Timestamp getMortime() {
		return mortime;
	}
	public void setMortime(Timestamp mortime) {
		this.mortime = mortime;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getMoseq() {
		return moseq;
	}
	public void setMoseq(int moseq) {
		this.moseq = moseq;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	
	@Override
	public String toString() {
		return "MoReply [morseq=" + morseq + ", morcontent=" + morcontent + ", mortime=" + mortime + ", email=" + email
				+ ", name=" + name + ", moseq=" + moseq + ", profile=" + profile + "]";
	}
	
	
 	
 	
}
