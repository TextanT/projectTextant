package com.besideYou.textant.main.converter;

import org.springframework.web.multipart.MultipartFile;

import com.besideYou.textant.main.dto.BookInfoDto;

public interface PdfService {
	public String txtWrite(MultipartFile BookFile,MultipartFile bookImg,int line,int getNumOfOneLine,int getLineOfOnePage);
	public String pdfWrite(MultipartFile mFile,MultipartFile bookImg);
	public String check(BookInfoDto bookInfoDto, int inside)throws Exception;

}
