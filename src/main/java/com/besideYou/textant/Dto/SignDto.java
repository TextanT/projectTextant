package com.besideYou.textant.Dto;

/**
 * @author Jin
 *
 */
public class SignDto {
	String id;
	String pass;
	String name;
	String mail;
	byte jender;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public byte getJender() {
		return jender;
	}
	public void setJender(byte jender) {
		this.jender = jender;
	}
	@Override
	public String toString() {
		return "SignDto [id=" + id + ", pass=" + pass + ", name=" + name + ", mail=" + mail + ", jender=" + jender
				+ "]";
	}
	
	
	
}
