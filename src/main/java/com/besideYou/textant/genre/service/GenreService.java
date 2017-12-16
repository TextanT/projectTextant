package com.besideYou.textant.genre.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.ui.Model;

import com.besideYou.textant.main.dto.BookInfoDto;

public interface GenreService {

	HashMap<Object, Object> genreserch(Model model,String genre,int pageNum, int booktype);

}
