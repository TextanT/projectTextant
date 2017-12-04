package com.besideYou.textant.read;

import java.io.File;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class ReadServiceImpl implements ReadService {
	@Resource(name="saveDir")
	String destinationDir;
	
	public String read(String fileName, Model model, String bookType) throws Exception{
		
	int totalPageNum = 0;
	System.out.println(fileName);
	try {
		File file = new File(destinationDir+fileName+"\\");
		File[] filefile = file.listFiles();
		for(File lfile : filefile) {
			String imgFile = lfile.getName();
			System.out.println(imgFile);
			if((imgFile.lastIndexOf("."))!=-1) {
				if((imgFile.substring(imgFile.lastIndexOf("."))).equals(".jpg")) {
					totalPageNum++;
					System.out.println("이미지 파일! " + totalPageNum);
				}	
			}
			
		}
	} catch (Exception e) {
		System.out.println("파일에 문제가 있군요");
		e.printStackTrace();
	}
	model.addAttribute("fileName", fileName);
	model.addAttribute("totalPageNum", totalPageNum);
	model.addAttribute("bookType", bookType);
//	return "content";
	return "viewer/viewer";
	}
}
