package kr.or.scoop.dto;

import java.sql.Timestamp;

public class RcReply {
	private int rcseq; //추천 글 번호
	private int rcrseq; //추천댓글번호
	private String rcrcontent; //추천댓글 내용
 	private Timestamp rcrtime; //추천댓글 작성시간
 	private String email; //추천댓글 이메일
	private String name; //추천작성자 이름
	public int getRcseq() {
		return rcseq;
	}
	public void setRcseq(int rcseq) {
		this.rcseq = rcseq;
	}
	public int getRcrseq() {
		return rcrseq;
	}
	public void setRcrseq(int rcrseq) {
		this.rcrseq = rcrseq;
	}
	public String getRcrcontent() {
		return rcrcontent;
	}
	public void setRcrcontent(String rcrcontent) {
		this.rcrcontent = rcrcontent;
	}
	public Timestamp getRcrtime() {
		return rcrtime;
	}
	public void setRcrtime(Timestamp rcrtime) {
		this.rcrtime = rcrtime;
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
	
	@Override
	public String toString() {
		return "RcReply [rcseq=" + rcseq + ", rcrseq=" + rcrseq + ", rcrcontent=" + rcrcontent + ", rcrtime=" + rcrtime
				+ ", email=" + email + ", name=" + name + "]";
	}
	
	
 	
}
