package com.besideYou.textant.dao;

import java.util.HashMap;
import java.util.List;

import com.besideYou.textant.Dto.CommentDto;

public interface CommentDao {
	public void scroll(CommentDto commentDto);
	public void scrollComment(int commentTop);
	public int pageCountBloack(HashMap<String,Integer>  pageBlockMin);
	public List<CommentDto> commentList(HashMap<String,Integer> pageBlockMin);
	public int commentListCount(HashMap<String,Integer> pageBlockMin);
}
