package com.besideYou.textant.manager.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.besideYou.textant.manager.dao.ManagerDao;

@Service
public class ManagerServiceImplement implements ManagerService{

	@Autowired
	ManagerDao managerDao;
	
	@Override
	public void managerMain(Model model) {
		HashMap<String,String> oneTen;
		
		oneTen = new HashMap<String, String>();
		oneTen.put("startPage", "1");
		oneTen.put("endPage", "10");
		
		System.out.println(managerDao.getRecommendedBookList());
		System.out.println(managerDao.getReportBookList());
		System.out.println(managerDao.getReportCommentList(oneTen));
		System.out.println(managerDao.getBadCommentList());
		System.out.println(managerDao.getNoticeList());
	}

}
