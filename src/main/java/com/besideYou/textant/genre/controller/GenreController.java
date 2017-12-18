package com.besideYou.textant.genre.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

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
	public HashMap<Object, Object> genre(HttpSession session, Model model, BookInfoDto bookInfoDto, String genre,int pageNum,int booktype) {
	
		
//		HashMap<String,List> a = new HashMap();

		List b; 
		b = new ArrayList();
		for(int i =1; i<=15; i++) {
			
			b.add(i);
		}
//		genreService.genreserch(genre);
		
		
		
		System.out.println("장르"+genre);
		
		model.addAttribute("testList",b);
		
		
		
		return genreService.genreserch(session, model,genre,pageNum,booktype);
	}
	
	
	
	@RequestMapping(value="/creativegenre.genre", method = RequestMethod.GET)
	@ResponseBody
	public HashMap<Object, Object> defgenre(HttpSession session,Model model, BookInfoDto bookInfoDto, String genre,int pageNum, int booktype) {
		
		
//		HashMap<String,List> a = new HashMap();
		
		List b; 
		b = new ArrayList();
		for(int i =1; i<=15; i++) {
			
			b.add(i);
		}
//		genreService.genreserch(genre);
		
		
		
		System.out.println("장르"+genre);
		
		model.addAttribute("testList",b);
		
		
		
		return genreService.genreserch(session, model, genre, pageNum, booktype);
	}
	
	
	@RequestMapping(value="/serchpage.genre")
	public String serchpage(Model model, HttpSession session) {
		
		model.addAttribute("nickname", session.getAttribute("nickname"));
		model.addAttribute("id", session.getAttribute("id"));
		
		return "/WEB-INF/views/main/searchpage.jsp";
	}
	@RequestMapping(value = "/creativeSerch.genre")
	public String createSerch(Model model, HttpSession session) {
		
		model.addAttribute("nickname", session.getAttribute("nickname"));
		model.addAttribute("id", session.getAttribute("id"));
		
		return "/WEB-INF/views/main/creativeSerch.jsp";
	}
	
	
	
}
