package com.besideYou.textant.manager.controller;

import java.util.HashMap;

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
	
	HashMap<String,String> pagingMap;
	
	@RequestMapping(value = "/managerMain.text")
	public String managerMain(String fileName, Model model, String bookType) throws Exception {
		managerService.managerMain(model);
		return "manager/managing";
	}
	
	
	@RequestMapping(value = "/reportCommentManaging.text")
	public String reportCommentManaging() {
		return "manager/reportCommentManaging";
	}
	
	@RequestMapping(value = "/badCommentManaging.text")
	public String badCommentManaging() {
		return "manager/badCommentManaging";
	}
	@RequestMapping(value = "/bookManaging.text")
	public String bookManaging() {
		return "manager/bookManaging";
	}
	@RequestMapping(value = "/noticeManaging.text")
	public String noticeManaging() {
		return "manager/noticeManaging";
	}
	@RequestMapping(value = "/recommendBookManaging.text")
	public String recommendBookManaging(int pageNum, Model model) {
		managerService.managerRecommendBook(model, pageNum);
		return "manager/recommendBookManaging";
	}
	
	@RequestMapping(value="/managingContent.text")
	public String managingContent(int num, String type) {
		return "manager/managingContent";
	}
	
}
