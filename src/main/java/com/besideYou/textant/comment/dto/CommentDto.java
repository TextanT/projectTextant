package com.besideYou.textant.comment.dto;

public class CommentDto {
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
	private String bookName;
	private String fileLocation;
	private String replyTarget;
	private String bookDesc;
	


	

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







	public int getPageStart() {
		return pageStart;
	}







	public void setPageStart(int pageStart) {
		this.pageStart = pageStart;
	}







	public int getPageStop() {
		return pageStop;
	}







	public void setPageStop(int pageStop) {
		this.pageStop = pageStop;
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







	public String getBookName() {
		return bookName;
	}







	public void setBookName(String bookName) {
		this.bookName = bookName;
	}







	public String getFileLocation() {
		return fileLocation;
	}







	public void setFileLocation(String fileLocation) {
		this.fileLocation = fileLocation;
	}




	


	public String getReplyTarget() {
		return replyTarget;
	}







	public void setReplyTarget(String replyTarget) {
		this.replyTarget = replyTarget;
	}

	





	public String getBookDesc() {
		return bookDesc;
	}







	public void setBookDesc(String bookDesc) {
		this.bookDesc = bookDesc;
	}







	@Override
	public String toString() {
		return "CommentDto [commentNum=" + commentNum + ", conet=" + conet + ", pageGroup=" + pageGroup + ", depth="
				+ depth + ", bookArticleNum=" + bookArticleNum + ", commentCount=" + commentCount + ", commentGroup="
				+ commentGroup + ", userNum=" + userNum + ", writeDate=" + writeDate + ", commentGood=" + commentGood
				+ ", commentBad=" + commentBad + ", nickName=" + nickName + ", pageStart=" + pageStart + ", pageStop="
				+ pageStop + ", totalCount=" + totalCount + ", pageCode=" + pageCode + ", bookName=" + bookName
				+ ", fileLocation=" + fileLocation + ", replyTarget=" + replyTarget + ", bookDesc=" + bookDesc + "]";
	}
}
