package kr.or.scoop.controller;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.velocity.VelocityEngineFactoryBean;
import org.springframework.ui.velocity.VelocityEngineUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import kr.or.scoop.dao.MemberDao;
import kr.or.scoop.dto.Member;
import kr.or.scoop.dto.Role;
import kr.or.scoop.service.MemberService;
import kr.or.scoop.utils.Mail;

@Controller
public class MemberController {
	
	
	@Autowired
	private MemberService service;

	@Autowired
	private SqlSession sqlsession;

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private VelocityEngineFactoryBean velocityEngineFactoryBean;

	// 일반 회원가입 인증
	@RequestMapping(value = "frontpage.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String register(Member member, HttpSession session, Mail mail, HttpServletResponse response) throws ClassNotFoundException, SQLException {
		response.setContentType("text/html; charset=UTF-8");
		int result = 0;
		String viewpage = "";
		session.setAttribute("checkemail", member.getEmail());
		session.setAttribute("checkpwd", this.bCryptPasswordEncoder.encode(member.getPwd()));
		session.setAttribute("checkname", member.getName());
		member.setPwd(this.bCryptPasswordEncoder.encode(member.getPwd()));
		int number = (int) ((Math.random() * 99999) + 100000);
		String temp = String.valueOf(number);
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			
			Map model = new HashMap();
			model.put("title", "협업공간 SCOOP 회원가입 인증 이메일입니다");
			String mailBody = VelocityEngineUtils.mergeTemplateIntoString(
					velocityEngineFactoryBean.createVelocityEngine(), "emailTemplate.vm", "UTF-8", model);
			messageHelper.setFrom("chdl1229@gmail.com");
			messageHelper.setTo(member.getEmail());
			messageHelper.setSubject("협업공간 SCOOP 회원가입 인증 이메일입니다");
			messageHelper.setText(mailBody, true);
			mailSender.send(message); //회원가입 인증 메일 보내기
			PrintWriter out = response.getWriter();
			out.println("<script>Swal.fire({" + 
					"							        	    		  title: \"인증 이메일 발송\"," + 
					"							        	    		  text: \"이메일로 인증 이메일을 발송했습니다. 30분 이내에 인증해주세요\"," + 
					"							        	    		  icon: \"info\"," + 
					"							        	    		  button: \"확인\"" + 
					"							        	    		})</script>");
			out.flush(); 
			viewpage = "utils/signUp";
		} catch (Exception e) {
			viewpage = "index";
			PrintWriter out;
			try {
				out = response.getWriter();
				out.println("<script>Swal.fire({\r\n" + 
						"							        	    		  title: \"인증 이메일 발송 중 에러\",\r\n" + 
						"							        	    		  text: \"이메일로 인증 이메일을 발송하던 도중 에러가 발생했습니다 이메일을 확인해주세요\",\r\n" + 
						"							        	    		  icon: \"error\",\r\n" + 
						"							        	    		  button: \"확인\"\r\n" + 
						"							        	    		})</script>");
				out.flush();
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
		}
		return viewpage; 

	}

	// 일반 회원가입 인증
	@RequestMapping(value = "registerOk.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String normalInsert(Member member, HttpSession session, HttpServletResponse response) throws ClassNotFoundException, SQLException {
		response.setContentType("text/html; charset=UTF-8");
		int result = 0;
		String viewpage = "";
		member.setPwd((String)session.getAttribute("checkpwd"));
		member.setEmail((String)session.getAttribute("checkemail"));
		member.setName((String)session.getAttribute("checkname"));
		
		int emailcheck = service.idCheck((String)session.getAttribute("checkemail"));
		
		if(emailcheck == 0) {
			result = service.insertMember(member);
		}
		

		if (result > 0) {

			viewpage = "redirect:/index.do";
			session.removeAttribute("checkpwd");
			session.removeAttribute("checkemail");
			session.removeAttribute("checkname");
		} else {
			
			viewpage = "redirect:/index.do";
		}

		return viewpage; // 주의 (website/index.htm

	}

	// 일반회원 로그인
	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public String login(String email, String pwd, HttpSession session, HttpServletResponse response) {
		MemberDao dao = sqlsession.getMapper(MemberDao.class);
		
		int result = 0;
		String viewpage = "";
		result = service.loginMember(email, pwd);
		if (result > 0) {
			viewpage = "redirect:/userindex.do";
			session.setAttribute("email", email);
			session.setAttribute("kind", "normal");
		} else {
			viewpage = "utils/loginFail";
		}

		return viewpage;
	}


	// 로그인 성공후 메인페이지 이동
	@RequestMapping(value = "/userindex.do", method = RequestMethod.GET)
	public String userindex(@RequestParam(required = false, name="lang") String language, HttpSession session, 
				HttpServletRequest request, HttpServletResponse response, Model model) {
		
		String email = "";
		
		email = (String)session.getAttribute("email");
		MemberDao memberdao = sqlsession.getMapper(MemberDao.class);
		Member member = memberdao.getMember((String)session.getAttribute("email")); //로그인한 사람 정보 불러오기
		Role role = memberdao.getRole(email); //로그인한 사람 등급 불러오기
		String img = memberdao.getProfile(email); //로그인한 사람 프로필사진 불러오기
		
		session.setAttribute("name", member.getName()); //이름 세션저장
		session.setAttribute("img",img); //프로필사진 세션저장
		session.setAttribute("role", role.getRname()); //등급 세션저장
		
		return "user/dashBoard";
	}
	
