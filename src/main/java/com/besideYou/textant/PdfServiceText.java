package com.besideYou.textant;

import org.springframework.web.multipart.MultipartFile;

import com.besideYou.textant.Dto.CommentDto;

public interface PdfServiceText {
	public String txtWrite(MultipartFile BookFile,MultipartFile bookImg,int line,int getNumOfOneLine,int getLineOfOnePage);
	public String pdfWrite(MultipartFile mFile,MultipartFile bookImg);
	public String check(PdfFileDto fileDto)throws Exception;
	public void scroll(CommentDto commentDto);
}
