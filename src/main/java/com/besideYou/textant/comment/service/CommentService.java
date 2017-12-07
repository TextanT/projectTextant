package com.besideYou.textant.comment.service;

import java.util.HashMap;
import java.util.List;

import com.besideYou.textant.comment.dto.CommentDto;
public interface CommentService {
	public HashMap<String, Integer> scroll(CommentDto commentDto,int commentTo,int commentTop);
	public List<CommentDto> scrollView(int page,int nextPage,int pageListCount,int pageCountBlock,int pageCut,int bookArticleNum,int commentNum,int commentDelete,int userNum);
	public List<CommentDto> commentTotalRead(int page, int commentTotalCount, int userNum,int bookArticleNum,int commentNum,int commentDelete,int commentSearchCheak, int commentSearchList,String commentSearch);
	public HashMap<String, Integer> commentCount(int page,int bookArticleNum);
	public HashMap<String, Integer> commentTotalCount(int bookArticleNum);
	public HashMap<String, Integer> commentGoodOrBad(int commentNum,int commentGoodOrBad,int userNum);
	public int commentDelete(int commentNum,int commentGroup);
	public int reportComment(int commentNum,int userNum);
}
