package com.besideYou.textant.api.kakao.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.besideYou.textant.api.kakao.dao.NaverLoginDao;
import com.besideYou.textant.main.dto.LoginDto;

@Service
public class NaverServiceImpl implements NaverService{

	@Autowired
	NaverLoginDao naverLoginDao;
	
	@Override
	public void naverLogin(LoginDto loginDto,HttpSession session) {
		
		LoginDto loDto = null; 
		
		loDto  = naverLoginDao.naverLoginCheck(loginDto);
		
		System.out.println("========================"+loDto);
		
		if(loDto == null) {
			
			naverLoginDao.naverLoginInsert(loginDto);
			loDto  = naverLoginDao.naverLoginCheck(loginDto);
			session.setAttribute("nickname", loDto.getNickName());
			session.setAttribute("userNum", loDto.getUserNum());
			session.setAttribute("id", loDto.getUserId());
		}else if(loDto != null){
			
			session.setAttribute("nickname", loDto.getNickName());
			session.setAttribute("userNum", loDto.getUserNum());
			session.setAttribute("id", loDto.getUserId());
			
		}
		
	}

	
}
