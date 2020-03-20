package kr.or.scoop.dto;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class Review {
	private int reseq; //리뷰 글번호
	private String retitle; //리뷰 제목
	private String recontent; //리뷰 내용
	private Timestamp retime; //글쓴 시간
	private List<CommonsMultipartFile> files; //리뷰사진 
	private String rephoto; //리뷰사진
	private String email; //작성자 이메일
	private String name; //작성자 이름
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
	
	public List<CommonsMultipartFile> getFiles() {
		return files;
	}
	public void setFiles(List<CommonsMultipartFile> files) {
		this.files = files;
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
	
	@Override
	public String toString() {
		return "Review [reseq=" + reseq + ", retitle=" + retitle + ", recontent=" + recontent + ", retime=" + retime
				+ ", files=" + files + ", rephoto=" + rephoto + ", email=" + email + ", name=" + name + "]";
	}
	

	
}
