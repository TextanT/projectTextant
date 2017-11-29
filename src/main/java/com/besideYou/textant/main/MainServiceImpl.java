package com.besideYou.textant.main;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class MainServiceImpl implements MainService {
	
	@Override
	public String home(Model model, HttpSession session) {
		
	File file = new File("D:\\temp\\Converted_PdfFiles_to_Image\\");
	File[] files = file.listFiles();
	ArrayList<String> fileNames = new ArrayList<String>();
	for(File lis : files) {
		System.out.println("파일이름 : " + lis.getName());
		fileNames.add(lis.getName());
	}
	model.addAttribute("fileList", fileNames);
	model.addAttribute("id",session.getAttribute("id"));
	return "main";
	}
}
