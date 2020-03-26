package kr.or.scoop.dto;

public class JJim {
	private int jseq; //찜번호
	private String email; //이메일
	private int moseq; //영화번호
	public int getJseq() {
		return jseq;
	}
	public void setJseq(int jseq) {
		this.jseq = jseq;
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
	
	@Override
	public String toString() {
		return "JJim [jseq=" + jseq + ", email=" + email + ", moseq=" + moseq + "]";
	}
	
}
