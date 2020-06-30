package kr.or.scoop.dto;

import java.sql.Timestamp;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class File {
	private int fseq; //파일글번호
	private String ftitle; //파일 게시판 제목
	private String fcontent;//파일게시판 내용
	private Timestamp ftime; //글작성시간
	private String filename; //자료이름
	private CommonsMultipartFile filesrc; //자료
	private int fdnum; //파일 다운횟수
	private int frnum; //파일 글 조횟수
	private int flike; //파일 글 추천수
	private String email; // 작성자 
	private String name; //작성자 닉네임
	private int fmseq; //추천한 멤버번호
	private int frseq; //덧글번호
	private String frcontent; //덧글내용 
	private Timestamp frtime; //덧글 작성시간
	
	
	public int getFseq() {
		return fseq;
	}
	public void setFseq(int fseq) {
		this.fseq = fseq;
	}
	public String getFtitle() {
		return ftitle;
	}
	public void setFtitle(String ftitle) {
		this.ftitle = ftitle;
	}
	public String getFcontent() {
		return fcontent;
	}
	public void setFcontent(String fcontent) {
		this.fcontent = fcontent;
	}
	public Timestamp getFtime() {
		return ftime;
	}
	public void setFtime(Timestamp ftime) {
		this.ftime = ftime;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public CommonsMultipartFile getFilesrc() {
		return filesrc;
	}
	public void setFilesrc(CommonsMultipartFile filesrc) {
		this.filesrc = filesrc;
	}
	public int getFdnum() {
		return fdnum;
	}
	public void setFdnum(int fdnum) {
		this.fdnum = fdnum;
	}
	public int getFrnum() {
		return frnum;
	}
	public void setFrnum(int frnum) {
		this.frnum = frnum;
	}
	public int getFlike() {
		return flike;
	}
	public void setFlike(int flike) {
		this.flike = flike;
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
	public int getFmseq() {
		return fmseq;
	}
	public void setFmseq(int fmseq) {
		this.fmseq = fmseq;
	}
	public int getFrseq() {
		return frseq;
	}
	public void setFrseq(int frseq) {
		this.frseq = frseq;
	}
	public String getFrcontent() {
		return frcontent;
	}
	public void setFrcontent(String frcontent) {
		this.frcontent = frcontent;
	}
	public Timestamp getFrtime() {
		return frtime;
	}
	public void setFrtime(Timestamp frtime) {
		this.frtime = frtime;
	}
	@Override
	public String toString() {
		return "File [fseq=" + fseq + ", ftitle=" + ftitle + ", fcontent=" + fcontent + ", ftime=" + ftime
				+ ", filename=" + filename + ", filesrc=" + filesrc + ", fdnum=" + fdnum + ", frnum=" + frnum
				+ ", flike=" + flike + ", email=" + email + ", name=" + name + ", fmseq=" + fmseq + ", frseq=" + frseq
				+ ", frcontent=" + frcontent + ", frtime=" + frtime + "]";
	}
	
	
	
	
	
}
