package kr.or.scoop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.or.scoop.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	BoardService bService;
}
