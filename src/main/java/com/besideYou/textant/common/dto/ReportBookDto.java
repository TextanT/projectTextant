package com.besideYou.textant.common.dto;

public class ReportBookDto {
	int reportBookNum;
	int bookArticleNum;
	int userNum;
	String writeDate;
	public int getReportBookNum() {
		return reportBookNum;
	}
	public void setReportBookNum(int reportBookNum) {
		this.reportBookNum = reportBookNum;
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
		return writeDate;
	}
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
	@Override
	public String toString() {
		return "ReportBookDto [reportBookNum=" + reportBookNum + ", bookArticleNum=" + bookArticleNum + ", userNum="
				+ userNum + ", writeDate=" + writeDate + "]";
	}
		
	
}
