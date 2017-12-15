package com.besideYou.textant.creative.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.besideYou.textant.creative.service.CreativeService;

@Controller
public class CreativeController {
	
	@Autowired
	CreativeService creativeService;
	
	@RequestMapping(value = "/creative.text", method = RequestMethod.GET)
	public String home(Model model, HttpSession session) {
		
		return creativeService.home(model, session);
	}
}
