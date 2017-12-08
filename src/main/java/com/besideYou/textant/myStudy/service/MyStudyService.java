package com.besideYou.textant.myStudy.service;

import org.springframework.ui.Model;

public interface MyStudyService {
	
	public void getMyStudyMain(int userNum, Model model);
	
	public void getMyComment(int userNum, Model model,int pageNum);

	public void getMyBookWrite(int userNum, Model model,int pageNum);

	public void getMyBookRead(int userNum, Model model,int pageNum);

	public void getMyWish(int userNum, Model model,int pageNum);
	
	public void getMyBookmark(int userNum, Model model,int pageNum);

	

}
