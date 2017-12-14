package com.besideYou.textant.myStudy.dto;

public class ReadBookDto {
	private int readBookNum;
	private int bookArticleNum;
	private int userNum;
	private int page;
	private String writeDate;
	private String bookName;
	private String fileLocation;
	private String bookDesc;
	public int getReadBookNum() {
		return readBookNum;
	}
	public void setReadBookNum(int readBookNum) {
		this.readBookNum = readBookNum;
	}
	public int getBookArticleNum() {
		return bookArticleNum;
	}
	public void setBookArticleNum(int bookArticleNum) {
		this.bookArticleNum = bookArticleNum;
	}
	public int getUserNum() {
		return userNum;
	}
	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
	
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getFileLocation() {
		return fileLocation;
	}
	public void setFileLocation(String fileLocation) {
		this.fileLocation = fileLocation;
	}
	
	public String getBookDesc() {
		return bookDesc;
	}
	public void setBookDesc(String bookDesc) {
		this.bookDesc = bookDesc;
	}
	@Override
	public String toString() {
		return "ReadBookDto [readBookNum=" + readBookNum + ", bookArticleNum=" + bookArticleNum + ", userNum=" + userNum
				+ ", page=" + page + ", writeDate=" + writeDate + ", bookName=" + bookName + ", fileLocation="
				+ fileLocation + ", bookDesc=" + bookDesc + "]";
	}
	
	
}
