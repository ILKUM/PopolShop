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
import kr.or.scoop.dao.MemberDao;
import kr.or.scoop.dao.MovieDao;
import kr.or.scoop.dao.NoticeDao;
import kr.or.scoop.dto.JJim;
import kr.or.scoop.dto.Movie;
import kr.or.scoop.dto.Notice;
import kr.or.scoop.dto.Recommend;
import kr.or.scoop.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	BoardService bService;
	
	//전체 공지사항 불러오기
		@RequestMapping(value="notice.do" , method = RequestMethod.GET)
		public String noticeJoin(Notice notice, Model model) {
			NoticeDao dao = sqlSession.getMapper(NoticeDao.class);
			List<Notice> n = dao.getNotice();
			for(int i=0; i<n.size();i++) {
				n.get(i).setNocontent(n.get(i).getNocontent().replace("<br>", " ")); //<br>을 띄어쓰기로 치환해서 보여줌
			}
			model.addAttribute("notice",n);
			return "notice/notice";
		}
		
		//공지사항 작성
		@RequestMapping(value="noticeWrite.do" , method=RequestMethod.POST)
		public String noticeWrite(Notice notice) {
			int result = 0;
			String viewpage;
			notice.setNocontent(notice.getNocontent().replace("\r\n", "<br>"));
			result = bService.insertNotice(notice);//공지사항 작성
			
			if(result > 0) {
				viewpage = "redirect:/notice.do";
			}else {
				viewpage = "user/userindex";
			}
			
			return viewpage;
		
		}
		
		//공지사항 디테일
		@RequestMapping(value="noticeDetail.do", method = RequestMethod.GET)
		public String noticeDetail(int noseq,Model model) {
			String viewpage = "";
			int result = 0;
			NoticeDao dao = sqlSession.getMapper(NoticeDao.class);
			result = bService.nrnumUp(noseq);
			if(result > 0) {
				Notice notice = dao.detailNotice(noseq); //공지사항 디테일
				model.addAttribute("notice",notice);	
				viewpage = "notice/noticeDetail";
			}else {
				System.out.println("실패");
			}
			
			return viewpage;
		}
		
		//공지사항 삭제
		@RequestMapping(value="deleteNoitce.do",method = RequestMethod.POST)
		public String noticeDelete(int noseq) {
			int result = 0;
			String viewpage;
			NoticeDao dao = sqlSession.getMapper(NoticeDao.class);
			result = dao.deleteNotice(noseq);
			if(result > 0) {
				viewpage = "redirect:/notice.do";
			}else {
				viewpage = "redirect:/noticeDetail.do?noseq"+noseq;
			}
			return viewpage;
			
		}
		
		//영화 추가 
		@RequestMapping(value="insertMovie.do",method = {RequestMethod.POST , RequestMethod.GET})
		public String movieInsert(Movie movie , HttpServletRequest request , HttpSession session) {
			   			String viewpage;
						CommonsMultipartFile multifile = movie.getFilesrc();
						String filename = multifile.getOriginalFilename();		
						String path = request.getServletContext().getRealPath("/user/movie");
						
						String fpath = path + "\\"+ filename; 
						if(filename.equals("")) {
							movie.setMophoto((String)session.getAttribute("img"));
						}else {
							movie.setMophoto(filename);
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
							
					   MovieDao dao = sqlSession.getMapper(MovieDao.class);
					   int result = dao.insertMovie(movie);
					   if(result > 0) {
						   viewpage = "redirect:/userindex.do";
					   }else {
						   viewpage = "redirect:/userindex.do";
					   }
					   
					   return viewpage;
		}
		
		//한국영화 이동
		@RequestMapping(value="koreaGet.do",method = RequestMethod.GET)
		public String koreaGet(Movie movie , Model model,HttpSession session,JJim jjim) {
			MovieDao dao = sqlSession.getMapper(MovieDao.class);
			String email = (String) session.getAttribute("email");
			List<Movie> m = dao.getKorea();
			List<JJim> jjimlist = dao.getMovieJJim(email);
			model.addAttribute("movie",m);
			model.addAttribute("jjimlist",jjimlist);
			return "movie/movie";
		}
		
		//미국영화 이동
		@RequestMapping(value="americanGet.do",method = RequestMethod.GET)
		public String americanGet(Movie movie , Model model,HttpSession session,JJim jjim) {
			MovieDao dao = sqlSession.getMapper(MovieDao.class);
			String email = (String) session.getAttribute("email");
			List<Movie> m = dao.getAmerican();
			List<JJim> jjimlist = dao.getMovieJJim(email);
			model.addAttribute("movie",m);
			model.addAttribute("jjimlist",jjimlist);
			return "movie/movie";
		}
		
		//중국영화 이동
		@RequestMapping(value="chinaGet.do",method = RequestMethod.GET)
		public String chinaGet(Movie movie , Model model,HttpSession session,JJim jjim) {
			MovieDao dao = sqlSession.getMapper(MovieDao.class);
			String email = (String) session.getAttribute("email");
			List<Movie> m = dao.getChina();
			List<JJim> jjimlist = dao.getMovieJJim(email);
			model.addAttribute("movie",m);
			model.addAttribute("jjimlist",jjimlist);
			return "movie/movie";
		}
		
		//유럽영화 이동
		@RequestMapping(value="europeGet.do",method = RequestMethod.GET)
		public String europeGet(Movie movie , Model model,HttpSession session,JJim jjim) {
			String email = (String) session.getAttribute("email");
			MovieDao dao = sqlSession.getMapper(MovieDao.class);
			List<Movie> m = dao.getEurope();
			List<JJim> jjimlist = dao.getMovieJJim(email);
			model.addAttribute("movie",m);
			model.addAttribute("jjimlist",jjimlist);
			return "movie/movie";
		}
		
		//일본영화 이동
		@RequestMapping(value="japanGet.do",method = RequestMethod.GET)
		public String japanGet(Movie movie , Model model,HttpSession session,JJim jjim) {
			String email = (String) session.getAttribute("email");
			MovieDao dao = sqlSession.getMapper(MovieDao.class);
			List<JJim> jjimlist = dao.getMovieJJim(email);
			List<Movie> m = dao.getJapan();
			model.addAttribute("movie",m);
			model.addAttribute("jjimlist",jjimlist);
			return "movie/movie";
		}
		
		//영화 찾기
		@RequestMapping(value="searchMovie.do",method = RequestMethod.GET)
		public String searchGet(Movie movie , Model model , String word , HttpSession session) {
			MovieDao dao = sqlSession.getMapper(MovieDao.class);
			String email = (String) session.getAttribute("email");
			List<JJim> jjimlist = dao.getMovieJJim(email);
			List<Movie> m = dao.searchMovie(word);
			model.addAttribute("movie",m);
			model.addAttribute("jjimlist",jjimlist);
			return "movie/movie";
		}
		
		
		
		@RequestMapping(value="movieDetail.do",method=RequestMethod.GET)
		public String movieDetail(int moseq,Model model,HttpSession session) {
			int result = 0;
			MovieDao dao = sqlSession.getMapper(MovieDao.class);
			MemberDao mdao = sqlSession.getMapper(MemberDao.class);
			String email = (String)session.getAttribute("email");
			result = mdao.addHistory(moseq, email);
			Movie movie = dao.selectMovie(moseq);
			System.out.println(" d " + movie);
			if(result > 0 ) {
				model.addAttribute("movie", movie);
			}else {
				System.out.println("이거는 ? " + movie);
			}
			return "movie/movieDetail";
		}
		
		@RequestMapping(value="like.do" , method=RequestMethod.GET)
		public String getLike(Model model,Recommend recom) {
			
		  BoardDao dao = sqlSession.getMapper(BoardDao.class); 
		  List<Recommend> rc =  dao.getRecomm(); 
		  model.addAttribute("recom", rc);
			 
			return "recommend/recommend";
		}
		
	
		//찜하기 
		@RequestMapping(value="/jjimMovie.do", method = RequestMethod.POST)
		public String movieWish(HttpSession session,int moseq,int monum, String status, Model model) {
			String email = (String)session.getAttribute("email");
			String viewpage = "";
			int result = 0;
			MovieDao dao = sqlSession.getMapper(MovieDao.class);
			
			// 찜 추가/제거
			if(status.equals("likeoff")) {
				result = dao.addMovieJJim(moseq, email);
			}else if(status.equals("likeon")) {
				result = dao.delMovieJJim(moseq, email);
			}
			
			// 찜 추가, 제거 성공시 찜 상태 변경
			if(status.equals("likeoff") && result > 0) {
				if(monum == 1) {
					status = "likeon";
					viewpage = "redirect:koreaGet.do";
				} else if(monum == 2) {
					status = "likeon";
					viewpage = "redirect:americanGet.do";
				}else if(monum == 3) {
					status = "likeon";
					viewpage = "redirect:chinaGet.do";
				}else if(monum == 4) {
					status = "likeon";
					viewpage = "redirect:europeGet.do";
				}else {
					status = "likeon";
					viewpage = "redirect:japanGet.do";
				}
				
			}else if(status.equals("likeon") && result > 0) {
				if(monum == 1) {
					status = "likeoff";
					viewpage = "redirect:koreaGet.do";
				} else if(monum == 2) {
					status = "likeoff";
					viewpage = "redirect:americanGet.do";
				}else if(monum == 3) {
					status = "likeoff";
					viewpage = "redirect:chinaGet.do?";
				}else if(monum == 4) {
					status = "likeoff";
					viewpage = "redirect:europeGet.do";
				}else {
					status = "likeoff";
					viewpage = "redirect:japanGet.do";
				}
				
			}
			
			model.addAttribute("status", status);
			
			return viewpage;
		}
		
		//위시리스트 
		@RequestMapping(value="wishlist.do",method=RequestMethod.GET)
		public String getWish(String email,Model model) {
			MovieDao dao = sqlSession.getMapper(MovieDao.class);
			List<Movie> m = dao.getMovieList();
			List<JJim> jjim = dao.getMovieJJim(email);
			model.addAttribute("movie", m);
			model.addAttribute("jjimlist", jjim);
			
			return "user/wishList";
		}
		
		
		
		//지난 영화 뿌리기
		@RequestMapping(value = "history.do" , method = RequestMethod.GET)
		public String historyGet(Movie movie , Model model , HttpSession session) {
			String email = (String) session.getAttribute("email");
			MovieDao dao = sqlSession.getMapper(MovieDao.class);
			List<Movie> m = dao.getHistory(email);
			model.addAttribute("movie", m);
			
			return "user/History";
		}
		
		
}
