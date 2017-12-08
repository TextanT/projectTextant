package com.besideYou.textant.myStudy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import com.besideYou.textant.myStudy.service.MyStudyService;
import javax.servlet.http.HttpSession;
@Controller
public class MyStudyController {
	@Autowired
	MyStudyService myStudyService;
	
//	나의 댓글
//	내가 쓴책
//	내가읽은 책
//	내가 찜한책
//	북마크
	
	@RequestMapping(value = "myStudy.text")
	public String myStudymain(HttpSession session, Model model) {
		int userNum=(int)session.getAttribute("userNum");
		myStudyService.getMyStudyMain(userNum, model);
		
		return "myStudy/myStudyMain";
	}
}
