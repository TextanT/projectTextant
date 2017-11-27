package com.besideYou.textant.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.besideYou.textant.Dao.LoginDao;


@Service
public class LoginImpl implements LoginService {

	@Autowired
	LoginDao loginDao;
	
	@Override
	public String login(String id, String pass, HttpSession session,Model model) {
		
		
		System.out.println("----**----**---"+id+pass);
		
		String dbPass = loginDao.loginCheck(id);
		
		System.out.println(dbPass);
		
		String view = null;
		if (dbPass != null) {
			if (dbPass.equals(pass)) {
				
				session.setAttribute("id", id);
				
				// view = "redirect:"+prveUrl;
				view = "redirect:main.text";
				
			} else {
				view = "passFail";
			}
		} else {
			view = "signup";
		}
		return view;
	}
	@Override
	public String logout(HttpServletRequest req) {
		return null;
	}

	
}
