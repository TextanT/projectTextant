package com.besideYou.textant.myStudy.dto;

public class BookMarkDto {
	private int bookMarkNum;
	private int bookArticleNum;
	private int userNum;
	private int page;
	private String writeData;
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
	@Override
	public String toString() {
		return "BookMarkDto [bookMarkNum=" + bookMarkNum + ", bookArticleNum=" + bookArticleNum + ", userNum=" + userNum
				+ ", page=" + page + ", writeData=" + writeData + "]";
	}
	
	
}
