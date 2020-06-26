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
import kr.or.scoop.dto.File;
import kr.or.scoop.service.BoardService;

@Controller
public class FileController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	BoardService bService;
	
	@RequestMapping(value = "file.do",method=RequestMethod.GET)
	public String getFileBoard(Model model) {
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		List<File> f = dao.getFileBoard();
		model.addAttribute("file",f);
		
		return "file/file";
	}
	
	@RequestMapping(value="writeFile.do",method=RequestMethod.POST)
	public String FileInsert(File file,HttpServletRequest request,HttpSession session) {
		String viewpage = null;
		String email = (String)session.getAttribute("email");
		int chk = bService.minusPoint(email);
		if(chk > 0) {	
		CommonsMultipartFile multifile = file.getFilesrc();
		String filename = multifile.getOriginalFilename();		
		String path = request.getServletContext().getRealPath("/user/file");
		
		String fpath = path + "\\"+ filename; 
		if(filename.equals("")) {
			file.setFilename((String)request.getAttribute("filename"));
		}else {
			file.setFilename(filename);
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
		int result = bService.insertFile(file);
		if(result > 0) {
			viewpage= "redirect:/file.do";
		}else {
			viewpage="redirect:/file.do";
			}
		}else {
			System.out.println("실패");
		}
		
		return viewpage;
	}
}
