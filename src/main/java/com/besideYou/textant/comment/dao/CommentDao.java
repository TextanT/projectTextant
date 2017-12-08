package com.besideYou.textant.comment.dao;

import java.util.HashMap;
import java.util.List;

import com.besideYou.textant.comment.dto.CommentDto;

public interface CommentDao {
	public void scroll(CommentDto commentDto);
	public void scrollComment(int commentTop);
	public int pageCountBloack(HashMap<String,Integer>  pageBlockMin);
	public List<CommentDto> commentList(HashMap<String,Integer> pageBlockMin);
	public int commentListCount(HashMap<String,Integer> pageBlockMin);
	public int commentGoodOrBad(HashMap<String,Integer> commentGoodOrBadCheck);
	public int commentGoodOrBadWrite(HashMap<String,Integer> commentGoodOrBadCheck);
	public int commentGoodOrBadCount(HashMap<String,Integer> commentGoodOrBadCheck);
	public int commentGoodOrBadUpdate(HashMap<String,Integer> commentGoodOrBadCheck);
	public void commentDelete(HashMap<String,Integer> commentDelete);
	public void commentCountUpdate(HashMap<String,Integer> commentDelete);
	public int commentCountCheck(HashMap<String,Integer> commentDelete);
	public void commentGoodOrBadDelete(HashMap<String,Integer> commentDelete);
	public String reportCommentCheck(HashMap<String,Integer> reportCommentCheck);
	public void reportCommentWrite(HashMap<String,Integer> reportCommentCheck);
	public int getCommentTotalCount(int bookArticleNum);
	public int getbookTotalPage(int bookArticleNum);
	public List<CommentDto> getCommentArticleList(HashMap<String, String> CommentArticleList);
	public int getCommentSearchCount(HashMap<String, String> CommentArticleList);
	public int scrollCommentTopCount(int commentTop);
	
}