package com.besideYou.textant.main.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.besideYou.textant.main.converter.TempPdfService1;
import com.besideYou.textant.main.converter.PdfService;
import com.besideYou.textant.main.display.DisplayService;
import com.besideYou.textant.main.dto.BookInfoDto;
import com.besideYou.textant.main.dto.LoginDto;
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

	@RequestMapping(value = "/first.text")
	public String first(HttpServletRequest req, HttpSession session) {
		return "main/first";
	}
	
	@RequestMapping(value = "/main.text", method = RequestMethod.GET)
	public String home(Model model, HttpSession session) {
		return mainService.home(model, session);
	}
	
	@RequestMapping(value = "/write.text", method = RequestMethod.GET)
	public String text(HttpServletRequest req, HttpSession session) {
		return "writeForm";
	}
	
	@RequestMapping(value = "/write.text", method = RequestMethod.POST)
	public String write(HttpServletRequest req, HttpSession session, BookInfoDto bookInfoDto) throws Exception {
		view = pdfServiceText.check(bookInfoDto);
		if (view == null) {
			view = "redirect:main.text";
		}
		return view;
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

	

	@RequestMapping(value = "/mypage.text")
	public String mypage() {

		return "mypage";
	}


	@RequestMapping(value = "/read.text")
	public String read(String fileName, Model model, String bookType) throws Exception {
		return readService.read(fileName, model, bookType);
	}

	@RequestMapping(value = "/displayFile.text")
	public ResponseEntity<byte[]> displayFile(String fileName, String pageNum, String fileType) throws IOException {
		return displayService.display(fileName, pageNum, fileType);
	}

	@RequestMapping(value = "/test.text")
	public String test(String fileName, Model model, String bookType) throws Exception {
		readService.read(fileName, model, bookType);
		return "viewer/test";
	}
}
