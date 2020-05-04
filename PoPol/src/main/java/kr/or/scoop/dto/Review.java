package kr.or.scoop.dto;

import java.sql.Timestamp;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class Review {
	private int reseq; //리뷰 글번호
	private int rvseq; //추천 번호
	private String retitle; //리뷰 제목
	private String recontent; //리뷰 내용
	private Timestamp retime; //글쓴 시간
	private CommonsMultipartFile filesrc; //리뷰사진 
	private String rephoto; //리뷰사진
	private String email; //작성자 이메일
	private String name; //작성자 이름
	private int relike; //추천수
	private int rernum; //조회수
	private Timestamp rtime;
	
	
	public int getRvseq() {
		return rvseq;
	}
	public void setRvseq(int rvseq) {
		this.rvseq = rvseq;
	}
	public int getReseq() {
		return reseq;
	}
	public void setReseq(int reseq) {
		this.reseq = reseq;
	}
	public String getRetitle() {
		return retitle;
	}
	public void setRetitle(String retitle) {
		this.retitle = retitle;
	}
	public String getRecontent() {
		return recontent;
	}
	public void setRecontent(String recontent) {
		this.recontent = recontent;
	}
	public Timestamp getRetime() {
		return retime;
	}
	public void setRetime(Timestamp retime) {
		this.retime = retime;
	}
	public CommonsMultipartFile getFilesrc() {
		return filesrc;
	}
	public void setFilesrc(CommonsMultipartFile filesrc) {
		this.filesrc = filesrc;
	}
	public String getRephoto() {
		return rephoto;
	}
	public void setRephoto(String rephoto) {
		this.rephoto = rephoto;
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
	public int getRelike() {
		return relike;
	}
	public void setRelike(int relike) {
		this.relike = relike;
	}
	public int getRernum() {
		return rernum;
	}
	public void setRernum(int rernum) {
		this.rernum = rernum;
	}
	
	public Timestamp getRtime() {
		return rtime;
	}
	public void setRtime(Timestamp rtime) {
		this.rtime = rtime;
	}
	@Override
	public String toString() {
		return "Review [reseq=" + reseq + ", rvseq=" + rvseq + ", retitle=" + retitle + ", recontent=" + recontent
				+ ", retime=" + retime + ", filesrc=" + filesrc + ", rephoto=" + rephoto + ", email=" + email
				+ ", name=" + name + ", relike=" + relike + ", rernum=" + rernum + "]";
	}
	
	
	
}
