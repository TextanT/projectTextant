package com.besideYou.textant.genre.dao;

import java.util.List;

import com.besideYou.textant.main.dto.BookInfoDto;

public interface GenreDao {

	List<String> genreserch(String genre);
}
