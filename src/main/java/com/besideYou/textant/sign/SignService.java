package com.besideYou.textant.sign;

import com.besideYou.textant.Dto.SignDto;

public interface SignService {
	
	public String sign(SignDto sDto);

	public int joinIdCheck(String inputId);
}
