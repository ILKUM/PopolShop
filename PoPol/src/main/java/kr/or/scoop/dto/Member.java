package kr.or.scoop.dto;

import java.sql.Timestamp;

import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
//멤버
@Repository
public class Member {
	private String email; //이메일
	private String pwd; //비밀번호
	private String name; //이름
	private CommonsMultipartFile filesrc; //프로필사진
	private Timestamp idtime; //가입 시간
	private String profile; //프로필 사진 파일 이름
	
	public void setIdtime(Timestamp idtime) {
		this.idtime = idtime;
	}

	public Timestamp getIdtime() {
		return idtime;
	}



	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public CommonsMultipartFile getFilesrc() {
		return filesrc;
	}
	public void setFilesrc(CommonsMultipartFile filesrc) {
		this.filesrc = filesrc;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}

}
