package com.besideYou.textant.main.read;

import java.io.File;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.besideYou.textant.main.dao.BookInfoDao;

@Service
public class ReadServiceImpl implements ReadService {
	@Resource(name="saveDir")
	String destinationDir;
	
	@Autowired
	BookInfoDao bookInfoDao;
	
	public String read(String fileName, Model model, String bookType) throws Exception{
		
	int totalPageNum = 0;
	System.out.println(fileName);
	
	totalPageNum = bookInfoDao.getTotalPages(fileName);
	
	if(fileName.substring(fileName.lastIndexOf(".")+1).equals("txt")) {
		model.addAttribute("isText","isText");
	}
	
	model.addAttribute("fileName", fileName);
	model.addAttribute("totalPageNum", totalPageNum);
	model.addAttribute("bookType", bookType);
//	return "content";
	return "viewer/viewer";
	}
}
