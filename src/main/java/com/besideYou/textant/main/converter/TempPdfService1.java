package com.besideYou.textant.main.converter;

import java.util.HashMap;

import org.springframework.ui.Model;

public interface TempPdfService1 extends Runnable{
	void main();

	void setOldFileName(String oldFileName);
	
	void setModel(Model model);

	HashMap<String,String> getProgress(Model model);
}
