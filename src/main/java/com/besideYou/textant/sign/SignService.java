package com.besideYou.textant.sign;

import com.besideYou.textant.dto.SignDto;

public interface SignService {
	
	public String sign(SignDto sDto);

	public int joinIdCheck(String inputId);
}
