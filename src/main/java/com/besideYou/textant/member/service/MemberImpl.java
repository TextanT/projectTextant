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
	
	@Autowired
	private FileSaveHelper fileSaveHelper;
	
	@Resource(name="saveProfile")
	String saveProfile;
	
	private MemberDto mDto;;

	
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
	public void delete(String userNum, String userId, Model model) {
		memberDao.delete(userNum);
		model.addAttribute("userNum", userNum);
		model.addAttribute("userId", userId);
		
	}

	@Override
	public void getMie(String userNum, int fileStatus, Model model) {
		model.addAttribute("mDto", memberDao.getMie(userNum));
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
		
		if(deleteFileName != null) {
			ArrayList<String> delFileList = new ArrayList<>();
			for(String delFileName : deleteFileName) {
				delFileList.add(delFileName);
			}
			memberDao.dbDelFileName(delFileList);
			for(String storedFname : deleteFileName) {
				storageDelFileName(storedFname);
			}
		}
		if(mDto.getFileNames() == null) {
			if(deleteFileName != null) {
				if(fileCount == deleteFileName.length) {
					mDto.setFileStatus((byte)0);
				}
			}
		}else {
			commonFileUpload(mDto.getUserNum(), mDto.getFileNames());
			mDto.setFileStatus((byte)1);
		}
		memberDao.mie(mDto);	
		model.addAttribute("fileStatus", mDto.getFileStatus());
	}	

	public void storageDelFileName(String storedFname) {
		if(storedFname != null) {
			String formatName = storedFname.substring(storedFname.lastIndexOf(".")+1);    
			MediaType mType = MediaUtils.getMediaType(formatName);
			
			if(mType != null) {
				
				String front = storedFname.substring(0,12);
				String end = storedFname.substring(12);
				new File(saveProfile+(front+"s_"+end).replace('/', File.separatorChar)).delete();
			}
			File file = new File(saveProfile+storedFname);
			if(file.exists()) {
				file.delete();
			}
		}
	}

	@Override
	public void Member_Icon_Edit(MemberDto mDto) {
		// TODO Auto-generated method stub
		
	}
}