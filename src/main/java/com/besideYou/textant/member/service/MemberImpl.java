package com.besideYou.textant.member.service;



import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.besideYou.textant.member.common.FileSaveHelper;
import com.besideYou.textant.member.common.MediaUtils;
import com.besideYou.textant.member.dao.MemberDao;
import com.besideYou.textant.member.dto.FileDto;
import com.besideYou.textant.member.dto.MemberDto;

@Service
public class MemberImpl implements MemberService{
	
	
	@Autowired
	private MemberDao memberDao;
	
	@Resource(name="saveProfile")
	String saveProfile;

	
	@Override
	public MemberDto viewMyInfo(HttpSession session) {
		
		return memberDao.viewMyInfo(String.valueOf(session.getAttribute("userNum")));
				
	}

	@Override
	public MemberDto modifyGetMyInfo(String userNum) {
		
		return memberDao.modifyGetMyInfo(userNum);
	}

	@Override
	public void modifyMyInfo(MemberDto memberDto) {
		
		memberDao.modifyMyInfo(memberDto);
		}

	
	public void commonFileUpload(int articleNum, List<String> fileNames) {
		FileDto fileDto = null;
		
		for(String storedFname: fileNames){					
			fileDto = new FileDto();			
			fileDto.setStoredFname(storedFname);			
			fileDto.setArticleNum(articleNum);
			memberDao.insertFile(fileDto);				
		}
		
	}

	@Override
	public void getMie(String userNum, int fileStatus, Model model) {
		model.addAttribute("profile", memberDao.getMie(userNum));
		if(fileStatus==1){	
			List<String> fileList = memberDao.getFiles(userNum);
			model.addAttribute("fileList", fileList);
			model.addAttribute("fileCount", fileList.size());
		}else{

			model.addAttribute("fileCount", 0);
		}
		
	}

	@Override
	public void mie(MemberDto mDto, String[] deleteFileName, Model model, int fileCount) {
		// TODO Auto-generated method stub
		
	}
	
}