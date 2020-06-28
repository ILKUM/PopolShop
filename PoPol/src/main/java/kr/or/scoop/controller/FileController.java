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
import kr.or.scoop.dto.File;
import kr.or.scoop.service.BoardService;

@Controller
public class FileController {

	@Autowired
	private SqlSession sqlSession;

	@Autowired
	BoardService bService;

	// 파일공유 게시판 이동
	@RequestMapping(value = "file.do", method = RequestMethod.GET)
	public String getFileBoard(Model model) {
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		List<File> f = dao.getFileBoard();
		model.addAttribute("file", f);

		return "file/file";
	}

	// 파일공유 글 작성
	@RequestMapping(value = "writeFile.do", method = RequestMethod.POST)
	public String FileInsert(File file, HttpServletRequest request, HttpSession session) {
		String viewpage = null;
		String email = (String) session.getAttribute("email");
		int chk = bService.minusPoint(email);
		if (chk > 0) {
			CommonsMultipartFile multifile = file.getFilesrc();
			String filename = multifile.getOriginalFilename();
			String path = request.getServletContext().getRealPath("/user/file");

			String fpath = path + "\\" + filename;
			if (filename.equals("")) {
				file.setFilename((String) request.getAttribute("filename"));
			} else {
				file.setFilename(filename);
			}
			if (!filename.equals("")) { // 실 파일 업로드
				FileOutputStream fs = null;
				try {
					fs = new FileOutputStream(fpath);
				} catch (FileNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();

				} finally {
					try {
						fs.write(multifile.getBytes());
						fs.close();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
			int result = bService.insertFile(file);
			if (result > 0) {
				viewpage = "redirect:/file.do";
			} else {
				viewpage = "redirect:/file.do";
			}
		} else {
			System.out.println("실패");
		}

		return viewpage;
	}

	@RequestMapping(value = "deleteFile.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String deleteFile(int fseq) {
		String viewpage;
		int result = bService.deleteFile(fseq);
		if (result > 0) {
			viewpage = "redirect:/file.do";
		} else {
			viewpage = "redirect:/file.do";
		}
		return viewpage;
	}

	@RequestMapping(value = "detailFile.do", method = RequestMethod.GET)
	public String detailFile(int fseq, Model model, HttpServletRequest request, HttpSession session) {
		String viewpage = "";
		String email = (String) session.getAttribute("email");
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		File file = dao.detailFile(fseq);
		int count = dao.checkFile(fseq, email);
		int read = bService.readFile(fseq);
		if (read > 0) {
			request.setAttribute("count", count);
			model.addAttribute("file", file);
			viewpage = "file/fileDetail";
		} else {

		}

		return viewpage;
	}

	// 파일공유 글 추천수 증가
	@RequestMapping(value = "/flike.do", method = RequestMethod.POST)
	public String updateFlike(int fseq, String email, Model model) {
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		int like = dao.checkFile(fseq, email);
		int result = 0;
		String viewpage = "";
		int chu = 0;
		if (like > 0) {
			model.addAttribute("on", like);
		} else {
			result = dao.insertFlike(fseq, email);
			chu = dao.flikeUp(fseq);
		}

		if (chu > 0) {
			viewpage = "redirect:/detailFile.do?fseq=" + fseq;
		} else {
			viewpage = "redirect:/detailFile.do?fseq=" + fseq;
		}
		return viewpage;
	}

	// 영화 다운로드
	@RequestMapping("/dataDownload.do")
	public void dataDownload(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		String realPath = "C:/SmartWeb/popol/.metadata/.plugins/org.eclipse.wst.server.core/tmp1/wtpwebapps/PoPol/user/file/";
		String p = "/user/file";
		String f = request.getParameter("fileName");

		String fname = new String(f.getBytes("euc-kr"), "8859_1"); // 파일명 전송
		response.setHeader("Content-Disposition", "attachment;filename=" + fname + ";"); 	// 파일 내용전송
		
	
		String fullpath = request.getServletContext().getRealPath(p + "/" + f);

		FileInputStream fin = new FileInputStream(fullpath); // 출력 도구 얻기 :response.getOutputStream()
	
		ServletOutputStream sout = response.getOutputStream();
		byte[] buf = new byte[1024]; // 전체를 다읽지 않고 1024byte씩 읽어서
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
