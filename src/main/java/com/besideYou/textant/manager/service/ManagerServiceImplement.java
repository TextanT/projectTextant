package com.besideYou.textant.manager.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.besideYou.textant.common.dto.RecommendedBookDto;
import com.besideYou.textant.manager.dao.ManagerDao;
import com.besideYou.textant.manager.dto.ManagingDto;
import com.besideYou.textant.manager.page.ManagerPage;

@Service
public class ManagerServiceImplement implements ManagerService{

	@Autowired
	ManagerDao managerDao;
	
	@Autowired
	ManagerPage managerPage;
	
	
	int pageBlock = 5;
	int pageSize = 10;
	
	@Override
	public void managerMain(Model model) {
		HashMap<String,String> oneTen;
		
		oneTen = new HashMap<String, String>();
		oneTen.put("startPage", "1");
		oneTen.put("endPage", "10");
		
		System.out.println(managerDao.getReportCommentList(oneTen));
		model.addAttribute("getFirstRecommendedBookList",managerDao.getRecommendedBookList(oneTen));
		model.addAttribute("getFirstReportBookList",managerDao.getReportBookList(oneTen));
		model.addAttribute("getFirstReportCommentList",managerDao.getReportCommentList(oneTen));
		model.addAttribute("getFirstBadCommentList",managerDao.getBadCommentList(oneTen));
		model.addAttribute("getFirstNoticeList",managerDao.getNoticeList(oneTen));
	}
	
	@Override
	public void managerRecommendBook(Model model, int pageNum) {
		int totalCount = 0;
//		pageNum = 1;
		ArrayList<RecommendedBookDto> recommendBookList = null;
		HashMap<String, String> pagingMap = null;
		HashMap<String, String> paramMap = null; 
		ArrayList<ManagingDto> managingList = null;  
		ManagingDto managingDto = null;
		try {
			totalCount = managerDao.getTotalRecommendBookCount();

			pagingMap = managerPage.paging(pageNum, totalCount, pageSize, pageBlock);

			int startRow = managerPage.getStartRow();
			int endRow = managerPage.getEndRow();
			paramMap = new HashMap<>();
			paramMap.put("startPage", String.valueOf(startRow));
			paramMap.put("endPage", String.valueOf(endRow));

			recommendBookList = (ArrayList<RecommendedBookDto>) managerDao.getRecommendedBookList(paramMap);
			System.out.println(recommendBookList);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		
		managingList = new ArrayList<>();
		
		for(RecommendedBookDto ml : recommendBookList) {
			managingDto = new ManagingDto();
			managingDto.setNum(ml.getRecommendNum());
			managingDto.setBookName(managerDao.getBookName(ml.getBookArticleNum()));
			managingDto.setUserName(managerDao.getUserName(ml.getUserNum()));
			managingDto.setComment(ml.getRecommendComment());
			managingDto.setWriteDate(ml.getWriteDate());
			managingList.add(managingDto);
		}
		
		model.addAttribute("totalCount", totalCount);
		System.out.println(pagingMap.get("pageCode"));
		model.addAttribute("managingList", managingList);
		model.addAttribute("pageCode", pagingMap.get("pageCode"));

		
		
//		model.addAttribute("managerRecommendBookList", managerDao.getRecommendedBookList(pagingMap));
	}

}
