package com.besideYou.textant.main.find;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.besideYou.textant.main.dao.LoginServiceDao;
import com.besideYou.textant.main.dto.LoginDto;

@Service
public class FindServiceImpl implements FindService {

	@Autowired
	LoginServiceDao loginDao;

	@Override
	public String findid(LoginDto loginDto, HttpSession session, Model model, String email) {
		String dbPass;
		String view;
		
		System.out.println(email);
	
		dbPass = loginDao.findid(email);

		System.out.println("dbPass:" + dbPass);

		if (dbPass != null) {
				
				model.addAttribute("findid",dbPass);
				view = "main/idfindOk";
		} else {
			view = "main/noId";
		}
		return view;
	}
}
