package com.besideYou.textant.main.login;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.besideYou.textant.main.dao.LoginServiceDao;
import com.besideYou.textant.main.dto.LoginDto;


@Service
public class LoginServiceImpl implements LoginService {

	@Autowired
	LoginServiceDao loginDao;
	
	@Override
	public String login(LoginDto loginDto, HttpSession session,Model model) {
		
		String dbPass;
		String view;
		String id;
		String pass;
		String nickname;
		int userNum;
		
		id = loginDto.getUserId();
		pass = loginDto.getPass();
		nickname = loginDto.getNickName();
		
		dbPass = loginDao.loginCheck(id);
		
		System.out.println("dbPass:"+dbPass);
		
		if (dbPass != null) {
			if (dbPass.equals(pass)) {
				
				session.setAttribute("id", id);
				
				System.out.println(loginDto);
				loginDto = loginDao.getUserNum(loginDto);
				session.setAttribute("userNum", loginDto.getUserNum());
				System.out.println("userNum:session:"+session.getAttribute("userNum"));
				session.setAttribute("nickname", loginDto.getNickName());
//				session.setAttribute("id", loginDto.getUserId());
//				System.out.println(userNum);
				System.out.println("nickName"+nickname);
				
				view = "redirect:main.text";
				
			} else {
				view = "main/passFail";
			}
		} else {
			view = "main/noId";
		}
		return view;
	}
	
		
}
