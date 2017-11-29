package com.besideYou.textant.dao;

import com.besideYou.textant.dto.SignDto;

public interface LoginDao {

	public String loginCheck(String id);
	
	public void sign(SignDto jmd);

	public String joinchek(String inputId);
	
	public String seleceid(String missid);
	
	public String selecepass(String misspass);

	
}
