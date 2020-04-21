package kr.or.scoop.dto;

import java.sql.Timestamp;

import org.springframework.stereotype.Repository;

@Repository
public class Notice {
	private int noseq; //공지사항 번호 
	private String notitle; //공지사항 제목 
	private String nocontent; //공지사항 내용
	private Timestamp notime; //공지사항 작성시간 
	private String email; //공지사항 작성자
	private int nrnum; //공지사항 조회수
	
	public int getNoseq() {
		return noseq;
	}
	public void setNoseq(int noseq) {
		this.noseq = noseq;
	}
	public String getNotitle() {
		return notitle;
	}
	public void setNotitle(String notitle) {
		this.notitle = notitle;
	}
	public String getNocontent() {
		return nocontent;
	}
	public void setNocontent(String nocontent) {
		this.nocontent = nocontent;
	}
	public Timestamp getNotime() {
		return notime;
	}
	public void setNotime(Timestamp notime) {
		this.notime = notime;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getNrnum() {
		return nrnum;
	}
	public void setNrnum(int nrnum) {
		this.nrnum = nrnum;
	}
	
	@Override
	public String toString() {
		return "Notice [noseq=" + noseq + ", notitle=" + notitle + ", nocontent=" + nocontent + ", notime=" + notime
				+ ", email=" + email + ", nrnum=" + nrnum + "]";
	}
	
	
}
