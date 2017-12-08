package com.besideYou.textant.genre.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.besideYou.textant.genre.dao.GenreDao;
import com.besideYou.textant.main.dto.BookInfoDto;

@Service
public class GenreServiceImpl implements GenreService{
	
	@Autowired
	GenreDao genreDao;
	
	@Override
	public List<String> genreserch(String genre) {
		
		List<String> gen;
		
		gen = genreDao.genreserch(genre);
		
		
		System.out.println("genreService.genreser : "+genre);
		System.out.println("genreService.genreser : "+gen);
		
		
		
		
		return gen;
	}
	

}
