package kr.or.scoop.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import kr.or.scoop.dao.MemberDao;
import kr.or.scoop.dto.Member;

@Service
public class MemberService {
	
	@Autowired
	private SqlSession sqlsession;
	
	@Autowired 
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	public PasswordEncoder passwordEncoder;
	
	//회원가입
	public int insertMember(Member member){
		int result = 0;
		int isIdCheck = idCheck(member.getEmail());
		if(isIdCheck>0) {
		} else {
			MemberDao dao = sqlsession.getMapper(MemberDao.class);
			result = dao.insertMember(member);
		}
		
		return result;
	}
	
	//로그인
	public int loginMember(String email, String pwd) {
		int result = 0;
		try {
			Member member = pwdCheck(email);
			String encodePwd = member.getPwd();
			boolean istrue = bCryptPasswordEncoder.matches(pwd, encodePwd);
			System.out.println("istrue");
			MemberDao dao = sqlsession.getMapper(MemberDao.class);
			if(istrue) {
				result = dao.loginCheck(email,encodePwd);
			} else {
				result = 0;
			}
		} catch (Exception e) {
			result = 0;
		}
		return result;
		
	}
	
	// 비밀번호 확인 
	public Member pwdCheck(String email) {
		Member member = null;
		MemberDao dao = sqlsession.getMapper(MemberDao.class);
		member = dao.pwdCheck(email);
		return member;
	}
	
	//아이디 중복 체크 
	public int idCheck(String email) {
		int result = 0;
		MemberDao dao = sqlsession.getMapper(MemberDao.class);
		result = dao.idCheck(email);
		return result;
	}
	
	//유료회원 무료회원 등록
	public int updateRole(String email) {
		int result = 0;
		MemberDao dao = sqlsession.getMapper(MemberDao.class);
		result = dao.updateRole(email);
		return result;
	}
	
	//회원 탈퇴
	public int deleteMember(String email) {
		int result = 0;
		MemberDao dao = sqlsession.getMapper(MemberDao.class);
		result = dao.deleteMember(email);
		
		return result;
	}
	
	//회원 강퇴
	public int banMember(String email) {
		int result = 0;
		MemberDao dao = sqlsession.getMapper(MemberDao.class);
		result = dao.banMember(email);
		return result;
	}
	
	
	public int updatePoint(String email,int mpoint) {
		int result = 0;
		MemberDao dao = sqlsession.getMapper(MemberDao.class);
		result = dao.updatePoint(email,mpoint);
		return result;
	}
	
	//추천여부 증가
	public int updateIsmlike(String email) {
		int result = 0;
		MemberDao dao = sqlsession.getMapper(MemberDao.class);
		result = dao.myMlike(email);
		return result;
	}
	
}
