package com.besideYou.textant.main.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.besideYou.textant.main.dto.BookInfoDto;
@Repository
public interface BookInfoDao {

//	public String loginCheck(String id);
	
	public void writeBook(BookInfoDto bookInfoDto);

	public void writeAmateurBook(BookInfoDto bookInfoDto);
	
//	public List<BookInfoDto> getNewBooks();

//	public int getTotalPages(String fileName);
	
	public int getTotalPages(String fileLocation);

	public int getNewTotal();

	public int getMainBookListCount();

	public List<BookInfoDto> getMainRecencyList(HashMap<String, String> mainPageMap);

	public List<BookInfoDto> getMainScoreList(HashMap<String, String> mainPageMap);

	public List<BookInfoDto> getMainHitList(HashMap<String, String> mainPageMap);

	public List<BookInfoDto> getNewBooks();
	
	
//	public int getUserGrade(int userNum);
//	public String getUserNickname();
	
//	public List<String> getbookname();
//	public String joinchek(String inputId);
	
//	public int getUserNum(LoginDto loginDto);

}
