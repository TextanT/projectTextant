package com.besideYou.textant;

import org.springframework.web.multipart.MultipartFile;

public class PdfFileDto {
	private MultipartFile bookFile;
	private MultipartFile bookImg;
	private int line;
	private int numOfOneLine;
	private int lineOfOnePage;
	
	public MultipartFile getBookFile() {
		return bookFile;
	}
	public void setBookFile(MultipartFile bookFile) {
		this.bookFile = bookFile;
	}
	public MultipartFile getBookImg() {
		return bookImg;
	}
	public void setBookImg(MultipartFile bookImg) {
		this.bookImg = bookImg;
	}
	public int getLine() {
		return line;
	}
	public void setLine(int line) {
		this.line = line;
	}
	public int getNumOfOneLine() {
		return numOfOneLine;
	}
	public void setNumOfOneLine(int numOfOneLine) {
		this.numOfOneLine = numOfOneLine;
	}
	public int getLineOfOnePage() {
		return lineOfOnePage;
	}
	public void setLineOfOnePage(int lineOfOnePage) {
		this.lineOfOnePage = lineOfOnePage;
	}
	
	
	
	
	
}
