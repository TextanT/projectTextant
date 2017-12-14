package com.besideYou.textant.main.main;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.besideYou.textant.common.dto.RecommendedBookDto;
import com.besideYou.textant.main.dao.BookInfoDao;
import com.besideYou.textant.main.dto.BookInfoDto;
import com.besideYou.textant.main.mainpage.MainPage;
import com.besideYou.textant.manager.dao.ManagerDao;

@Service
public class MainServiceImpl implements MainService {
	@Resource(name="saveDir")
	String destinationDir;
	@Autowired
	BookInfoDao bookInfoDao;
	@Autowired
	MainPage mainPage;
	@Override
	public String home(Model model, HttpSession session) {
		
		File file;
		File[] files;
		
		List<BookInfoDto> fileNames;
		List<RecommendedBookDto> recommendNames;
		BookInfoDto bookInfoDto;
		HashMap<String, String> oneFive;
		//1.추천리스트를 받을것
		//2.최신순, 별점순, 조회순리스트를 받을것
		fileNames = new ArrayList<>();
		recommendNames = bookInfoDao.getRecommendBooks();
		for(RecommendedBookDto rbd : recommendNames) {
			bookInfoDto = bookInfoDao.getOneBook(rbd.getBookArticleNum());
			bookInfoDto.setBookDesc(rbd.getRecommendComment());
			fileNames.add(bookInfoDto);
		}

		oneFive = new HashMap<String, String>();
		oneFive.put("startPage", "1");
		oneFive.put("endPage", "4");
		model.addAttribute("getFirstNoticeList", bookInfoDao.getNoticeList(oneFive));
		model.addAttribute("getFirstEventList", bookInfoDao.getEventList(oneFive));
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
	public HashMap<Object,Object> getMainBookList(int sortType, int pageNum) {
		HashMap<Object,Object> getMainBookList = new HashMap<>();
		HashMap<String,String> mainPageMap = new HashMap<>();
		List<BookInfoDto> bookList = new ArrayList();
		int getMainBookListCount=bookInfoDao.getMainBookListCount();
		
			switch (sortType) {
			case 1:
				mainPageMap=mainPage.paging(pageNum, getMainBookListCount, 15, 5);
				getMainBookList.put("pageCoid", mainPageMap.get("pageCode"));
				bookList=bookInfoDao.getMainRecencyList(mainPageMap);
				getMainBookList.put("getMainBookList",bookList);
				break;
			case 2:
				mainPageMap=mainPage.paging(pageNum, getMainBookListCount, 15, 5);
				getMainBookList.put("pageCoid", mainPageMap.get("pageCode"));
				bookList=bookInfoDao.getMainScoreList(mainPageMap);
				getMainBookList.put("getMainBookList",bookList);
				break;
			case 3:
				mainPageMap=mainPage.paging(pageNum, getMainBookListCount, 15, 5);
				getMainBookList.put("pageCoid", mainPageMap.get("pageCode"));
				bookList=bookInfoDao.getMainHitList(mainPageMap);
				getMainBookList.put("getMainBookList",bookList);
				break;
			}
		return getMainBookList;
	}

	
	
	
}
