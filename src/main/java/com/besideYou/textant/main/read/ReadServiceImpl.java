package com.besideYou.textant.main.read;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.besideYou.textant.main.dao.BookInfoDao;
import com.besideYou.textant.myStudy.dto.ReadBookDto;

@Service
public class ReadServiceImpl implements ReadService {
	@Resource(name="saveDir")
	String destinationDir;
	
	@Autowired
	BookInfoDao bookInfoDao;
	
	ReadBookDto readBookDto;
	public String read(String fileName, Model model, String bookType, HttpSession session) throws Exception{
		if(session.getAttribute("userNum")!=null) {
			readBookDto = new ReadBookDto();
			readBookDto.setBookArticleNum(bookInfoDao.getBookArticleNum(fileName));
			readBookDto.setUserNum((int)session.getAttribute("userNum"));
			
			String readOk = bookInfoDao.getReadBook(readBookDto);
			System.out.println("isItExist? : "+readOk);
			if(readOk !=null) {
				bookInfoDao.updateReadBook(readBookDto);
			} else {
				bookInfoDao.setReadBook(readBookDto);
			}
		}
		
		
		
	int totalPageNum = 0;
	String bookName = null;
	System.out.println(fileName);
	bookInfoDao.updateScore(fileName);
	totalPageNum = bookInfoDao.getTotalPages(fileName);
	bookName = bookInfoDao.getBookName(fileName);
	
	if(fileName.substring(fileName.lastIndexOf(".")+1).equals("txt")) {
		model.addAttribute("isText","isText");
	}
	
	model.addAttribute("bookArticleNum", bookInfoDao.getBookArticleNum(fileName));
	model.addAttribute("fileName", fileName);
	model.addAttribute("bookName", bookName);
	model.addAttribute("totalPageNum", totalPageNum);
	model.addAttribute("bookType", bookType);
//	return "content";
	return "viewer";
	}
}
