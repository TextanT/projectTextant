package com.besideYou.textant.main.dto;

import org.springframework.web.multipart.MultipartFile;

public class BookInfoDto {
	
	private int bookArticleNum;
	private String bookName;
	private int totalPage;
	private int userNum;
	private String thumbnail;
	private String fileLocation;
	private String genre;
	private String writeDate;
	private int hit;
	private int totalScore;
	private int scoreNum;
	private String bookDesc;
	
	

	private MultipartFile bookFile;
	private MultipartFile bookImg;
	private int line;
	private int numOfOneLine;
	private int lineOfOnePage;
	
	public String getBookDesc() {
		return bookDesc;
	}
	public void setBookDesc(String bookDesc) {
		this.bookDesc = bookDesc;
	}
	
	public int getBookArticleNum() {
		return bookArticleNum;
	}
	public void setBookArticleNum(int bookArticleNum) {
		this.bookArticleNum = bookArticleNum;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getUserNum() {
		return userNum;
	}
	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public String getFileLocation() {
		return fileLocation;
	}
	public void setFileLocation(String fileLocation) {
		this.fileLocation = fileLocation;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getTotalScore() {
		return totalScore;
	}
	public void setTotalScore(int totalScore) {
		this.totalScore = totalScore;
	}
	public int getScoreNum() {
		return scoreNum;
	}
	public void setScoreNum(int scoreNum) {
		this.scoreNum = scoreNum;
	}
	

	public MultipartFile getBookFile() {
		return bookFile;
	}
	public void setBookFile(MultipartFile bookFile) {
		this.bookFile = bookFile;
	}
	public MultipartFile getBookImg() {
		return bookImg;
	}
	public void setBookImg(MultipartFile bookImg) {
		this.bookImg = bookImg;
	}
	public int getLine() {
		return line;
	}
	public void setLine(int line) {
		this.line = line;
	}
	public int getNumOfOneLine() {
		return numOfOneLine;
	}
	public void setNumOfOneLine(int numOfOneLine) {
		this.numOfOneLine = numOfOneLine;
	}
	public int getLineOfOnePage() {
		return lineOfOnePage;
	}
	public void setLineOfOnePage(int lineOfOnePage) {
		this.lineOfOnePage = lineOfOnePage;
	}
	@Override
	public String toString() {
		return "BookInfoDto [bookArticleNum=" + bookArticleNum + ", bookName=" + bookName + ", totalPage=" + totalPage
				+ ", userNum=" + userNum + ", thumbnail=" + thumbnail + ", fileLocation=" + fileLocation + ", genre="
				+ genre + ", writeDate=" + writeDate + ", hit=" + hit + ", totalScore=" + totalScore + ", scoreNum="
				+ scoreNum + ", bookDesc=" + bookDesc + "]";
	}
	
	
	
	
}