	// 로그아웃
	@RequestMapping(value = "/logout.do")
	public String logout(HttpSession session, HttpServletResponse response) {
		String viewpage = "";
		viewpage = "redirect:/index.do";
		session.invalidate();
		return viewpage;

	}


	// 비밀번호 찾기 메일 발송
	@RequestMapping(value="/forgotpwd.do")
	@ResponseBody
	public String forgotPwd(Mail mail, HttpServletRequest request, HttpServletResponse response, HttpSession session, String email) {
		response.setContentType("text/html; charset=UTF-8");
		session.setAttribute("email", email);
		
		String viewpage = "";
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			
			Map model = new HashMap();
			model.put("title", "협업공간 SCOOP 본인 인증 이메일입니다");
			// model.put("password", temp);
			String mailBody = VelocityEngineUtils.mergeTemplateIntoString(velocityEngineFactoryBean.createVelocityEngine(), "forgotPwd.vm", "UTF-8", model);
			messageHelper.setFrom("leeyong1321@gmail.com");
			messageHelper.setTo(email);
			messageHelper.setSubject("회원님의 SCOOP 계정의 본인 인증 이메일입니다");
			messageHelper.setText(mailBody, true);
			mailSender.send(message);
			
			viewpage = "index";
			
		} catch (Exception e1) {
			e1.printStackTrace();
			try {
			viewpage = "index";
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return viewpage;
	}
	
	// 이메일 인증 확인
	@RequestMapping(value="/emailCertified.do")
	public String emailCertified() {
		return "certified/emailCertified";
	}
	
	// 비밀번효 변경 페이지
	@RequestMapping(value="/changePwd.do")
	public String ChangePwd() {
		return "user/forgotPwd";
	}
	
	// 비밀번호 변경 완료
	@RequestMapping("changePwdOk.do")
	public String changePwdOk(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		String pwd = this.bCryptPasswordEncoder.encode(request.getParameter("pwd"));
		String email = (String)session.getAttribute("email");
		
		
		MemberDao dao = sqlsession.getMapper(MemberDao.class);
		int result = dao.changePassword(pwd, email);
		
		String viewpage = "";
		if(result > 0) {
			viewpage = "utils/pwdOk";
		}else {
			viewpage = "utils/pwdFail";
		}
		
		session.removeAttribute("email");
		
		return viewpage;
	}
	
	// 회원가입 인증
	@RequestMapping(value = "/certified.do")
	public String certified() {
		return "certified/Certified";
	}
	
	//회원정보수정 페이지 이동
	@RequestMapping(value="memberEdit.do" , method = RequestMethod.GET)
	public String EditProfile(Model model,HttpSession session) {
		MemberDao dao = sqlsession.getMapper(MemberDao.class);
		Member member = dao.getMember((String)session.getAttribute("email"));
		
		String pwd = this.bCryptPasswordEncoder.encode(member.getPwd());
		
		model.addAttribute("member",member);
		model.addAttribute("pass",pwd);
		session.setAttribute("img", member.getProfile());
		
		return "user/app-profile";
		
	}
	
	//회원정보 수정
	@RequestMapping(value="editCheck.do" , method = RequestMethod.POST)
	public String UpdateProfile(Member member,HttpServletRequest request,HttpSession session) {
		    
				
			CommonsMultipartFile multifile = member.getFilesrc();
			String filename = multifile.getOriginalFilename();
			if(filename.equals("")) {
				member.setProfile((String)session.getAttribute("img"));
			}else {
				member.setProfile(filename);
			}
			String path = request.getServletContext().getRealPath("/user/upload");
			
			String fpath = path + "\\"+ filename; 
				
				if(!filename.equals("")) { //실 파일 업로드
					FileOutputStream fs = null;
					try {
						fs = new FileOutputStream(fpath);
					} catch (FileNotFoundException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
						
					}finally {
						try {
							fs.write(multifile.getBytes());
							fs.close();
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
				}
			
		   MemberDao dao = sqlsession.getMapper(MemberDao.class);
		if(member.getPwd().equals("")) {
			Member checkmember = dao.getMember((String)session.getAttribute("email"));
			member.setPwd(checkmember.getPwd());
			dao.updateMember(member);
		} else {
			member.setPwd(this.bCryptPasswordEncoder.encode(member.getPwd()));
			dao.updateMember(member);
		}
		return "redirect:/userindex.do";
	}
	
	// 결재페이지
	@RequestMapping(value = "/paymentPage.do")
	public String paymentPage() {
		return "user/Payment";
	}
	
	//알림 페이지 
	@RequestMapping(value="app-alram.do", method=RequestMethod.GET)
	public String alarmpage() {
		return "user/app-alram";
	}
	
	//회원 등급 수정
	@RequestMapping(value="updateRole.do", method=RequestMethod.POST)
	public String updateRole(HttpSession session) {
		int result = 0;
		String viewpage;
		result = service.updateRole((String)session.getAttribute("email"));
		if(result > 0) {
			viewpage = "redirect:/paymentPage.do";
		}else {
			viewpage = "user/userindex";
		}
		return viewpage;
		
	}
	
	// 네이버이메일 인증 확인
	@RequestMapping(value = "/naverCertified.do")
	public String naverCertified() {
		return "utils/naverCertified";
	}
	
	// 아이디 중복 확인
	@RequestMapping(value = "/idOverlab.do")
	@ResponseBody
	public int emailCheck(String email) {
		int result = 0;
		MemberDao dao = sqlsession.getMapper(MemberDao.class);
		result = dao.idCheck(email);
		return result;
	}
	
}