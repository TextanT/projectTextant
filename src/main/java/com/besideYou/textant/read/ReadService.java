package com.besideYou.textant.read;

import org.springframework.ui.Model;

public interface ReadService {
	public String read(String fileName, Model model) throws Exception;
}
