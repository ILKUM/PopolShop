package kr.or.scoop.dao;

import org.apache.ibatis.annotations.Param;

import kr.or.scoop.dto.Member;
import kr.or.scoop.dto.Role;


public interface MemberDao {
	
	//회원정보 
	public Member getMember(String email);
	
	// 일반회원 회원가입
	public int insertMember(Member member);
	
	// 로그인 검증
	public int loginCheck(String email, String pwd);
	
	// 회원 패스워드 암호화 체크
	public Member pwdCheck(String email);
	
	// 아이디 중복체크
	public int idCheck(String email);
	
	//회원 수정
	public int updateMember(Member member);
	
	//권한 체크
	public Role getRole(String email);
	
	//비밀번호 변경
	public int changePassword(@Param("pwd")String pwd, @Param("email")String email);

	//롤 권한 변경
	public int updateRole(String email);
	
	//프로필 사진
	public String getProfile(String email);
	
	//회원 탈퇴 
	public int deleteMember(String email);
	
}
