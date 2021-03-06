package kr.or.scoop.controller;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import kr.or.scoop.dao.BoardDao;
import kr.or.scoop.dto.RcReply;
import kr.or.scoop.dto.Recommend;
import kr.or.scoop.service.BoardService;

@Controller
public class RecommendController {
	
	@Autowired
	private SqlSession sqlSession;

	@Autowired
	BoardService bService;
	
	//추천게시판 이동
	@RequestMapping(value="recom.do" , method=RequestMethod.GET)
	public String getLike(Model model,Recommend recom) {
		
	  BoardDao dao = sqlSession.getMapper(BoardDao.class); 
	  List<Recommend> rc =  dao.getRecomm(); 
	  model.addAttribute("recom", rc);
		 
		return "recommend/recommend";
		
	}
	
	//추천 게시판 디테일 
	@RequestMapping(value="recomDetail.do" , method=RequestMethod.GET)
	public String DetailLike(Model model,int rcseq,HttpServletRequest request,HttpSession session) {
		String viewpage;
		String email = (String)session.getAttribute("email");
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		Recommend recom = dao.detailRecomm(rcseq);
		List<RcReply> rccom = dao.recomCommentOk(rcseq);
		int count = dao.getrclike(email, rcseq);
		int result = bService.rcrnumUp(rcseq);
		if(result > 0) {
			request.setAttribute("count", count);
			model.addAttribute("rec", recom);	
			model.addAttribute("rccom", rccom);	
			viewpage = "recommend/recommendDetail";
		}else {
			viewpage = "recommend/recommendDetail";
		}
		return viewpage;
	}
	
	//추천글 수정 이동 
	@RequestMapping(value="recomEdit.do" , method=RequestMethod.GET)
	public String EditRecom(Model model,int rcseq,HttpServletRequest request,HttpSession session) {		
		
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		Recommend recom = dao.detailRecomm(rcseq);
		model.addAttribute("recom", recom);	
		
		
		return "recommend/recommendEdit";
	}
	
	//리뷰 글 수정 체크 
	@RequestMapping(value="recomEditCheck.do" , method = RequestMethod.POST)
	public String reviewEditCheck(int rcseq,Recommend recom, HttpServletRequest request) {
		String viewpage;
		CommonsMultipartFile multifile = recom.getFilesrc();
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		String img = dao.getRecomImg(rcseq);
		String filename = multifile.getOriginalFilename();	
		String path = request.getServletContext().getRealPath("/user/recomm");
		String fpath = path + "\\"+ filename; 
		
		if(filename.equals("")) {
			recom.setRcphoto(img);
		}else {
			recom.setRcphoto(filename);
		}
			if(!filename.equals("")) { //실 파일 업로드
				FileOutputStream fs = null;
				try {
					fs = new FileOutputStream(fpath);
				} catch (FileNotFoundException e) {
					e.printStackTrace();
					
				}finally {
					try {
						fs.write(multifile.getBytes());
						fs.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
			
		int result = bService.updateRecom(recom);
		if(result > 0) {
			viewpage = "redirect:/recomDetail.do?rcseq=" + rcseq;
		}else {
			viewpage = "redirect:/recomDetail.do?rcseq=" + rcseq;
		}
		return viewpage;
		
		
	}
	
	//리뷰글 작성
			@RequestMapping(value="writeLike.do",method=RequestMethod.POST)
			public String recomInsert(Recommend recom,HttpServletRequest request,HttpSession session) {
				
				CommonsMultipartFile multifile = recom.getFilesrc();
				String filename = multifile.getOriginalFilename();		
				String path = request.getServletContext().getRealPath("/user/recomm");
				
				String fpath = path + "\\"+ filename; 
				if(filename.equals("")) {
					recom.setRcphoto((String)request.getAttribute("rcphoto"));
				}else {
					recom.setRcphoto(filename);
				}
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
				String viewpage;
				int result = bService.insertRecomm(recom);
				if(result > 0) {
					viewpage= "redirect:/recom.do";
				}else {
					viewpage="redirect:/recom.do";
				}
				return viewpage;
			}
			
			//추천 글 추천수 증가
			@RequestMapping(value="/rclike.do" , method = RequestMethod.POST)
			public String updateRclike(int rcseq,String email,Model model) {
				BoardDao dao = sqlSession.getMapper(BoardDao.class);
				int like = (int)dao.getrclike(email,rcseq);
				int result = 0;
				String viewpage = "";
				int chu = 0;
				if(like > 0) {
					model.addAttribute("on", like);
				}else {
					result = dao.insertRclike(rcseq, email);
					chu = dao.rclikeCount(rcseq);
				}			
			
				if(chu > 0) {
					viewpage = "redirect:/recomDetail.do?rcseq=" + rcseq;
				}else {
					viewpage = "redirect:/recomDetail.do?rcseq=" + rcseq;
				}
				return viewpage;
			}
			
			//내가 작성한 글에서 삭제 할 때 
			@RequestMapping(value="deleteMyRecom.do" ,method = {RequestMethod.GET , RequestMethod.POST})
			public String deleteMyRecom(int rcseq) {
				int result = bService.deleteRecom(rcseq);
				String viewpage;
				if(result > 0) {
					viewpage = "redirect:/writeMyRecom.do";
				}else {
					viewpage = "redirect:/writeMyRecom.do";
				}
				
				return viewpage;
			}
			
			//추천 글 삭제
			@RequestMapping(value="deleteRecom.do" ,method = {RequestMethod.GET , RequestMethod.POST})
			public String deleteRecom(int rcseq) {
				int result = bService.deleteRecom(rcseq);
				String viewpage;
				if(result > 0) {
					viewpage = "redirect:/recom.do";
				}else {
					viewpage = "redirect:/recom.do";
				}
				
				return viewpage;
			}
			
			//내가 작성한 추천글
			@RequestMapping(value = "writeMyRecom.do",method = RequestMethod.GET)
			public String MywriteRecom(String email,HttpSession session,Model model) {
				email = (String)session.getAttribute("email");
				BoardDao dao = sqlSession.getMapper(BoardDao.class);
				List<Recommend> recom = dao.getWriteRecom(email);
				model.addAttribute("recom", recom);
				return "user/Myrecom";
			}
			
			//추천 댓글작성
			@RequestMapping(value = "rcComment.do", method = {RequestMethod.POST,RequestMethod.GET})
			public String reviewComent(int rcseq,String email,String rcrcontent,Model model) {				
				int result = 0;					
				String viewpage = "";
				result = bService.recomComment(rcseq, rcrcontent, email);
				if(result > 0) {					
					viewpage = "redirect:/recomDetail.do?rcseq="+rcseq;				
				}else {
					viewpage = "redirect:/movieDetail.do";	
				}
				return viewpage;
			}
			
			//추천 댓글 삭제
			@RequestMapping(value = "delRecomComment.do",method = {RequestMethod.POST,RequestMethod.GET})
			public String delComment(int rcrseq,Model model) {
				int result = 0;	
				String viewpage = "";
				result = bService.delRecomComment(rcrseq);
				
				if(result > 0) {
					model.addAttribute("ajax","댓글 성공");
					viewpage = "utils/ajax";
					
				}else {
					model.addAttribute("ajax","댓글 실패");
					viewpage = "utils/ajax";
				}
				return viewpage;
			}
	
}
