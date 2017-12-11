package com.besideYou.textant.myStudy.service;

import org.springframework.ui.Model;

import com.besideYou.textant.comment.dto.CommentDto;
import com.besideYou.textant.main.dto.BookInfoDto;
import com.besideYou.textant.myStudy.dto.BookMarkDto;
import com.besideYou.textant.myStudy.dto.BookWishDto;
import com.besideYou.textant.myStudy.dto.ReadBookDto;

public interface MyStudyService {
	
	public void getMyStudyMain(int userNum, Model model);
	
	public void getMyComment(int userNum, Model model,int pageNum);
	
	public void getMyCommentReply(int userNum, Model model, int pageNum);

	public void getMyBookWrite(int userNum, Model model,int pageNum);

	public void getMyBookRead(int userNum, Model model,int pageNum);

	public void getMyWish(int userNum, Model model,int pageNum);
	
	public void getMyBookMark(int userNum, Model model,int pageNum);

	public void commentDelete(CommentDto commentDto);

	public void bookWriteDelete(BookInfoDto bookInfoDto);

	public void wishDelete(BookWishDto bookWishDto);

	public void bookReadDelete(ReadBookDto readBookDto);

	public void bookMarkDelete(BookMarkDto bookMarkDto);

	




	

}
