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
import kr.or.scoop.dto.Review;
import kr.or.scoop.dto.RvReply;
import kr.or.scoop.service.BoardService;


@Controller
public class ReviewController {
	
	@Autowired
	private SqlSession sqlSession;

	@Autowired
	BoardService bService;
	
	//리뷰 페이지 이동
	@RequestMapping(value="review.do" , method=RequestMethod.GET)
	public String reviewGet(Model model,Review review) {		
	  BoardDao dao = sqlSession.getMapper(BoardDao.class); 
	  List<Review> r =  dao.getReview(); 
	   model.addAttribute("review", r);
	 
		return "review/review";
		
	}
	
	//리뷰 디테일 이동
	@RequestMapping(value="reviewDetail.do",method = RequestMethod.GET)
	public String detailReview(int reseq,Model model,HttpServletRequest request,HttpSession session) {
		String email = (String)session.getAttribute("email");
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		List<RvReply> recom = dao.reviewCommentOk(reseq);
		System.out.println(recom);
		int count = dao.getrelike(email, reseq);
		int result = bService.rernumUp(reseq);
		if(result > 0) {
			request.setAttribute("count", count);
			Review re = dao.selectReview(reseq);
			model.addAttribute("recom", recom);
			model.addAttribute("review", re);
		}else {
			System.out.println("실패");
		}
		
	
		return "review/reviewDetail";
	}
	
	//리뷰 글 추천수 증가
	@RequestMapping(value="/relike.do" , method = RequestMethod.POST)
	public String updateRelike(int reseq,String email,Model model) {
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		int like = (int)dao.getrelike(email,reseq);
		int result = 0;
		String viewpage = "";
		int chu = 0;
		if(like > 0) {
			model.addAttribute("on", like);
		}else {
			result = dao.insertRelike(reseq, email);
			chu = dao.relikeCount(reseq);
		}			
	
		if(chu > 0) {
			viewpage = "redirect:/reviewDetail.do?reseq=" + reseq;
		}else {
			viewpage = "redirect:/reviewDetail.do?reseq=" + reseq;
		}
		return viewpage;
	}
	
	//리뷰 글작성
			@RequestMapping(value="writeReview.do",method= {RequestMethod.POST , RequestMethod.GET})
			public String reviewInsert(Review review,HttpServletRequest request,HttpSession session) {
				String viewpage;
				CommonsMultipartFile multifile = review.getFilesrc();
				System.out.println(multifile.isEmpty());
				String filename = multifile.getOriginalFilename();		
				String path = request.getServletContext().getRealPath("/user/review");
				String img = null;
				String fpath = path + "\\"+ filename; 
				
				if(filename.equals("")) {
					review.setRephoto(img);
				}else {
					review.setRephoto(filename);
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
					
				int result = bService.insertReview(review);
				if(result > 0) {
					viewpage= "redirect:/review.do";
				}else {
					viewpage="redirect:/review.do";
				}
				return viewpage;
			}
			
			//리뷰 댓글작성
			@RequestMapping(value = "reComment.do", method = {RequestMethod.POST,RequestMethod.GET})
			public String reviewComent(int reseq,String email,String rvrcontent,Model model) {				
				int result = 0;					
				String viewpage = "";
				result = bService.reviewComment(reseq,email,rvrcontent);
				if(result > 0) {					
					viewpage = "redirect:/reviewDetail.do?reseq="+reseq;				
				}else {
					viewpage = "redirect:/reCommentOk.do";	
				}
				return viewpage;
			}		
			//리뷰 수정 이동
			@RequestMapping(value="editReview.do",method = RequestMethod.GET)
			public String reviewEdit(int reseq,Model model) {
				BoardDao dao = sqlSession.getMapper(BoardDao.class);
				Review re = dao.selectReview(reseq);
				model.addAttribute("review", re);
				return "review/reviewEdit";
			}
			
			//리뷰 글 수정 체크 
			@RequestMapping(value="reviewEditCheck.do" , method = RequestMethod.POST)
			public String reviewEditCheck(int reseq,Review review, HttpServletRequest request) {
				String viewpage;
				CommonsMultipartFile multifile = review.getFilesrc();
				BoardDao dao = sqlSession.getMapper(BoardDao.class);
				String img = dao.getReviewImg(reseq);
				String filename = multifile.getOriginalFilename();	
				String path = request.getServletContext().getRealPath("/user/review");
				String fpath = path + "\\"+ filename; 
				
				if(filename.equals("")) {
					review.setRephoto(img);
				}else {
					review.setRephoto(filename);
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
					
				int result = bService.updateReview(review);
				if(result > 0) {
					viewpage = "redirect:/reviewDetail.do?reseq=" + reseq;
				}else {
					viewpage = "redirect:/reviewDetail.do?reseq=" + reseq;
				}
				return viewpage;
				
				
			}
			
			//리뷰글 삭제 
			@RequestMapping(value="deleteReview.do",method=RequestMethod.GET)
			public String deleteReview(int reseq) {
				String viewpage;
				int result = bService.deleteReview(reseq);
				
				if(result > 0) {
					viewpage= "redirect:/review.do";
				}else {
					viewpage= "redirect:/review.do";
				}
				
				return viewpage;
			}
			
			//내가 작성한 글에서 리뷰글 삭제
			@RequestMapping(value="deleteMyReview.do", method= {RequestMethod.GET, RequestMethod.POST})
			public String deleteMyReview(int reseq) {
				String viewpage;
				int result = bService.deleteReview(reseq);
				
				if(result > 0) {
					viewpage= "redirect:/writeMyReview.do";
				}else {
					viewpage= "redirect:/writeMyReview.do";
				}
				
				return viewpage;
			}
			
			//내가 작성한 리뷰글
			@RequestMapping(value="writeMyReview.do", method = RequestMethod.GET)
			public String MywriteReview(String email,HttpSession session,Model model) {
				email = (String)session.getAttribute("email");
				BoardDao dao = sqlSession.getMapper(BoardDao.class);
				List<Review> rev = dao.getWriteReview(email);
				model.addAttribute("rev" , rev);
				
				
				return "user/Myreview";	
			}
			
			//리뷰 댓글 삭제
			@RequestMapping(value = "delReviewComment.do",method = {RequestMethod.POST,RequestMethod.GET})
			public String delComment(int rvrseq,Model model) {
				int result = 0;	
				String viewpage = "";
				result = bService.delReviewComment(rvrseq);
				
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
