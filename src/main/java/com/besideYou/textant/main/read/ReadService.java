package com.besideYou.textant.main.read;

import org.springframework.ui.Model;

public interface ReadService {
	public String read(String fileName, Model model, String bookType) throws Exception;
}
