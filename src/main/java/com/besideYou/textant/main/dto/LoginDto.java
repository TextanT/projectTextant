package com.besideYou.textant.main.dto;

public class LoginDto {
	private int userNum;
	private String userId;
	private String pass;
	private int siteFrom;
	private int grade;
	private String email;
	private String nickName;
	private String profilePicture;
	private String realName;
	private int age;
	private int gender;
	private String comments;
	
	
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
	public int getSiteFrom() {
		return siteFrom;
	}
	public void setSiteFrom(int siteFrom) {
		this.siteFrom = siteFrom;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
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
		return "LoginDto [userNum=" + userNum + ", userId=" + userId + ", pass=" + pass + ", siteFrom=" + siteFrom
				+ ", grade=" + grade + ", email=" + email + ", nickName=" + nickName + ", profilePicture=" + profilePicture
				+ ", realName=" + realName + ", age=" + age + ", gender=" + gender + ", comments=" + comments + "]";
	}
	
}
