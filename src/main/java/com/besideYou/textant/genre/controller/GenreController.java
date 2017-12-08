package com.besideYou.textant.genre.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.besideYou.textant.genre.service.GenreService;
import com.besideYou.textant.main.dto.BookInfoDto;

@Controller
public class GenreController {
	
	@Autowired
	GenreService genreService;
	
	@RequestMapping(value="/genre.genre", method = RequestMethod.GET)
	@ResponseBody
	public List<String> genre(Model model, BookInfoDto bookInfoDto, String genre) {
	
		
//		HashMap<String,List> a = new HashMap();

		List b;
		b = new ArrayList();
		for(int i =1; i<=15; i++) {
			
			b.add(i);
		}
		genreService.genreserch(genre);
		
		
		
		System.out.println("장르"+genre);
		
		model.addAttribute("testList",b);
		
		return genreService.genreserch(genre);
	}
	
	
	@RequestMapping(value="/serchpage.genre")
	public String serchpage(Model model) {
		
		List b;
		b = new ArrayList();
		for(int i =1; i<=15; i++) {
			
			b.add(i);
		}
		
		model.addAttribute("testList",b);
		
		return "/WEB-INF/views/main/searchpage.jsp";
	}
	
	
}
