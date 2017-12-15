package com.besideYou.textant.api.kakao.service;

import javax.servlet.http.HttpSession;

import com.besideYou.textant.main.dto.LoginDto;


public interface NaverService {
	
	public void naverLogin(LoginDto loginDto,HttpSession session);
}
