package kr.or.scoop.dto;

public class History {
	private int hseq;
	private String email;
	private int moseq;
	public int getHseq() {
		return hseq;
	}
	public void setHseq(int hseq) {
		this.hseq = hseq;
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
		return "History [hseq=" + hseq + ", email=" + email + ", moseq=" + moseq + "]";
	}
	
	
	
}
