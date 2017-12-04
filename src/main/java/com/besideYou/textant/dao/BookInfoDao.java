package com.besideYou.textant.dao;

import java.util.HashMap;
import java.util.List;

import com.besideYou.textant.dto.BookInfoDto;

public interface BookInfoDao {

//	public String loginCheck(String id);
	
	public void writeBook(BookInfoDto bookInfoDto);

	public List<String> getNewBooks();
//	public String joinchek(String inputId);
	
//	public int getUserNum(LoginDto loginDto);

}
