package com.besideYou.textant.main.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.besideYou.textant.main.dto.BookInfoDto;
@Repository
public interface BookInfoDao {

//	public String loginCheck(String id);
	
	public void writeBook(BookInfoDto bookInfoDto);

	public List<String> getNewBooks();
	
	public int getTotalPages(String fileLocation);
//	public String joinchek(String inputId);
	
//	public int getUserNum(LoginDto loginDto);

}
