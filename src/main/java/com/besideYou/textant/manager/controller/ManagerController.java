package com.besideYou.textant.manager.controller;

import java.util.Enumeration;
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
	
	@RequestMapping(value = "/bookManaging.text")
	public String bookManaging(int pageNum, Model model, HttpServletRequest req, HttpSession session) {
		managerService.managerReportBook(model, pageNum, req);
		return "manager/bookManaging";
	}
	@RequestMapping(value = "/recommendBookManaging.text")
	public String recommendBookManaging(int pageNum, Model model, HttpServletRequest req, HttpSession session) {
		managerService.managerRecommendBook(model, pageNum, req);
		return "manager/recommendBookManaging";
	}
	
	@RequestMapping(value="/managingContent.text")
	public String managingContent(int num, String type, HttpSession session) {
		
		return "manager/managingContent";
	}
	
	@RequestMapping(value="/managingRecommendContent.text")
	public String managingRecommendContent(int num, Model model, HttpSession session) {
		managerService.managingRecommendContent(num, model);
		return "manager/recommendContent";
	}
	@RequestMapping(value="/recommendBookWrite.text", method=RequestMethod.GET)
	public String recommendBookWrite(int userNum, Model model, HttpSession session) {
		managerService.getUserName(userNum, model);
		return "manager/recommendWrite";
	}
	@RequestMapping(value="/recommendBookWrite.text", method=RequestMethod.POST)
	public String recommendBookWriteForm(RecommendedBookDto recommendedBookDto, HttpSession session) {
		managerService.recommendWrite(recommendedBookDto, session);
		return "redirect:recommendBookManaging.text?pageNum=1";
	}
	@RequestMapping(value="/recommendBookDelete.text")
	public String recommendBookDelete(int recommendNum, HttpSession session) {
		managerService.deleteRecommendBook(recommendNum);
		return "redirect:recommendBookManaging.text?pageNum=1";
	}
	@RequestMapping(value="/recommendBookUpdate.text", method=RequestMethod.GET)
	public String recommendBookUpdate(int recommendNum,Model model, HttpSession session) {
		managerService.managingRecommendContent(recommendNum,model);
		return "manager/recommendUpdate";
	}
	@RequestMapping(value="/recommendBookUpdate.text", method=RequestMethod.POST)
	public String recommendBookUpdateForm(RecommendedBookDto recommendedBookDto, HttpSession session) {
		managerService.updateRecommendBook(recommendedBookDto, session);
		return "redirect:recommendBookManaging.text?pageNum=1";
	}
	@RequestMapping(value="/managingBookContent.text")
	public String managingBookContent(int num, Model model, HttpSession session) {
		managerService.managingBookContent(num, model);
		return "manager/managingBookContent";
	}
	@RequestMapping(value="/reportBookDelete.text")
	public String reportBookDelete(int reportBookNum, HttpSession session) {
		managerService.deleteReportBook(reportBookNum);
		return "redirect:bookManaging.text?pageNum=1";
	}
	@RequestMapping(value="/noticeManaging.text")
	public String noticeManaging(int pageNum, Model model, HttpServletRequest req, HttpSession session) {
		managerService.managerNotice(model, pageNum, req);
		return "manager/noticeManaging";
	}
	@RequestMapping(value="/noticeContent.text")
	public String noticeContent(int num, Model model, HttpSession session) {
		managerService.noticeContent(num, model);
		return "manager/noticeContent";
	}
	@RequestMapping(value="/noticeWrite.text", method=RequestMethod.GET)
	public String noticeWrite(int userNum, Model model, HttpSession session) {
		managerService.getUserName(userNum, model);
		return "manager/noticeWrite";
	}
	@RequestMapping(value="/noticeWrite.text", method=RequestMethod.POST)
	public String noticeWriteForm(NoticeDto noticeDto, HttpSession session) {
		managerService.noticeWrite(noticeDto, session);
		return "redirect:noticeManaging.text?pageNum=1";
	}
	@RequestMapping(value="/noticeDelete.text")
	public String noticeDelete(int articleNum, HttpSession session) {
		managerService.deleteNotice(articleNum);
		return "redirect:noticeManaging.text?pageNum=1";
	}
	@RequestMapping(value="/noticeUpdate.text", method=RequestMethod.GET)
	public String noticeUpdate(int articleNum,Model model, HttpSession session) {
		managerService.noticeContent(articleNum,model);
		return "manager/noticeUpdate";
	}
	
	@RequestMapping(value="/noticeUpdate.text", method=RequestMethod.POST)
	public String noticeUpdateForm(NoticeDto noticeDto, HttpSession session) {
		managerService.updateNotice(noticeDto, session);
		return "redirect:noticeManaging.text?pageNum=1";
	}
	@RequestMapping(value="/reportCommentManaging.text")
	public String reportCommentManaging(int pageNum, Model model, HttpServletRequest req, HttpSession session) {
		managerService.managerReportComment(model, pageNum, req);
		return "manager/reportCommentManaging";
	}
	@RequestMapping(value="/managingReportCommentContent.text")
	public String reportCommentContent(int num, Model model, HttpSession session) {
		managerService.reportCommentContent(num, model);
		return "manager/reportCommentContent";
	}
	
	@RequestMapping(value="/reportCommentDelete.text")
	public String reportCommentDelete(int reportCommentNum, HttpSession session) {
		managerService.deleteReportComment(reportCommentNum);
		return "redirect:reportCommentManaging.text?pageNum=1";
	}
	
	@RequestMapping(value = "/commentManaging.text")
	public String commentManaging(int pageNum, Model model, HttpServletRequest req, HttpSession session) {
		managerService.managerComment(model, pageNum, req);
		return "manager/commentManaging";
	}
	
	@RequestMapping(value = "/commentSearch.text")
	public String commentSearch(int pageNum, String searchType, String commentContents, Model model, HttpServletRequest req, HttpSession session) {
		System.out.println("searchType" + searchType);
		if(searchType.equals("")) {
			System.out.println("공백이다!");
			return "redirect:/commentManaging.text?pageNum=1";
		}
		managerService.searchComment(model, pageNum, req, searchType, commentContents);
		return "manager/commentSearching";
	}
	
	@RequestMapping(value="/commentContent.text")
	public String commentContent(int num, Model model, HttpSession session, HttpServletRequest req) {
		managerService.commentContent(num, model, req);
		return "manager/commentContent";
	}
	
	@RequestMapping(value="/commentDelete.text")
	public String commentDelete(int commentNum, HttpSession session, HttpServletRequest req, String referer) {
		managerService.deleteComment(commentNum);
		return "redirect:"+referer.replaceAll("%26", "&");
	}
	
	@RequestMapping(value = "/allBookManaging.text")
	public String allBookManaging(int pageNum, Model model, HttpServletRequest req, HttpSession session) {
		managerService.managerAllBook(model, pageNum, req);
		return "manager/allBookManaging";
	}
	
	@RequestMapping(value="/allBookContent.text")
	public String allBookContent(int num, Model model, HttpSession session, HttpServletRequest req) {
		managerService.allBookContent(num, model, req);
		return "manager/allBookContent";
	}
	
	@RequestMapping(value="/bookInfoDelete.text")
	public String bookInfoDelete(int bookArticleNum, HttpSession session, HttpServletRequest req, String referer) {
		managerService.deleteBookInfo(bookArticleNum);
		return "redirect:"+referer.replaceAll("%26", "&");
	}
	
	@RequestMapping(value = "/allBookSearch.text")
	public String allBookSearch(int pageNum, String searchType, String commentContents, Model model, HttpServletRequest req, HttpSession session) {
		System.out.println("searchType" + searchType);
		if(searchType.equals("")) {
			System.out.println("공백이다!");
			return "redirect:/allBookManaging.text?pageNum=1";
		}
		managerService.searchAllBook(model, pageNum, req, searchType, commentContents);
		return "manager/allBookSearching";
	}
}
