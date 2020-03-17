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

import kr.or.scoop.dao.MovieDao;
import kr.or.scoop.dao.NoticeDao;
import kr.or.scoop.dto.Movie;
import kr.or.scoop.dto.Notice;
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
			String viewpage;
			NoticeDao dao = sqlSession.getMapper(NoticeDao.class);
			Notice notice = dao.detailNotice(noseq); //공지사항 디테일
			model.addAttribute("notice",notice);
			
			viewpage = "notice/noticeDetail";
			
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
			System.out.println("여기도착?");
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
						System.out.println("dd : " + movie);
					   MovieDao dao = sqlSession.getMapper(MovieDao.class);
					   int result = dao.insertMovie(movie);
					   if(result > 0) {
						   viewpage = "redirect:/userindex.do";
					   }else {
						   viewpage = "redirect:/userindex.do";
					   }
					   
					   return viewpage;
		}
		
		@RequestMapping(value="koreaGet.do",method = RequestMethod.GET)
		public String movieGet(Movie movie , Model model) {
			MovieDao dao = sqlSession.getMapper(MovieDao.class);
			List<Movie> m = dao.getKorea();
			model.addAttribute("movie",m);
			return "movie/korea";
		}
		
		
}
