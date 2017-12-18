package com.besideYou.textant.member.controller;

import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.besideYou.textant.member.dto.MemberDto;
import com.besideYou.textant.member.service.MemberService;


@Controller
public class MemberController {

	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "/mypage.text")
    public String mypage(HttpSession session, Model model){

		MemberDto memberDto=memberService.viewMyInfo(session);
		model.addAttribute("memberDto", memberDto);
		
		return "mypage";        
    }

	@RequestMapping(value="/modify.text", method=RequestMethod.GET)
	public String modifyGetMyInfo(@ModelAttribute("userNum") String userNum, 
											 @ModelAttribute("userId") String userId, Model model){
		
		
		model.addAttribute("memberDto", memberService.modifyGetMyInfo(userNum));
		return "modify";
	}
	
	
	@RequestMapping(value="/modify.text", method=RequestMethod.POST)
	public String update(MemberDto memberDto, String userId, Model model){
		memberService.modifyMyInfo(memberDto);

		return "redirect:/mypage.text";
	}
//-----------------------------------------------------------------------------------------------------------	
	

	@RequestMapping(value="/Member_Icon_Edit.text",method=RequestMethod.GET)
	public String mieForm(HttpSession session){		
		return "Member_Icon_Edit";
	}

	@Transactional
	@RequestMapping(value="/Member_Icon_Edit.text", method=RequestMethod.POST)
	public String mie(MemberDto mDto, HttpSession session) {
		mDto.setUserId((String)session.getAttribute("userId"));
		memberService.Member_Icon_Edit(mDto);
		return "redirect:/mypage";
	}
	
	
	
	
//	@RequestMapping(value="/Member_Icon_Edit.text", method=RequestMethod.GET)
//	public String getMie(@ModelAttribute("userNum") String userNum, 
//							   @ModelAttribute("userId") String userId, 
//							   @ModelAttribute("fileStatus") int fileStatus, Model model){
//				
//		memberService.getMie(userNum, fileStatus, model);	
//		return "Member_Icon_Edit.text";
//	}
//	
//	@RequestMapping(value="/Member_Icon_Edit.text", method=RequestMethod.POST)
//	public String mie(MemberDto mDto, String[] deleteFileName, String userId, Model model, int fileCount){	
//		memberService.mie(mDto, deleteFileName, model, fileCount);						
//		return "rMember_Icon_Edit";
//	}
	
//-----------------------------------------------------------------------------------------------------------		
	@RequestMapping(value="/delete.bbs")
	public String delete(String userNum, String userId, Model model) {
	memberService.delete(userNum, userId, model);
	return "redirect:Member_Icon_Edit?";
}

}
