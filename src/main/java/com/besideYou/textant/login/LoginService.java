package com.besideYou.textant.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import com.besideYou.textant.dto.SignDto;

public interface LoginService {

    String login(String id, String pass, HttpSession session,Model model);
    
}
 