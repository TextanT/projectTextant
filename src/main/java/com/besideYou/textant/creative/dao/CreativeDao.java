package com.besideYou.textant.creative.dao;

import java.util.HashMap;
import java.util.List;

import com.besideYou.textant.common.dto.NoticeDto;
import com.besideYou.textant.common.dto.RecommendedBookDto;
import com.besideYou.textant.main.dto.BookInfoDto;

public interface CreativeDao {

	public List<BookInfoDto> getCreBooks();
	
	public int getMainBookListCount();
	
	public List<BookInfoDto> getMainRecencyList(HashMap<String, String> mainPageMap);

	public List<BookInfoDto> getMainScoreList(HashMap<String, String> mainPageMap);

	public List<BookInfoDto> getMainHitList(HashMap<String, String> mainPageMap);

	public List<RecommendedBookDto> getRecommendBooks();

	public BookInfoDto getOneBook(int bookArticleNum);

	public List<NoticeDto> getNoticeList(HashMap<String, String> oneFive);

	public List<NoticeDto> getEventList(HashMap<String, String> oneFive);
}
