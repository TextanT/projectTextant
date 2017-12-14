package com.besideYou.textant.creative.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

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
		//1.추천리스트를 받을것
		//2.최신순, 별점순, 조회순리스트를 받을것
		
		fileNames = creativeDao.getCreBooks();
		
//		List<String> bookname;
//		
//		bookname = bookInfoDao.getbookname();
		
		/*file = new File(destinationDir);
		files = file.listFiles();
		fileNames = new ArrayList<String>();
		
		for (File lis : files) {
			System.out.println("파일이름 : " + lis.getName());
			fileNames.add(lis.getName());
		}
		*/
		
//		HashMap<Object, Object> genreMap =new HashMap<>();
//		genreMap = mainPage.paging(1, bookInfoDao.getNewTotal(), 15, 5);
		
		model.addAttribute("");
		model.addAttribute("fileList", fileNames);
		
		model.addAttribute("nickname", session.getAttribute("nickname"));
		model.addAttribute("id", session.getAttribute("id"));
		
		return "main";
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
