package com.besideYou.textant.main.login;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.besideYou.textant.main.dto.LoginDto;

public interface LoginService {
    String login(LoginDto loginDto, HttpSession session,Model model);
}
 