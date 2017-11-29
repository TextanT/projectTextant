package com.besideYou.textant.sign;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.besideYou.textant.dao.LoginDao;
import com.besideYou.textant.dto.SignDto;



@Service
public class SignImpl implements SignService{

	@Autowired
	LoginDao loDao;
	
	@Override
	public String sign(SignDto sDto) {
		
		loDao.sign(sDto);
		
		return null;
	}

	@Override
	public int joinIdCheck(String inputId) {
		
		String dbId = loDao.joinchek(inputId);
		
		int re = 0;
		
		if(dbId==null) {
			re=1;
		}else{
			
			re=0;
		} 
		
		
		return re;
	}

	
}
