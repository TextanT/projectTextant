package com.besideYou.textant.manager.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.besideYou.textant.common.dto.NoticeDto;
import com.besideYou.textant.common.dto.RecommendedBookDto;

public interface ManagerService {
	void managerMain(Model model);
	void managerRecommendBook(Model model, int pageNum, HttpServletRequest req);
	void managerReportBook(Model model, int pageNum, HttpServletRequest req);
	void managingRecommendContent(int num, Model model);
	void recommendWrite(RecommendedBookDto recommendedBookDto, HttpSession session);
	void getUserName(int userNum, Model model);
	void deleteRecommendBook(int recommendNum);
	public void updateRecommendBook(int recommendNum, Model model);
	void managingBookContent(int num, Model model);
	void deleteReportBook(int reportBookNum);
	void managerNotice(Model model, int pageNum, HttpServletRequest req);
	void noticeContent(int num, Model model);
	void noticeWrite(NoticeDto noticeDto, HttpSession session);
	void deleteNotice(int articleNum);
	void updateNotice(int articleNum, Model model);
	
	
}
