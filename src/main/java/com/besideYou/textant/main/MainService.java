package com.besideYou.textant.main;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

public interface MainService {
	public String home(Model model, HttpSession session) ;
}
