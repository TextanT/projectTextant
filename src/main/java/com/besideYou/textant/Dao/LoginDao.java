package com.besideYou.textant.Dao;

import com.besideYou.textant.Dto.SignDto;

public interface LoginDao {

	public String loginCheck(String id);
	
	public void sign(SignDto jmd);

	public String joinchek(String inputId);
	
	public String seleceid(String missid);
	
	public String selecepass(String misspass);

	
}
