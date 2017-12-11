package com.besideYou.textant.myStudy.dto;

public class BookWishDto {
	private int wishNum;
	private int bookArticleNum;
	private int userNum;
	private String WriteDate;
	private String bookName;
	private String fileLocation;
	
	public int getWishNum() {
		return wishNum;
	}
	public void setWishNum(int wishNum) {
		this.wishNum = wishNum;
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
	public String getWriteDate() {
		return WriteDate;
	}
	public void setWriteDate(String writeDate) {
		WriteDate = writeDate;
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
	@Override
	public String toString() {
		return "BookWishDto [wishNum=" + wishNum + ", bookArticleNum=" + bookArticleNum + ", userNum=" + userNum
				+ ", WriteDate=" + WriteDate + ", bookName=" + bookName + ", fileLocation=" + fileLocation + "]";
	}
	
	
}
