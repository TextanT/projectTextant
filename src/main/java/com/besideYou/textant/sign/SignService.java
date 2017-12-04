package com.besideYou.textant.sign;

import com.besideYou.textant.dto.LoginDto;

public interface SignService {
	
	public String sign(LoginDto login, byte jender);

	public int joinIdCheck(String inputId);
}
