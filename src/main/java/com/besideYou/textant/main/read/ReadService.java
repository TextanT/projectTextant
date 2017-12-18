package com.besideYou.textant.main.read;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

public interface ReadService {
	public String read(String fileName, Model model, String bookType, HttpSession session) throws Exception;
}
