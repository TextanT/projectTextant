package com.besideYou.textant.dao;

import java.util.HashMap;
import java.util.List;

import com.besideYou.textant.dto.CommentDto;

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
	public void commentGoodOrBadDelete(HashMap<String,Integer> commentDelete);
}
