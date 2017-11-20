package com.besideYou.textant;

import org.springframework.web.multipart.MultipartFile;

public interface PdfServiceText {
	public String txtWrite(MultipartFile BookFile,MultipartFile bookImg,int line,int getNumOfOneLine,int getLineOfOnePage);
	public String pdfWrite(MultipartFile mFile,MultipartFile bookImg);
	public String check(PdfFileDto fileDto)throws Exception;
}
