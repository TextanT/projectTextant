package com.besideYou.textant.manager.dto;

import org.springframework.stereotype.Component;

@Component
public class ManagingBookDto {
	int num;
	String bookName;
	int userNum;
	String userName;
	String writeDate;
	String comment;
	String reportComment;
	int type;
	int hit;
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getUserNum() {
		return userNum;
	}
	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
	public String getReportComment() {
		return reportComment;
	}
	public void setReportComment(String reportComment) {
		this.reportComment = reportComment;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	@Override
	public String toString() {
		return "ManagingBookDto [num=" + num + ", bookName=" + bookName + ", userNum=" + userNum + ", userName="
				+ userName + ", writeDate=" + writeDate + ", type=" + type + ", hit=" + hit + ", comment=" + comment
				+ ", reportComment=" + reportComment + "]";
	}
	
	
}
