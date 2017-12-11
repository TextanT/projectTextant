package com.besideYou.textant.myStudy.dao;

import java.util.HashMap;
import java.util.List;

import com.besideYou.textant.main.dto.BookInfoDto;
import com.besideYou.textant.myStudy.dto.BookMarkDto;
import com.besideYou.textant.myStudy.dto.BookWishDto;
import com.besideYou.textant.myStudy.dto.ReadBookDto;
import com.besideYou.textant.comment.dto.CommentDto;

public interface MyStudyDao {

	List<CommentDto> getMyComment(HashMap<String, String> paging);

	List<BookInfoDto> getMyBookWrite(HashMap<String, String> paging);

	List<ReadBookDto> getMyBookRead(HashMap<String, String> paging);

	List<BookWishDto> getMyWish(HashMap<String, String> paging);

	List<BookMarkDto> getMyBookmark(HashMap<String, String> paging);

	int getMyCommentCount(int userNum);

	int getMyBookWriteCount(int userNum);

	int getMyBookReadCount(int userNum);

	int getMyWishCount(int userNum);

	int getMyBookMarkCount(int userNum);

	void commentDelete(CommentDto commentDto);

	void bookWriteDelete(BookInfoDto bookInfoDto);

	void wishDelete(BookWishDto bookWishDto);

	void bookWriteDelete(ReadBookDto readBookDto);

	void bookMarkDelete(BookMarkDto bookMarkDto);

}
