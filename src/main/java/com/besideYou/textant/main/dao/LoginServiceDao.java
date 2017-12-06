package com.besideYou.textant.main.dao;

import org.springframework.stereotype.Repository;

import com.besideYou.textant.main.dto.LoginDto;
@Repository
public interface LoginServiceDao {

	public String loginCheck(String id);
	
	public void sign(LoginDto jmd);

	public String joinchek(String inputId);
	
	public LoginDto getUserNum(LoginDto loginDto);

}
