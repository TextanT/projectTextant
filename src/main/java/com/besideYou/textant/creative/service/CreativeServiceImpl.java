package com.besideYou.textant.creative.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.besideYou.textant.common.dto.RecommendedBookDto;
import com.besideYou.textant.creative.dao.CreativeDao;
import com.besideYou.textant.creative.page.CreativePage;
import com.besideYou.textant.main.dto.BookInfoDto;
import com.besideYou.textant.main.mainpage.MainPage;

@Service
public class CreativeServiceImpl implements CreativeService{
	
	@Autowired
	CreativeDao creativeDao;
	
	@Autowired
	CreativePage creativePage;
	
	@Override
	public String home(Model model, HttpSession session) {
		
		File file;
		File[] files;
		
		List<BookInfoDto> fileNames;
		List<RecommendedBookDto> recommendNames;
		BookInfoDto bookInfoDto;
		HashMap<String, String> oneFive;

		fileNames = new ArrayList<>();
		recommendNames = creativeDao.getRecommendBooks();
		for(RecommendedBookDto rbd : recommendNames) {
			bookInfoDto = creativeDao.getOneBook(rbd.getBookArticleNum());
			if(bookInfoDto!=null) {
				bookInfoDto.setBookDesc(rbd.getRecommendComment());
				fileNames.add(bookInfoDto);
			}
		}
		
		oneFive = new HashMap<String, String>();
		oneFive.put("startPage", "1");
		oneFive.put("endPage", "4");
		model.addAttribute("getFirstNoticeList", creativeDao.getNoticeList(oneFive));
		model.addAttribute("getFirstEventList", creativeDao.getEventList(oneFive));

		
		model.addAttribute("");
		model.addAttribute("fileList", fileNames);
		
		model.addAttribute("nickname", session.getAttribute("nickname"));
		model.addAttribute("id", session.getAttribute("id"));
		
		return "creative/creative";
		
	}
	
	@Override
	public HashMap<Object,Object> getCreativeBookList(int sortType, int pageNum) {
		HashMap<Object,Object> getMainBookList = new HashMap<>();
		HashMap<String,String> mainPageMap = new HashMap<>();
		List<BookInfoDto> bookList = new ArrayList();
		int getMainBookListCount=creativeDao.getMainBookListCount();
		
			switch (sortType) {
			case 1:
				mainPageMap=creativePage.paging(pageNum, getMainBookListCount, 15, 5);
				getMainBookList.put("pageCoid", mainPageMap.get("pageCode"));
				bookList=creativeDao.getMainRecencyList(mainPageMap);
				getMainBookList.put("getMainBookList",bookList);
				break;
			case 2:
				mainPageMap=creativePage.paging(pageNum, getMainBookListCount, 15, 5);
				getMainBookList.put("pageCoid", mainPageMap.get("pageCode"));
				bookList=creativeDao.getMainScoreList(mainPageMap);
				getMainBookList.put("getMainBookList",bookList);
				break;
			case 3:
				mainPageMap=creativePage.paging(pageNum, getMainBookListCount, 15, 5);
				getMainBookList.put("pageCoid", mainPageMap.get("pageCode"));
				bookList=creativeDao.getMainHitList(mainPageMap);
				getMainBookList.put("getMainBookList",bookList);
				break;
			}
		return getMainBookList;
	}
}
