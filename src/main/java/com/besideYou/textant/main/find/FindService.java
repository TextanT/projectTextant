package com.besideYou.textant.main.find;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.besideYou.textant.main.dto.LoginDto;

public interface FindService {

	String findid(LoginDto loginDto, HttpSession session,Model model,String email);
	
	
}
