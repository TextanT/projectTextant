package com.besideYou.textant.common.dto;

public class RecommendedBookDto {
	int recomendedNum;
	int bookArticleNum;
	int userNum;
	String recommendComment;
	String writeDate;
	
	public int getRecomendedNum() {
		return recomendedNum;
	}
	public void setRecomendedNum(int recomendedNum) {
		this.recomendedNum = recomendedNum;
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
	public String getRecommendComment() {
		return recommendComment;
	}
	public void setRecommendComment(String recommendComment) {
		this.recommendComment = recommendComment;
	}
	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
	@Override
	public String toString() {
		return "RecommendedBookDto [recomendedNum=" + recomendedNum + ", bookArticleNum=" + bookArticleNum
				+ ", userNum=" + userNum + ", recommendComment=" + recommendComment + ", writeDate=" + writeDate + "]";
	}
	
	
	
}
