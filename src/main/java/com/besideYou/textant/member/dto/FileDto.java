package com.besideYou.textant.member.dto;

public class FileDto {
	private int fileNum;
	private  String storedFname;
	private long fileLength;
	private int userNum;
	
	public int getFileNum() {
		return fileNum;
	}
	public void setFileNum(int fileNum) {
		this.fileNum = fileNum;
	}
	
	public String getStoredFname() {
		return storedFname;
	}
	public void setStoredFname(String storedFname) {
		this.storedFname = storedFname;
	}
	public long getFileLength() {
		return fileLength;
	}
	public void setFileLength(long fileLength) {
		this.fileLength = fileLength;
	}
	public int getArticleNum() {
		return userNum;
	}
	public void setArticleNum(int articleNum) {
		this.userNum = articleNum;
	}
	
	
}
