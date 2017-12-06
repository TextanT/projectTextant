package com.besideYou.textant.manager.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ManagerController {


//	@Autowired
//	SignService signService;
	
	@RequestMapping(value = "/managerMain.text")
	public String test(String fileName, Model model, String bookType) throws Exception {
		return "manager/managing";
	}
}
