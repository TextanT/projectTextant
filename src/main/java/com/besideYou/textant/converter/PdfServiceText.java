package com.besideYou.textant.converter;

import org.springframework.web.multipart.MultipartFile;

import com.besideYou.textant.dto.BookInfoDto;

public interface PdfServiceText {
	public String txtWrite(MultipartFile BookFile,MultipartFile bookImg,int line,int getNumOfOneLine,int getLineOfOnePage);
	public String pdfWrite(MultipartFile mFile,MultipartFile bookImg);
	public String check(BookInfoDto bookInfoDto)throws Exception;

}
