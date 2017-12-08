package com.besideYou.textant.genre.service;

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
	public String genreserch(Model model, BookInfoDto bookInfoDto) {
		
		String genreser;
		String genre = null;
		
//		genreDao.genreserch(genre);
		
		
		genreser = bookInfoDto.getThumbnail();
		
		System.out.println("genreService.genreser : "+genreser);
		
		return null;
	}
	

}
