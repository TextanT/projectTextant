package com.besideYou.textant.Dto;

import org.springframework.web.multipart.MultipartFile;

public class FileDto {
	String title;
	String content;
	MultipartFile textFile;
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public MultipartFile getTextFile() {
		return textFile;
	}
	public void setTextFile(MultipartFile textFile) {
		this.textFile = textFile;
	}
	@Override
	public String toString() {
		return "FileDto [title=" + title + ", content=" + content + ", textFile=" + textFile + "]";
	}
	
	
}
