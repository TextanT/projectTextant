package com.besideYou.textant.sign;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.besideYou.textant.dao.LoginServiceDao;
import com.besideYou.textant.dto.LoginDto;



@Service
public class SignImpl implements SignService{

	@Autowired
	LoginServiceDao loDao;
	
	@Override
	public String sign(LoginDto login, byte jender) {
		System.out.println(login);
		login.setGender(jender);
		loDao.sign(login);
		
		return "main/first";
	}

	@Override
	public int joinIdCheck(String inputId) {
		String dbId;
		dbId = loDao.joinchek(inputId);
		
		int re = 0;
		
		if(dbId==null) {
			re=1;
		}else{
			
			re=0;
		} 
		
		
		return re;
	}

	
}
