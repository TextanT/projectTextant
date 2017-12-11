package com.besideYou.textant.genre.dao;

import java.util.HashMap;
import java.util.List;

import com.besideYou.textant.main.dto.BookInfoDto;

public interface GenreDao {

	List<String> genreserch(HashMap<String, String> genreMap);
	int getGenreCount(String genre);
}
