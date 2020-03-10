package kr.or.scoop.dto;

import java.sql.Timestamp;

import org.springframework.stereotype.Repository;

@Repository
public class Notice {
	private int noseq; //공지사항 번호 
	private String notitle; //공지사항 제목 
	private String nocontent; //공지사항 내용
	private Timestamp notime; //공지사항 작성시간 
	private String nwriter; //공지사항 작성자
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
	public String getNwriter() {
		return nwriter;
	}
	public void setNwriter(String nwriter) {
		this.nwriter = nwriter;
	}
	@Override
	public String toString() {
		return "Notice [noseq=" + noseq + ", notitle=" + notitle + ", nocontent=" + nocontent + ", notime=" + notime
				+ ", nwriter=" + nwriter + "]";
	}
	
	
	
}
