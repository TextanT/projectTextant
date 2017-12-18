package com.besideYou.textant.main.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.besideYou.textant.main.converter.PdfService;
import com.besideYou.textant.main.converter.TempPdfService1;
import com.besideYou.textant.main.display.DisplayService;
import com.besideYou.textant.main.dto.BookInfoDto;
import com.besideYou.textant.main.dto.LoginDto;
import com.besideYou.textant.main.find.FindService;
import com.besideYou.textant.main.login.LoginService;
import com.besideYou.textant.main.main.MainService;
import com.besideYou.textant.main.read.ReadService;
import com.besideYou.textant.main.sign.SignService;
@Controller
public class MainController {

	@Autowired
	SignService signService;

	@Autowired
	LoginService loginService;

	@Autowired
	TempPdfService1 pdfService;

	@Autowired
	PdfService pdfServiceText;

	@Autowired
	DisplayService displayService;

	@Autowired
	MainService mainService;

	@Autowired
	ReadService readService;
	
	@Autowired
	FindService findService;
	
	

	String view;

	
	@RequestMapping(value = "/login.text", method = RequestMethod.GET)
	public String loginForm(HttpServletRequest req, Model model) {
		return "main/login";
	}

	@RequestMapping(value = "/login.text", method = RequestMethod.POST)
	public String login(LoginDto loginDto, HttpSession session, Model model) {
		return loginService.login(loginDto, session, model);
	}

	@RequestMapping(value = "/logout.text")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:main.text";
	}

	@RequestMapping(value = "/sign.text", method = RequestMethod.POST)
	public String sign(LoginDto login, @RequestParam("jender") byte jender) {
		return signService.sign(login, jender);
	}
	
//	@ResponseBody
//	@RequestMapping(value = "/joinIdCheck.text")
//	public int joinIdCheck(String inputId) {
//		return signService.joinIdCheck(inputId);
//	}
	@RequestMapping(value="/joinIdCheck.text")
	public ResponseEntity<String> commentRead(@RequestParam("inputId") String inputId, Model model) {
//		System.out.println("json");
//		ResponseEntity<Integer> re;
		
//		model.addAttribute("joinId",signService.joinIdCheck(inputId));
		return new ResponseEntity<String>(String.valueOf(signService.joinIdCheck(inputId)), HttpStatus.ACCEPTED);
//		System.out.println(commentService.getComments(articleNum, commentRow));
//		return "JSON";
	}

	@RequestMapping(value = "/guest.text")
	public String guest() {
		return "redirect:main.text";
	}
	
	
	@RequestMapping(value = "/find.text", method = RequestMethod.GET)
	public String findform(HttpServletRequest req, HttpSession session) {
		
		return "main/findForm";
	}
	@RequestMapping(value = "/findid.text", method = {RequestMethod.POST,RequestMethod.GET})
	public String findid(LoginDto loginDto, HttpSession session, Model model,String email) {
		
		return findService.findid(loginDto, session, model,email);
	}
	@RequestMapping(value = "/findpass.text", method = {RequestMethod.POST,RequestMethod.GET})
	public String findpass(LoginDto loginDto, HttpSession session, Model model, String id, String email) {
		
		return findService.findpass(loginDto, session, model, id, email);
	}

	@RequestMapping(value = "/first.text")
	public String first(HttpServletRequest req, HttpSession session) {
		return "main/first";
	}
	
	@RequestMapping(value = "/main.text", method = RequestMethod.GET)
	public String home(Model model, HttpSession session) {
		
		System.out.println(session.getAttribute("id"));
		
		return mainService.home(model, session);
	}
	

	@RequestMapping(value = "/write.text", method = RequestMethod.GET)
	public String text(HttpServletRequest req, HttpSession session) {
		return "writeForm";
	}
	
	@RequestMapping(value = "/write.text", method = RequestMethod.POST)
	public String write(HttpServletRequest req, HttpSession session, BookInfoDto bookInfoDto, int inside) throws Exception {
		bookInfoDto.setBookType("0");
		System.out.println("inside : " + inside);
		System.out.println(bookInfoDto);
		view = pdfServiceText.check(bookInfoDto, inside);
		if (view == null) {
			view = "redirect:main.text";
		}
		return view;
	}
	@RequestMapping(value = "/writeAmateur.text", method = RequestMethod.GET)
	public String textAmateur(HttpServletRequest req, HttpSession session) {
		return "writeAmateurForm";
	}
	
	@RequestMapping(value = "/writeAmateur.text", method = RequestMethod.POST)
	public String writeAmateur(HttpServletRequest req, HttpSession session, BookInfoDto bookInfoDto,int inside) throws Exception {
		bookInfoDto.setBookType("1");
		System.out.println(bookInfoDto);
		view = pdfServiceText.check(bookInfoDto,inside);
		if (view == null) {
			view = "redirect:creative.text";
		}
//		return view;
		return "redirect:creative.text";
	}

	/*@RequestMapping(value = "/getProgress.text", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public HashMap<String, String> getProgress(Model model) {
		try {
			Thread.sleep(200);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		return pdfService.getProgress(model);
	}*/


	@RequestMapping(value = "/read.text")
	public String read(String fileName, Model model, String bookType, HttpSession session) throws Exception {
		return readService.read(fileName, model, bookType, session);
	}

	@RequestMapping(value = "/displayFile.text")
	public ResponseEntity<byte[]> displayFile(String fileName, String pageNum, String fileType) throws IOException {
		return displayService.display(fileName, pageNum, fileType);
	}

	@RequestMapping(value = "/test.text")
	public String test(String fileName, Model model, String bookType, HttpSession session) throws Exception {
		readService.read(fileName, model, bookType, session);
		return "viewer/test";
	}
	
}
