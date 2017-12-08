package com.besideYou.textant.manager.service;

import java.util.HashMap;

import org.springframework.ui.Model;

public interface ManagerService {
	void managerMain(Model model);
	void managerRecommendBook(Model model, int pageNum);
}
