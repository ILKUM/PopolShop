package kr.or.scoop.dto;

public class Recoment {
	private int rseq; //댓글번호
	private String rcontent; //댓글 내용
 	private String rtime; //댓글 작성시간
	private String email; //댓글 이메일
	private int moseq; //영화 번호
	private int reseq; //리뷰글 번호
	private int rcseq; //추천글 번호
	private String name; //작성자 이름
	
	public int getRseq() {
		return rseq;
	}
	public void setRseq(int rseq) {
		this.rseq = rseq;
	}
	public String getRcontent() {
		return rcontent;
	}
	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
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
	
	public int getRcseq() {
		return rcseq;
	}
	public void setRcseq(int rcseq) {
		this.rcseq = rcseq;
	}
	
	public int getReseq() {
		return reseq;
	}
	public void setReseq(int reseq) {
		this.reseq = reseq;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getRtime() {
		return rtime;
	}
	public void setRtime(String rtime) {
		this.rtime = rtime;
	}
	@Override
	public String toString() {
		return "Recoment [rseq=" + rseq + ", rcontent=" + rcontent + ", rtime=" + rtime + ", email=" + email
				+ ", moseq=" + moseq + ", reseq=" + reseq + ", rcseq=" + rcseq + ", name=" + name + "]";
	}

	
}
