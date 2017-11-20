package com.besideYou.textant;

import java.util.HashMap;

import org.springframework.ui.Model;

public interface PdfService extends Runnable{
	void main();

	void setOldFileName(String oldFileName);
	
	void setModel(Model model);

	HashMap<String,String> getProgress(Model model);
}
