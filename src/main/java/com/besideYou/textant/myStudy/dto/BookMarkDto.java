package com.besideYou.textant.myStudy.dto;

public class BookMarkDto {
	private int bookMarkNum;
	private int bookArticleNum;
	private int userNum;
	private int page;
	private String writeData;
	private String bookName;
	private String fileLocation;
	private String bookDesc;
	public int getBookMarkNum() {
		return bookMarkNum;
	}
	public void setBookMarkNum(int bookMarkNum) {
		this.bookMarkNum = bookMarkNum;
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
	public String getWriteData() {
		return writeData;
	}
	public void setWriteData(String writeData) {
		this.writeData = writeData;
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
		return "BookMarkDto [bookMarkNum=" + bookMarkNum + ", bookArticleNum=" + bookArticleNum + ", userNum=" + userNum
				+ ", page=" + page + ", writeData=" + writeData + ", bookName=" + bookName + ", fileLocation="
				+ fileLocation + ", bookDesc=" + bookDesc + "]";
	}
	
	
}
