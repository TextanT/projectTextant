package com.besideYou.textant.main.dto;

public class CommentDto1 {
	private int commentNum;
	private String conet;
	private int pageGroup;
	private int depth;
	private int bookArticleNum;
	private int commentCount;
	private int commentGroup;
	private int userNum;
	private String writeDate;
	private int commentGood;
	private int commentBad;
	private String nickName;
	private int pageStart;
	private int pageStop;
	private int totalCount;
	private String pageCode;
	
	
	
	public int getCommentNum() {
		return commentNum;
	}




	public void setCommentNum(int commentNum) {
		this.commentNum = commentNum;
	}




	public String getConet() {
		return conet;
	}




	public void setConet(String conet) {
		this.conet = conet;
	}




	public int getPageGroup() {
		return pageGroup;
	}




	public void setPageGroup(int pageGroup) {
		this.pageGroup = pageGroup;
	}




	public int getDepth() {
		return depth;
	}




	public void setDepth(int depth) {
		this.depth = depth;
	}




	public int getBookArticleNum() {
		return bookArticleNum;
	}




	public void setBookArticleNum(int bookArticleNum) {
		this.bookArticleNum = bookArticleNum;
	}




	public int getCommentCount() {
		return commentCount;
	}




	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}




	public int getCommentGroup() {
		return commentGroup;
	}




	public void setCommentGroup(int commentGroup) {
		this.commentGroup = commentGroup;
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




	public int getCommentGood() {
		return commentGood;
	}




	public void setCommentGood(int commentGood) {
		this.commentGood = commentGood;
	}




	public int getCommentBad() {
		return commentBad;
	}




	public void setCommentBad(int commentBad) {
		this.commentBad = commentBad;
	}




	public String getNickName() {
		return nickName;
	}




	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	


	public int getTotalCount() {
		return totalCount;
	}




	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}


	

	public String getPageCode() {
		return pageCode;
	}




	public void setPageCode(String pageCode) {
		this.pageCode = pageCode;
	}




	@Override
	public String toString() {
		return "CommentDto [commentNum=" + commentNum + ", conet=" + conet + ", pageGroup=" + pageGroup + ", depth="
				+ depth + ", bookArticleNum=" + bookArticleNum + ", commentCount=" + commentCount + ", commentGroup="
				+ commentGroup + ", userNum=" + userNum + ", writeDate=" + writeDate + ", commentGood=" + commentGood
				+ ", commentBad=" + commentBad + ", nickName=" + nickName + ", pageStart=" + pageStart + ", pageStop="
				+ pageStop + ", totalCount=" + totalCount + "]";
	}
}
