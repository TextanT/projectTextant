package com.besideYou.textant.main.main;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

public interface MainService {
	public String home(Model model, HttpSession session) ;

	public HashMap<Object,Object> getMainBookList(int sortType, int pageNum);
}
