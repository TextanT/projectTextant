package com.besideYou.textant.creative.service;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

public interface CreativeService {

	public String home(Model model, HttpSession session) ;
	
	public HashMap<Object,Object> getCreativeBookList(int sortType, int pageNum);
}
