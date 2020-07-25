package kr.or.scoop.controller;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.scoop.dao.BoardDao;
import kr.or.scoop.dto.Redown;
import kr.or.scoop.service.BoardService;

@Controller
public class RedownController {
	@Autowired
	private SqlSession sqlSession;

	@Autowired
	BoardService bService;
	
	//재다운 페이지 이동
	@RequestMapping(value="redown.do" , method=RequestMethod.GET)
	public String redownGet(Model model,Redown redown) {		
	  BoardDao dao = sqlSession.getMapper(BoardDao.class); 
	  List<Redown> r =  dao.redownBoardGet(); 
	   model.addAttribute("redown", r);
	 
	   return "user/MyRedown";
		
	}
	

}
