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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.besideYou.textant.comment.service.CommentService;
import com.besideYou.textant.main.converter.PdfService;
import com.besideYou.textant.main.converter.PdfServiceText;
import com.besideYou.textant.main.display.DisplayService;
import com.besideYou.textant.main.dto.BookInfoDto;
import com.besideYou.textant.main.dto.CommentDto1;
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
	PdfService pdfService;

	@Autowired
	PdfServiceText pdfServiceText;

	@Autowired
	DisplayService displayService;

	@Autowired
	MainService mainService;

	@Autowired
	ReadService readService;
//	
//	@Autowired
//	CommentService commentService;

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
	
	/*
	@ResponseBody
	@RequestMapping(value="/json.text", method = RequestMethod.GET)
	public HashMap<String, String> json(){
		HashMap<String, String> hashMap;
		hashMap = new HashMap();
		hashMap.put("first", "1");
		hashMap.put("second", "2");
		hashMap.put("third", "3");
		return hashMap; 
	}
	

	@RequestMapping(value="/scroll.text", method = RequestMethod.GET)
	public String scroll() {
		
		return "scroll";
	}
	@RequestMapping(value="/commentView.text", method = RequestMethod.GET)
	public String commentView(Model model) {
		
		return "commentView";
	}
	
	@RequestMapping(value="/commentTotalCount.text")
	@ResponseBody
	public List<Integer> commentTotalCount(int bookArticleNum,int page){
		return commentService.commentTotalCount(bookArticleNum);
	}
	
//	@RequestMapping(value="/commentCount.text", produces={"application/xml", "application/json"})
//	@ResponseBody
//	public List<Integer> commentCount(int page,int bookArticleNum){
//		return commentService.commentCount(page,bookArticleNum);
//	}
//	@ResponseBody
	@RequestMapping(value="/commentCount.text" )
	public ResponseEntity<HashMap<String,String>> commentCount(int page,int bookArticleNum){
		System.out.println("커맨트");
		HashMap<String,String> ha = new HashMap<String, String>();
		ha.put("1", "123");
		ha.put("2", "123");
		ha.put("3", "123");
		return new ResponseEntity<HashMap<String,String>>(ha,HttpStatus.ACCEPTED);
	}
	
	@RequestMapping(value="/commentRead.text")
	@ResponseBody
	public List<CommentDto> commentRead(HttpSession session,int page,int nextPage,int pageListCount,int pageCountBlock,int pageCut,int bookArticleNum,int commentNum,int commentDelete){
		int userNum=1;
		return commentService.scrollView(page,nextPage,pageListCount,pageCountBlock,pageCut,bookArticleNum,commentNum,commentDelete,userNum);
	}
	
	@RequestMapping(value="/commentTotalRead.text")
	@ResponseBody
	public List<CommentDto> commentTotalRead(HttpSession session,int page,int commentTotalCount,int bookArticleNum,int commentNum,int commentDelete){
		int userNum=1;
		return commentService.commentTotalRead(page,commentTotalCount,userNum,bookArticleNum,commentNum,commentDelete);
	}
	
	@RequestMapping(value="/commentDelete.text")
	@ResponseBody
	public int commentDelete(int commentNum,int commentGroup,HttpSession session){
		int userNum=1;
		
		return commentService.commentDelete(commentNum,commentGroup);
	}
	
	@RequestMapping(value="/scrollv.text", method = RequestMethod.POST)
	public String scrollWrite(CommentDto commentDto,int page,int commentTo,int commentTop,HttpSession session,int commentCheck) {
		commentDto.setPageGroup(page);
		commentDto.setUserNum(1);
		commentService.scroll(commentDto,commentTo,commentTop);
		System.out.println("ooooooooooooooooooooo"+commentCheck);
		if(commentCheck!=1) {
			return "scroll";	
		}else {
			return "commentView";
		}
	}

	@RequestMapping(value="/commentGoodOrBad.text")
	@ResponseBody
	public List<Integer> commentGoodOrBad(HttpSession session, int commentNum,int commentGoodOrBad){
//		String userNum = (String)session.getAttribute("userNum");
		int userNum=1;
		return commentService.commentGoodOrBad(commentNum,commentGoodOrBad,userNum);
	}
	
	@RequestMapping(value="/reportComment.text")
	@ResponseBody
	public int reportComment(HttpSession session, int commentNum){
//		String userNum = (String)session.getAttribute("userNum");
		int userNum=1;
		return commentService.reportComment(commentNum,userNum);
	}
	*/

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
