package com.besideYou.textant.main.login;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.besideYou.textant.main.dao.LoginServiceDao;
import com.besideYou.textant.main.dto.LoginDto;


@Service
public class LoginServiceImpl implements LoginService {

	@Autowired
	LoginServiceDao loginDao;
	
	@Override
	public String login(LoginDto loginDto, HttpSession session,Model model) {
		
		String dbPass;
		String view;
		String id;
		String pass;
		int userNum;
		
		id = loginDto.getUserId();
		pass = loginDto.getPass();
		
		dbPass = loginDao.loginCheck(id);
		
		System.out.println(dbPass);
		
		if (dbPass != null) {
			if (dbPass.equals(pass)) {
				session.setAttribute("id", id);
				userNum = loginDao.getUserNum(loginDto);
				session.setAttribute("userNum", userNum);
				
				System.out.println(userNum);
				
				view = "redirect:main.text";
				
			} else {
				view = "main/passFail";
			}
		} else {
			view = "main/noId";
		}
		return view;
	}
	
		
}
