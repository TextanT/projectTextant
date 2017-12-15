package com.besideYou.textant.api.kakao.dao;

import com.besideYou.textant.main.dto.LoginDto;

public interface NaverLoginDao {
	
	public LoginDto naverLoginCheck(LoginDto loginDto);
	
	public void naverLoginInsert(LoginDto loginDto);
}
