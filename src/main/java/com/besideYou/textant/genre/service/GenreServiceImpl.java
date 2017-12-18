package com.besideYou.textant.genre.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.besideYou.textant.genre.dao.GenreDao;
import com.besideYou.textant.genre.genrepage.GenrePage;
import com.besideYou.textant.main.dto.BookInfoDto;

@Service
public class GenreServiceImpl implements GenreService {

	@Autowired
	GenreDao genreDao;

	@Autowired
	GenrePage genrePage;

	@Override
	public HashMap<Object, Object> genreserch(HttpSession session, Model model,String genre ,int pageNum,int booktype) {
		
		List<String> gen = new ArrayList();
		HashMap<String, String> genreMap =new HashMap<>();
		HashMap<Object, Object> goodMap = null;
		int genreCount=0;
		genreMap.put("genre", genre);
		
		genreMap.put("booktype", String.valueOf(booktype));
		
		genreCount=genreDao.getGenreCount(genreMap);


		System.out.println("genreService.genreser : "+genreCount);
		
		genreMap = genrePage.paging(pageNum, genreCount, 15, 5);
		
		genreMap.put("genre", genre);
		
		genreMap.put("booktype", String.valueOf(booktype));
		
//		System.out.println("/-/-/-/-/-/-/-/-/"+genreMap.put("genre", genre));
		
//		System.out.println("genre--"+genre);
		
		
		
//		System.out.println("genre--"+model);
		
		gen=genreDao.genreserch(genreMap);
		goodMap = new HashMap<>();
		System.out.println(gen);
		goodMap.put("fileLocationList", gen);
		goodMap.put("pageCode",genreMap.get("pageCode"));
		System.out.println(gen);
//		System.out.println("이미지 경로----"+genreDao.genreserch(genreMap));
		
		model.addAttribute("nickname", session.getAttribute("nickname"));
		model.addAttribute("id", session.getAttribute("id"));
		
		return goodMap;
	}
	

}
