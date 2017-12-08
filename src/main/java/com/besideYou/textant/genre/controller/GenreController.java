package com.besideYou.textant.genre.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.besideYou.textant.genre.service.GenreService;
import com.besideYou.textant.main.dto.BookInfoDto;

@Controller
public class GenreController {
	
	@Autowired
	GenreService genreService;
	
	@RequestMapping(value="/genre.text", method = RequestMethod.GET)
	public String genre(Model model, BookInfoDto bookInfoDto) {
		
		
		/*List a;
		a = new ArrayList();
//		for(int i =1; i<=15; i++) {
//			a.add(i);
//		}
*/	
		genreService.genreserch(model, bookInfoDto);
		
		HashMap<String,List> a = new HashMap();
		
		
		
//		a.put("title", "너의 최장");
//		a.put("content", "을 물란다");
		
		
		
		List b;
		b = new ArrayList();
		for(int i =1; i<=15; i++) {
//			a.put("page", String.valueOf(i));
			
			b.add(i);
		}
		List bookAdreese;
		bookAdreese = new ArrayList();
		
		bookAdreese.add(bookInfoDto.getThumbnail());
		
		System.out.println(bookAdreese);
//		bookAdreese = bookInfoDto.getThumbnail();
		
		model.addAttribute("testList",b);
		
		model.addAttribute("bookadreese",bookAdreese);
		
		return "main/serchpage";
	}
}
