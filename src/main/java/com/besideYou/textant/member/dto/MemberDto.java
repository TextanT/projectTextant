package com.besideYou.textant.member.dto;

import java.util.List;

public class MemberDto {
	private int userNum;
	private String userId;
	private String pass;
	private String email;
	private String nickName;
	private String profilePicture;
	private String realName;
	private int age;
	private int gender;
	private String comments;
	private byte fileStatus;
	private List<String> fileNames;
	
	public byte getFileStatus() {
		return fileStatus;
	}
	public void setFileStatus(byte fileStatus) {
		this.fileStatus = fileStatus;
	}
	public List<String> getFileNames() {
		return fileNames;
	}
	public void setFileNames(List<String> fileNames) {
		this.fileNames = fileNames;
	}
	
	
	public int getUserNum() {
		return userNum;
	}
	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getProfilePicture() {
		return profilePicture;
	}
	public void setProfilePicture(String profilePicture) {
		this.profilePicture = profilePicture;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	@Override
	public String toString() {
		return "MemberDto [userNum=" + userNum + ", userId=" + userId + ", pass=" + pass + ", email=" + email
				+ ", nickName=" + nickName + ", profilePicture=" + profilePicture + ", realName=" + realName + ", age="
				+ age + ", gender=" + gender + ", comments=" + comments + "]";
	}
	
	
	
}
