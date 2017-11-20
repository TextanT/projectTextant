package com.besideYou.textant.Dto;

public class LoginDto {
	String id;
	String pass;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	@Override
	public String toString() {
		return "LoginDto [id=" + id + ", pass=" + pass + "]";
	}
}
