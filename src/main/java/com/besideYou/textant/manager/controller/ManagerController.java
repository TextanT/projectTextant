package com.besideYou.textant.manager.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.besideYou.textant.common.dto.RecommendedBookDto;
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
	public String bookManaging(int pageNum, Model model, HttpServletRequest req) {
		managerService.managerReportBook(model, pageNum, req);
		return "manager/bookManaging";
	}
	@RequestMapping(value = "/noticeManaging.text")
	public String noticeManaging() {
		return "manager/noticeManaging";
	}
	@RequestMapping(value = "/recommendBookManaging.text")
	public String recommendBookManaging(int pageNum, Model model, HttpServletRequest req) {
		System.out.println();
		managerService.managerRecommendBook(model, pageNum, req);
		return "manager/recommendBookManaging";
	}
	
	@RequestMapping(value="/managingContent.text")
	public String managingContent(int num, String type) {
		
		return "manager/managingContent";
	}
	
	@RequestMapping(value="/managingRecommendContent.text")
	public String managingRecommendContent(int num, Model model) {
		managerService.managingRecommendContent(num, model);
		return "manager/recommendContent";
	}
	@RequestMapping(value="/recommendBookWrite.text", method=RequestMethod.GET)
	public String recommendBookWrite(int userNum, Model model) {
		managerService.getUserName(userNum, model);
		return "manager/recommendWrite";
	}
	@RequestMapping(value="/recommendBookWrite.text", method=RequestMethod.POST)
	public String recommendBookWriteForm(RecommendedBookDto recommendedBookDto, HttpSession session) {
		managerService.recommendWrite(recommendedBookDto, session);
		return "redirect:recommendBookManaging.text?pageNum=1";
	}
	@RequestMapping(value="/recommendBookDelete.text")
	public String recommendBookDelete(int recommendNum) {
		managerService.deleteRecommendBook(recommendNum);
		return "redirect:recommendBookManaging.text?pageNum=1";
	}
	@RequestMapping(value="/recommendBookUpdate.text", method=RequestMethod.GET)
	public String recommendBookUpdate(int recommendNum,Model model) {
		managerService.updateRecommendBook(recommendNum,model);
		return "manager/recommendUpdate";
	}
	
}
