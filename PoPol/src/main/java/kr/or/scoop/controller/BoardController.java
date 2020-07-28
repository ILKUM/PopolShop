package kr.or.scoop.controller;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import kr.or.scoop.dto.MoReply;
import kr.or.scoop.dto.Movie;
import kr.or.scoop.dto.Notice;
import kr.or.scoop.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	private SqlSession sqlSession;

	@Autowired
	BoardService bService;

	// 전체 공지사항 불러오기
	@RequestMapping(value = "notice.do", method = RequestMethod.GET)
	public String noticeJoin(Notice notice, Model model) {
		NoticeDao dao = sqlSession.getMapper(NoticeDao.class);
		List<Notice> n = dao.getNotice();
		for (int i = 0; i < n.size(); i++) {
			n.get(i).setNocontent(n.get(i).getNocontent().replace("<br>", " ")); // <br>을 띄어쓰기로 치환해서 보여줌
		}
		model.addAttribute("notice", n);
		return "notice/notice";
	}

	// 공지사항 작성
	@RequestMapping(value = "noticeWrite.do", method = RequestMethod.POST)
	public String noticeWrite(Notice notice) {
		int result = 0;
		String viewpage;
		notice.setNocontent(notice.getNocontent().replace("\r\n", "<br>"));
		result = bService.insertNotice(notice);// 공지사항 작성

		if (result > 0) {
			viewpage = "redirect:/notice.do";
		} else {
			viewpage = "user/userindex";
		}

		return viewpage;

	}

	// 공지사항 디테일
	@RequestMapping(value = "noticeDetail.do", method = RequestMethod.GET)
	public String noticeDetail(int noseq, Model model) {
		String viewpage = "";
		int result = 0;
		NoticeDao dao = sqlSession.getMapper(NoticeDao.class);
		result = bService.nrnumUp(noseq);
		if (result > 0) {
			Notice notice = dao.detailNotice(noseq); // 공지사항 디테일
			model.addAttribute("notice", notice);
			viewpage = "notice/noticeDetail";
		} else {
			viewpage = "notice/noticeDetail";
		}

		return viewpage;
	}

	// 공지사항 수정
	@RequestMapping(value = "editNotice.do", method = RequestMethod.GET)
	public String editNoice(int noseq, Model model) {
		String viewpage = "";

		NoticeDao dao = sqlSession.getMapper(NoticeDao.class);

		Notice notice = dao.detailNotice(noseq); // 공지사항 디테일
		model.addAttribute("n", notice);
		viewpage = "notice/noticeEdit";

		return viewpage;
	}

	@RequestMapping(value = "editNoticeCheck.do", method = RequestMethod.POST)
	public String editNoticeCheck(int noseq, Notice notice, Model model) {
		int result = 0;
		String viewpage = "";
		notice.setNocontent(notice.getNocontent().replace("\r\n", "<br>"));
		result = bService.updateNotice(notice);
		if (result > 0) {
			model.addAttribute("notice", notice);
			viewpage = "redirect:/noticeDetail.do?noseq=" + noseq;

		} else {
			viewpage = "notice/notice";
		}

		return viewpage;
	}

	// 공지사항 삭제
	@RequestMapping(value = "deleteNoitce.do", method = RequestMethod.GET)
	public String noticeDelete(int noseq) {
		int result = 0;
		String viewpage;
		result = bService.deleteNotice(noseq);
		if (result > 0) {
			viewpage = "redirect:/notice.do";
		} else {
			viewpage = "redirect:/noticeDetail.do?noseq" + noseq;
		}
		return viewpage;

	}

	// 영화 추가
	@RequestMapping(value = "insertMovie.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String movieInsert(Movie movie, HttpServletRequest request, HttpSession session) {
		String viewpage;
		CommonsMultipartFile multifile = movie.getFilesrc();
		String filename = multifile.getOriginalFilename();
		String path = request.getServletContext().getRealPath("/user/movie");

		String fpath = path + "\\" + filename;
		if (filename.equals("")) {
			movie.setMophoto((String) session.getAttribute("img"));
		} else {
			movie.setMophoto(filename);
		}
		if (!filename.equals("")) { // 실 파일 업로드
			FileOutputStream fs = null;
			try {
				fs = new FileOutputStream(fpath);
			} catch (FileNotFoundException e) {
				e.printStackTrace();

			} finally {
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
		if (result > 0) {
			viewpage = "redirect:/userindex.do";
		} else {
			viewpage = "redirect:/userindex.do";
		}

		return viewpage;
	}

	// 한국영화 이동
	@RequestMapping(value = "koreaGet.do", method = RequestMethod.GET)
	public String koreaGet(Movie movie, Model model, HttpSession session, JJim jjim) {
		MovieDao dao = sqlSession.getMapper(MovieDao.class);
		String email = (String) session.getAttribute("email");
		List<Movie> m = dao.getKorea();
		List<JJim> jjimlist = dao.getMovieJJim(email);
		model.addAttribute("movie", m);
		model.addAttribute("jjimlist", jjimlist);
		return "movie/movie";
	}

	// 미국영화 이동
	@RequestMapping(value = "americanGet.do", method = RequestMethod.GET)
	public String americanGet(Movie movie, Model model, HttpSession session, JJim jjim) {
		MovieDao dao = sqlSession.getMapper(MovieDao.class);
		String email = (String) session.getAttribute("email");
		List<Movie> m = dao.getAmerican();
		List<JJim> jjimlist = dao.getMovieJJim(email);
		model.addAttribute("movie", m);
		model.addAttribute("jjimlist", jjimlist);
		return "movie/movie";
	}

	// 중국영화 이동
	@RequestMapping(value = "chinaGet.do", method = RequestMethod.GET)
	public String chinaGet(Movie movie, Model model, HttpSession session, JJim jjim) {
		MovieDao dao = sqlSession.getMapper(MovieDao.class);
		String email = (String) session.getAttribute("email");
		List<Movie> m = dao.getChina();
		List<JJim> jjimlist = dao.getMovieJJim(email);
		model.addAttribute("movie", m);
		model.addAttribute("jjimlist", jjimlist);
		return "movie/movie";
	}

	// 유럽영화 이동
	@RequestMapping(value = "europeGet.do", method = RequestMethod.GET)
	public String europeGet(Movie movie, Model model, HttpSession session, JJim jjim) {
		String email = (String) session.getAttribute("email");
		MovieDao dao = sqlSession.getMapper(MovieDao.class);
		List<Movie> m = dao.getEurope();
		List<JJim> jjimlist = dao.getMovieJJim(email);
		model.addAttribute("movie", m);
		model.addAttribute("jjimlist", jjimlist);
		return "movie/movie";
	}

	// 일본영화 이동
	@RequestMapping(value = "japanGet.do", method = RequestMethod.GET)
	public String japanGet(Movie movie, Model model, HttpSession session, JJim jjim) {
		String email = (String) session.getAttribute("email");
		MovieDao dao = sqlSession.getMapper(MovieDao.class);
		List<JJim> jjimlist = dao.getMovieJJim(email);
		List<Movie> m = dao.getJapan();
		model.addAttribute("movie", m);
		model.addAttribute("jjimlist", jjimlist);
		return "movie/movie";
	}

	// 영화 찾기
	@RequestMapping(value = "searchMovie.do", method = RequestMethod.GET)
	public String searchGet(Movie movie, Model model, String word, HttpSession session) {
		MovieDao dao = sqlSession.getMapper(MovieDao.class);
		String email = (String) session.getAttribute("email");
		List<JJim> jjimlist = dao.getMovieJJim(email);
		List<Movie> m = dao.searchMovie(word);
		model.addAttribute("movie", m);
		model.addAttribute("jjimlist", jjimlist);
		return "movie/movie";
	}

	// 영화 디테일
	@RequestMapping(value = "movieDetail.do", method = RequestMethod.GET)
	public String movieDetail(int moseq, Model model, HttpSession session, HttpServletRequest request) {
		int result = 0;
		MovieDao dao = sqlSession.getMapper(MovieDao.class);
		MemberDao mdao = sqlSession.getMapper(MemberDao.class);
		String email = (String) session.getAttribute("email");
		result = mdao.addHistory(moseq, email);
		List<MoReply> mocom = dao.movieCommentOk(moseq);
		int count = dao.getmolike(email, moseq);
		int down = dao.getDownCount(moseq);
		System.out.println(count);
		Movie movie = dao.selectMovie(moseq);
		int mpoint = movie.getMpoint();
		if (result > 0) {
			request.setAttribute("down", down);
			model.addAttribute("mocom", mocom);
			request.setAttribute("count", count);
			request.setAttribute("mpoint", mpoint);
			model.addAttribute("movie", movie);
		} else {
			System.out.println("이거는 ? " + movie);
		}
		return "movie/movieDetail";
	}

	// 영화 수정
	@RequestMapping(value = "movieEdit.do", method = RequestMethod.GET)
	public String movieEdit(int moseq, Model model, HttpSession session, HttpServletRequest request) {
		MovieDao dao = sqlSession.getMapper(MovieDao.class);
		Movie movie = dao.selectMovie(moseq);
		model.addAttribute("movie", movie);
		return "movie/movieEdit";
	}

	// 리뷰 글 수정 체크
	@RequestMapping(value = "movieEditCheck.do", method = RequestMethod.POST)
	public String reviewEditCheck(int moseq, Movie movie, HttpServletRequest request) {
		String viewpage;
		CommonsMultipartFile multifile = movie.getFilesrc();
		MovieDao dao = sqlSession.getMapper(MovieDao.class);
		String img = dao.getMovieImg(moseq);
		String filename = multifile.getOriginalFilename();
		String path = request.getServletContext().getRealPath("/user/movie");
		String fpath = path + "\\" + filename;

		if (filename.equals("")) {
			movie.setMophoto(img);
		} else {
			movie.setMophoto(filename);
		}
		if (!filename.equals("")) { // 실 파일 업로드
			FileOutputStream fs = null;
			try {
				fs = new FileOutputStream(fpath);
			} catch (FileNotFoundException e) {
				e.printStackTrace();

			} finally {
				try {
					fs.write(multifile.getBytes());
					fs.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}

		int result = bService.updateMovie(movie);
		if (result > 0) {
			viewpage = "redirect:/movieDetail.do?moseq=" + moseq;
		} else {
			viewpage = "redirect:/movieDetail.do?moseq=" + moseq;
		}
		return viewpage;

	}

	// 찜하기
	@RequestMapping(value = "/jjimMovie.do", method = RequestMethod.POST)
	public String movieWish(HttpSession session, int moseq, int monum, String status, Model model) {
		String email = (String) session.getAttribute("email");
		String viewpage = "";
		int result = 0;
		MovieDao dao = sqlSession.getMapper(MovieDao.class);

		// 찜 추가/제거
		if (status.equals("likeoff")) {
			result = dao.addMovieJJim(moseq, email);
		} else if (status.equals("likeon")) {
			result = dao.delMovieJJim(moseq, email);
		}

		// 찜 추가, 제거 성공시 찜 상태 변경
		if (status.equals("likeoff") && result > 0) {
			if (monum == 1) {
				status = "likeon";
				viewpage = "redirect:koreaGet.do";
			} else if (monum == 2) {
				status = "likeon";
				viewpage = "redirect:americanGet.do";
			} else if (monum == 3) {
				status = "likeon";
				viewpage = "redirect:chinaGet.do";
			} else if (monum == 4) {
				status = "likeon";
				viewpage = "redirect:europeGet.do";
			} else {
				status = "likeon";
				viewpage = "redirect:japanGet.do";
			}

		} else if (status.equals("likeon") && result > 0) {
			if (monum == 1) {
				status = "likeoff";
				viewpage = "redirect:koreaGet.do";
			} else if (monum == 2) {
				status = "likeoff";
				viewpage = "redirect:americanGet.do";
			} else if (monum == 3) {
				status = "likeoff";
				viewpage = "redirect:chinaGet.do?";
			} else if (monum == 4) {
				status = "likeoff";
				viewpage = "redirect:europeGet.do";
			} else {
				status = "likeoff";
				viewpage = "redirect:japanGet.do";
			}

		}

		model.addAttribute("status", status);

		return viewpage;
	}

	// 위시리스트
	@RequestMapping(value = "wishlist.do", method = RequestMethod.GET)
	public String getWish(String email, Model model) {
		MovieDao dao = sqlSession.getMapper(MovieDao.class);
		List<Movie> m = dao.getMovieList();
		List<JJim> jjim = dao.getMovieJJim(email);
		model.addAttribute("movie", m);
		model.addAttribute("jjimlist", jjim);

		return "user/wishList";
	}

	// 지난 영화 뿌리기
	@RequestMapping(value = "history.do", method = RequestMethod.GET)
	public String historyGet(Movie movie, Model model, HttpSession session) {
		String email = (String) session.getAttribute("email");
		MovieDao dao = sqlSession.getMapper(MovieDao.class);
		List<Movie> m = dao.getHistory(email);
		model.addAttribute("movie", m);

		return "user/History";
	}

	// 추천 글 추천수 증가
	@RequestMapping(value = "/molike.do", method = RequestMethod.POST)
	public String updateMolike(int moseq, String email, Model model) {
		MovieDao dao = sqlSession.getMapper(MovieDao.class);
		int like = (int) dao.getmolike(email, moseq);
		int result = 0;
		String viewpage = "";
		int chu = 0;
		if (like > 0) {
			model.addAttribute("on", like);
		} else {
			result = dao.insertMolike(moseq, email);
			System.out.println(result);
			chu = dao.molikeCount(moseq);
		}

		if (chu > 0) {
			viewpage = "redirect:/movieDetail.do?moseq=" + moseq;
		} else {
			viewpage = "redirect:/movieDetail.do?moseq=" + moseq;
		}
		return viewpage;
	}

	// 영화 다운로드
	@RequestMapping("/movieDownload.do")
	public void movieDownload(HttpServletRequest request, HttpServletResponse response, HttpSession session, int moseq)
			throws Exception {
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		MovieDao mdao = sqlSession.getMapper(MovieDao.class);
		BoardDao bdao = sqlSession.getMapper(BoardDao.class);
		int mpoint = mdao.getMpoint(moseq);
		String email = (String) session.getAttribute("email");
		int one = bdao.redownInsert(moseq, email);
		int two = dao.updatePoint(email, mpoint);
		int result = one + two;
		if (result > 1) {
			String realPath = "C:/SmartWeb/popol/.metadata/.plugins/org.eclipse.wst.server.core/tmp1/wtpwebapps/PoPol/user/movie/";
			String p = "/user/movie";
			String f = request.getParameter("fileName");

			String fname = new String(f.getBytes("euc-kr"), "8859_1");
			response.setHeader("Content-Disposition", "attachment;filename=" + fname + ";");
			// 파일명 전송
			// 파일 내용전송
			String fullpath = request.getServletContext().getRealPath(p + "/" + f);

			FileInputStream fin = new FileInputStream(fullpath);
			// 출력 도구 얻기 :response.getOutputStream()
			ServletOutputStream sout = response.getOutputStream();
			byte[] buf = new byte[1024]; // 전체를 다읽지 않고 1204byte씩 읽어서
			int size = 0;
			while ((size = fin.read(buf, 0, buf.length)) != -1) // buffer 에 1024byte
			// 담고
			{ // 마지막 남아있는 byte 담고 그다음 없으면 탈출
				sout.write(buf, 0, size); // 1kbyte씩 출력
			}
			fin.close();
			sout.close();
		} else {
			System.out.println("실패");
		}

	}

	// 영화 댓글작성
	@RequestMapping(value = "moComment.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String reviewComent(int moseq, String email, String morcontent, Model model) {
		int result = 0;
		String viewpage = "";
		result = bService.movieComment(moseq, morcontent, email);
		if (result > 0) {
			viewpage = "redirect:/movieDetail.do?moseq=" + moseq;
		} else {
			viewpage = "redirect:/movieDetail.do";
		}
		return viewpage;
	}

	// 영화 댓글 삭제
	@RequestMapping(value = "delMovieComment.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String delComment(int morseq, Model model) {
		int result = 0;
		String viewpage = "";
		result = bService.delMovieComment(morseq);

		if (result > 0) {
			model.addAttribute("ajax", "댓글 성공");
			viewpage = "utils/ajax";

		} else {
			model.addAttribute("ajax", "댓글 실패");
			viewpage = "utils/ajax";
		}
		return viewpage;
	}

	// 영화 재다운로드
	@RequestMapping("/reMovieDownload.do")
	public void movieReDownload(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		String realPath = "C:/SmartWeb/popol/.metadata/.plugins/org.eclipse.wst.server.core/tmp1/wtpwebapps/PoPol/user/movie/";
		String p = "/user/movie";
		String f = request.getParameter("fileName");

		String fname = new String(f.getBytes("euc-kr"), "8859_1");
		response.setHeader("Content-Disposition", "attachment;filename=" + fname + ";");
		// 파일명 전송
		// 파일 내용전송
		String fullpath = request.getServletContext().getRealPath(p + "/" + f);

		FileInputStream fin = new FileInputStream(fullpath);
		// 출력 도구 얻기 :response.getOutputStream()
		ServletOutputStream sout = response.getOutputStream();
		byte[] buf = new byte[1024]; // 전체를 다읽지 않고 1204byte씩 읽어서
		int size = 0;
		while ((size = fin.read(buf, 0, buf.length)) != -1) // buffer 에 1024byte
		// 담고
		{ // 마지막 남아있는 byte 담고 그다음 없으면 탈출
			sout.write(buf, 0, size); // 1kbyte씩 출력
		}
		fin.close();
		sout.close();

	}

}
