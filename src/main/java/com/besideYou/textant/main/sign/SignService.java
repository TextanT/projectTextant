package com.besideYou.textant.main.sign;

import com.besideYou.textant.main.dto.LoginDto;

public interface SignService {
	
	public String sign(LoginDto login, byte jender);

	public int joinIdCheck(String inputId);
}
