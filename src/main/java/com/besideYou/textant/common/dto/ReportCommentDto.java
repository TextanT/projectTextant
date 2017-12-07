package com.besideYou.textant.common.dto;

public class ReportCommentDto {
	
	int reportCommentNum;
	int commentNum;
	int userNum;
	String writeDate;
	
	public int getReportCommentNum() {
		return reportCommentNum;
	}
	public void setReportCommentNum(int reportCommentNum) {
		this.reportCommentNum = reportCommentNum;
	}
	public int getCommentNum() {
		return commentNum;
	}
	public void setCommentNum(int commentNum) {
		this.commentNum = commentNum;
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
		return "ReportCommentDto [reportCommentNum=" + reportCommentNum + ", commentNum=" + commentNum + ", userNum="
				+ userNum + ", writeDate=" + writeDate + "]";
	}
	
}
