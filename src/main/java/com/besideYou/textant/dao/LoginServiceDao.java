package com.besideYou.textant.dao;

import com.besideYou.textant.dto.LoginDto;

public interface LoginServiceDao {

	public String loginCheck(String id);
	
	public void sign(LoginDto jmd);

	public String joinchek(String inputId);
	
	public int getUserNum(LoginDto loginDto);

}
