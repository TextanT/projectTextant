package com.besideYou.textant.genre.service;

import java.util.List;

import org.springframework.ui.Model;

import com.besideYou.textant.main.dto.BookInfoDto;

public interface GenreService {

	List<String> genreserch(String genre);
}
