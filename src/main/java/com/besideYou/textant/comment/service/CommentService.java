package com.besideYou.textant.comment.service;

import java.util.HashMap;
import java.util.List;

import com.besideYou.textant.comment.dto.CommentDto;
import com.besideYou.textant.main.dto.BookInfoDto;
public interface CommentService {
	public HashMap<String, Integer> scroll(CommentDto commentDto,int commentTo,int commentTop);
	public List<CommentDto> scrollView(int page,int nextPage,int pageListCount,int pageCountBlock,int pageCut,int bookArticleNum,int commentNum,int commentDelete,int userNum);
	public List<CommentDto> commentTotalRead(int page, int commentTotalCount, int userNum,int bookArticleNum,int commentNum,int commentDelete,int commentSearchCheak, int commentSearchList,String commentSearch);
	public HashMap<String, Integer> commentCount(int page,int bookArticleNum);
	public HashMap<String, Integer> commentTotalCount(int bookArticleNum);
	public HashMap<String, Integer> commentGoodOrBad(int commentNum,int commentGoodOrBad,int userNum);
	public int commentDelete(int commentNum,int commentGroup);
	public int reportComment(int commentNum,int userNum);
	List<BookInfoDto> getBookNum(String bookSearch);
	public List<BookInfoDto> getBookName(String bookSearch);
	public HashMap<Object, Object> getMainBookList(int sortType, int pageNum);
	public HashMap<Object, Object> getCreativeBookList(int sortType, int pageNum);
}
