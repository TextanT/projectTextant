package com.besideYou.textant.genre.service;

import org.springframework.ui.Model;

import com.besideYou.textant.main.dto.BookInfoDto;

public interface GenreService {

	String genreserch(Model model, BookInfoDto bookInfoDto);
}
