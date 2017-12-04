package com.besideYou.textant.login;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.besideYou.textant.dto.LoginDto;

public interface LoginService {
    String login(LoginDto loginDto, HttpSession session,Model model);
}
 