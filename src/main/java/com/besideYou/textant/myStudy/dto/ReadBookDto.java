package com.besideYou.textant.myStudy.dto;

public class ReadBookDto {
	private int readBookNum;
	private int bookArticleNum;
	private int userNum;
	private int page;
	private String writeDate;
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
	@Override
	public String toString() {
		return "ReadBookDto [readBookNum=" + readBookNum + ", bookArticleNum=" + bookArticleNum + ", userNum=" + userNum
				+ ", page=" + page + ", writeDate=" + writeDate + "]";
	}
	
	
}
