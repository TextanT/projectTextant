package com.besideYou.textant.common.dto;

public class NoticeDto {

	int articleNum;
	String title;
	String writeDate;
	int userNum;
	int hit;
	int type;
	String contents;
	public int getArticleNum() {
		return articleNum;
	}
	public void setArticleNum(int articleNum) {
		this.articleNum = articleNum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
	public int getUserNum() {
		return userNum;
	}
	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
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
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	
	@Override
	public String toString() {
		return "NoticeDto [articleNum=" + articleNum + ", title=" + title + ", writeDate=" + writeDate + ", userNum="
				+ userNum + ", hit=" + hit + ", type=" + type + ", contents=" + contents + "]";
	}
	
}
