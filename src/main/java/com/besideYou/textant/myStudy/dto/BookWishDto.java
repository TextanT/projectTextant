package com.besideYou.textant.myStudy.dto;

public class BookWishDto {
	private int wishNum;
	private int bookArticleNum;
	private int userNum;
	private String WriteDate;
	
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
	
	@Override
	public String toString() {
		return "BookWishDto [wishNum=" + wishNum + ", bookArticleNum=" + bookArticleNum + ", userNum=" + userNum
				+ ", WriteDate=" + WriteDate + "]";
	}
	
	
}
