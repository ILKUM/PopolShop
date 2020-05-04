package kr.or.scoop.dto;

import java.sql.Timestamp;

public class RvReply {
	private int reseq; //리뷰글 번호
	private int rvrseq; //리뷰댓글번호
	private String rvrcontent; //리뷰댓글 내용
 	private Timestamp rvrtime; //리뷰댓글 작성시간
	private String email; //리뷰댓글 이메일
	private String name; //리뷰작성자 이름
	
	
	public int getReseq() {
		return reseq;
	}
	public void setReseq(int reseq) {
		this.reseq = reseq;
	}
	public int getRvrseq() {
		return rvrseq;
	}
	public void setRvrseq(int rvrseq) {
		this.rvrseq = rvrseq;
	}
	public String getRvrcontent() {
		return rvrcontent;
	}
	public void setRvrcontent(String rvrcontent) {
		this.rvrcontent = rvrcontent;
	}
	public Timestamp getRvrtime() {
		return rvrtime;
	}
	public void setRvrtime(Timestamp rvrtime) {
		this.rvrtime = rvrtime;
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
		return "RvReply [reseq=" + reseq + ", rvrseq=" + rvrseq + ", rvrcontent=" + rvrcontent + ", rvrtime=" + rvrtime
				+ ", email=" + email + ", name=" + name + "]";
	}
	
	
	
	
}
