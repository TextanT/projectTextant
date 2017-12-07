package com.besideYou.textant.manager.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.besideYou.textant.manager.service.ManagerService;

@Controller
public class ManagerController {

	
	//	공지사항
	//	신고댓글
	//	신고책
	//	추천도서

	@Autowired
	ManagerService managerService;
	
	@RequestMapping(value = "/managerMain.text")
	public String managerMain(String fileName, Model model, String bookType) throws Exception {
		managerService.managerMain(model);
		return "manager/managing";
	}
	
	@RequestMapping(value = "/noticeWrite.text")
	public String noticeWrite() {
		return "manager/noticeWrite";
	}
	
	@RequestMapping(value = "/reportComment.text")
	public String reportComment() {
		return "manager";
	}
	
	
}
