package com.besideYou.textant.member.common;

import java.io.File;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileSaveHelper {
	@Resource(name="saveProfile")
	private String saveProfile;
	
	public String save(MultipartFile fname) {
		// randomUUID은 전세계에서 유일한 값
		String storedFname=UUID.randomUUID().toString()+"_"+fname.getOriginalFilename();
		
		try {
			fname.transferTo(new File(saveProfile+storedFname));
		}catch(Exception e) {}
		
		return storedFname;
	}
}
