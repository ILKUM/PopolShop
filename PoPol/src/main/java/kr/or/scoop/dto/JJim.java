package kr.or.scoop.dto;

public class JJim {
	private int jseq; //찜번호
	private String email; //이메일
	private int moseq; //영화번호
	private String moname; //영화 제목
	private String mocontent; //영화 설명
	private String mophoto;
	private int molike; //영화 추천수	
	private int monum; //영화 분류코드
	private String modate; //영화 개봉날짜
	private String modirector; //영화 감독
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
	
	@Override
	public String toString() {
		return "JJim [jseq=" + jseq + ", email=" + email + ", moseq=" + moseq + ", moname=" + moname + ", mocontent="
				+ mocontent + ", mophoto=" + mophoto + ", molike=" + molike + ", monum=" + monum + ", modate=" + modate
				+ ", modirector=" + modirector + "]";
	}
	
	
	
	
}
