package com.besideYou.textant.main.sign;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.besideYou.textant.main.dao.LoginServiceDao;
import com.besideYou.textant.main.dto.LoginDto;



@Service
public class SignServiceImpl implements SignService{

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
