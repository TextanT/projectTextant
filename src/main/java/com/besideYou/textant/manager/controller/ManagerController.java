package com.besideYou.textant.manager.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.besideYou.textant.common.dto.NoticeDto;
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
	public String managerMain(HttpServletRequest req, HttpSession session, String fileName, Model model, String bookType) throws Exception {
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
	@RequestMapping(value = "/recommendBookManaging.text")
	public String recommendBookManaging(int pageNum, Model model, HttpServletRequest req) {
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
		managerService.managingRecommendContent(recommendNum,model);
		return "manager/recommendUpdate";
	}
	@RequestMapping(value="/recommendBookUpdate.text", method=RequestMethod.POST)
	public String recommendBookUpdateForm(RecommendedBookDto recommendedBookDto, HttpSession session) {
		managerService.updateRecommendBook(recommendedBookDto, session);
		return "redirect:recommendBookManaging.text?pageNum=1";
	}
	@RequestMapping(value="/managingBookContent.text")
	public String managingBookContent(int num, Model model) {
		managerService.managingBookContent(num, model);
		return "manager/managingBookContent";
	}
	@RequestMapping(value="/reportBookDelete.text")
	public String reportBookDelete(int reportBookNum) {
		managerService.deleteReportBook(reportBookNum);
		return "redirect:bookManaging.text?pageNum=1";
	}
	@RequestMapping(value="/noticeManaging.text")
	public String noticeManaging(int pageNum, Model model, HttpServletRequest req) {
		managerService.managerNotice(model, pageNum, req);
		return "manager/noticeManaging";
	}
	@RequestMapping(value="/noticeContent.text")
	public String noticeContent(int num, Model model) {
		managerService.noticeContent(num, model);
		return "manager/noticeContent";
	}
	@RequestMapping(value="/noticeWrite.text", method=RequestMethod.GET)
	public String noticeWrite(int userNum, Model model) {
		managerService.getUserName(userNum, model);
		return "manager/noticeWrite";
	}
	@RequestMapping(value="/noticeWrite.text", method=RequestMethod.POST)
	public String noticeWriteForm(NoticeDto noticeDto, HttpSession session) {
		managerService.noticeWrite(noticeDto, session);
		return "redirect:noticeManaging.text?pageNum=1";
	}
	@RequestMapping(value="/noticeDelete.text")
	public String noticeDelete(int articleNum) {
		managerService.deleteNotice(articleNum);
		return "redirect:noticeManaging.text?pageNum=1";
	}
	@RequestMapping(value="/noticeUpdate.text", method=RequestMethod.GET)
	public String noticeUpdate(int articleNum,Model model) {
		managerService.noticeContent(articleNum,model);
		return "manager/noticeUpdate";
	}
	
	@RequestMapping(value="/noticeUpdate.text", method=RequestMethod.POST)
	public String noticeUpdateForm(NoticeDto noticeDto, HttpSession session) {
		managerService.updateNotice(noticeDto, session);
		return "redirect:noticeManaging.text?pageNum=1";
	}
}
