package com.besideYou.textant.Dto;

public class CommentDto {
	private int commentNum;
	private String conet;
	private int pageGroup;
	private int depth;
	private int commentCount;
	private int commentGroup;
	private String userId;
	private String writeDate;
	
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
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
	
	@Override
	public String toString() {
		return "CommentDto [commentNum=" + commentNum + ", conet=" + conet + ", pageGroup=" + pageGroup + ", depth="
				+ depth + ", commentCount=" + commentCount + ", commentGroup=" + commentGroup + ", userId=" + userId
				+ ", writeDate=" + writeDate + "]";
	}
	
	
}
