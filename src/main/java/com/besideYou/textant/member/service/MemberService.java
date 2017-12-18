package com.besideYou.textant.member.service;



import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.besideYou.textant.main.dto.LoginDto;
import com.besideYou.textant.member.dto.MemberDto;

public interface MemberService {

	public MemberDto viewMyInfo(HttpSession session);

	public void modifyMyInfo(MemberDto memberDto);

	public MemberDto modifyGetMyInfo(String userNum);

	public void getMie(String userNum, int fileStatus, Model model);

	public void mie(MemberDto mDto, String[] deleteFileName, Model model, int fileCount);



	


}
