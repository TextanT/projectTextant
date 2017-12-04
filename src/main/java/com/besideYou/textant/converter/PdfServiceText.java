package com.besideYou.textant.converter;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.besideYou.textant.PdfFileDto;
import com.besideYou.textant.dto.CommentDto;

public interface PdfServiceText {
	public String txtWrite(MultipartFile BookFile,MultipartFile bookImg,int line,int getNumOfOneLine,int getLineOfOnePage);
	public String pdfWrite(MultipartFile mFile,MultipartFile bookImg);
	public String check(PdfFileDto fileDto)throws Exception;
}
