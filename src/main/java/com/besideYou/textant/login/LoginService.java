package com.besideYou.textant.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

public interface LoginService {

    String login(String id, String pass, HttpSession session,Model model);
    
   
	public String logout(HttpServletRequest req);
	
	
}
 