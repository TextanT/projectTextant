package com.besideYou.textant.api.kakao.contorller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.besideYou.textant.api.kakao.service.NaverService;
import com.besideYou.textant.main.dto.LoginDto;



@Controller
public class KakaoController {
	
	@Autowired
	NaverService naverService;
	
	@RequestMapping(value="/kakao.text",method= RequestMethod.GET)
	public String kakao() {
		
		return "api/kakaoApi";
	}
	@RequestMapping(value="/naverlogin.text",method= RequestMethod.GET)
	public String naver() {
		
		return "api/naverApi";
	}

	@RequestMapping(value="/callback.text",method= RequestMethod.GET)
	public String naverCallback() {
		
		return "api/naverCallbackApi";
	}
	/*@RequestMapping(value="/naverData.text")
	public String naverData(LoginDto loginDtoString id,HttpSession session) {
//		System.out.println("naverDate : " +loginDto);
//		loginDto.setSiteFrom(1);
//		naverService.naverLogin(loginDto,session);
		System.out.println(id);
		return "redirect:main.text";
	}*/
	
	@RequestMapping(value="/naverData.text")
	public String naverData(int userId,String kaId,int siteFrom, String email, String nickName, String gender, String realName, HttpSession session) {
		
		//loginDto와 age의 타입이 달라 생기는 오류 - 받는것 - 스트링 loginDto age - Integer
		
		LoginDto loginDto = new LoginDto();
		if(kaId!=null) {
			loginDto.setUserId(kaId);
		}else {
			loginDto.setUserId(String.valueOf(userId));
		}
		loginDto.setEmail(email);
		loginDto.setNickName(nickName);
		loginDto.setRealName(realName);
		loginDto.setSiteFrom(siteFrom);
		if(gender.contains("M")) {
			loginDto.setGender(1);
		}else if(gender.contains("F")){
			loginDto.setGender(0);			
		}else {
			loginDto.setGender(3);
		}
		
		naverService.naverLogin(loginDto,session);
		
//		loginDto.setGender(gender);
//		System.out.println(id);
//		System.out.println(userId);
//		System.out.println(email);
//		System.out.println(nickName);
//		System.out.println(age);
//		System.out.println(gender);
//		System.out.println(realName);
		
//		System.out.println("naverDate : " +loginDto);
//		loginDto.setSiteFrom(1);
//		System.out.println(id);
		return "redirect:main.text";
	}
}
