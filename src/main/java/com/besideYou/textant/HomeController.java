package com.besideYou.textant;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.besideYou.textant.converter.PdfService;
import com.besideYou.textant.converter.PdfServiceText;
import com.besideYou.textant.display.DisplayService;
import com.besideYou.textant.dto.CommentDto;
import com.besideYou.textant.dto.SignDto;
import com.besideYou.textant.login.LoginService;
import com.besideYou.textant.main.MainService;
import com.besideYou.textant.read.ReadService;
import com.besideYou.textant.sign.SignService;




@Controller
public class HomeController {
	
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
	
	String view;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value="/scroll.text", method = RequestMethod.GET)
	public String scroll() {
		return "scroll";
	}
	
	@RequestMapping(value="/commentCount.text")
	@ResponseBody
	public List<Integer> commentCount(int page,int bookArticleNum){
		return pdfServiceText.commentCount(page,bookArticleNum);
	}
	
	@RequestMapping(value="/commentRead.text")
	@ResponseBody
	public List<CommentDto> commentRead(int page,int nextPage,int pageListCount,int pageCountBlock,int pageCut,int bookArticleNum,int commentNum){
		System.out.println(page+""+nextPage+""+pageListCount+" "+pageCountBlock+" "+pageCut+" "+bookArticleNum+" "+commentNum);
		return pdfServiceText.scrollView(page,nextPage,pageListCount,pageCountBlock,pageCut,bookArticleNum,commentNum);
	}
	// 임시 스크롤 테스트
	@RequestMapping(value="/scroll.text", method = RequestMethod.POST)
	public String scrollWrite(CommentDto commentDto,int page,int commentTo,int commentTop) {
		commentDto.setPageGroup(page);
		commentDto.setUserId("obscu");
		pdfServiceText.scroll(commentDto,commentTo,commentTop);
		
		
		return "scroll";
	}
	
		@RequestMapping(value = "/main.text", method = RequestMethod.GET)
	public String home(Model model, HttpSession session) {
		return mainService.home(model, session);
	}


	
	@RequestMapping(value="/write.text",method=RequestMethod.GET)
	public String text(){
		return "writeForm";
	}

	
	@RequestMapping(value="/write.text",method=RequestMethod.POST)
	public String write(PdfFileDto fileDto)throws Exception{
		view=pdfServiceText.check(fileDto);
		if(view==null) {
			view="redirect:main.text";
		}
		return view;
	}

	@RequestMapping(value="/getProgress.text", produces="application/json;charset=UTF-8")
	@ResponseBody
	public HashMap<String,String> getProgress(Model model) {
		try {
			Thread.sleep(200);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return pdfService.getProgress(model);
	}

	@RequestMapping(value = "/login.text", method = RequestMethod.GET)
	public String loginForm(HttpServletRequest req, Model model) {
		return "main/login";
	}

	@RequestMapping(value = "/login.text", method = RequestMethod.POST)
	public String login(String id, String pass, String prveUrl, HttpSession session, Model model) {
		return loginService.login(id, pass, session, model);

	}
	
	@RequestMapping(value="/logout.text")
	public String  logout(HttpSession session){		
		session.invalidate();
		return "redirect:main.text";
	}
	
	
	@RequestMapping(value="/sign.text", method=RequestMethod.GET)
	public String  signForm(){	
		return "main/signup";
	}
	
	@RequestMapping(value="/sign.text", method=RequestMethod.POST)
	public String  sign(SignDto sDto ,@RequestParam("gender") byte jender){
		return signService.sign(sDto,jender);
	}
	
	@RequestMapping(value="/guest.text")
	public String guest() {
		return "redirect:main.text";
	}

	@RequestMapping(value="/first.text")
	public String first() {
		return "main/first";
	}
	
	@ResponseBody
	@RequestMapping(value="/joinIdCheck.text")
	public int joinIdCheck(String inputId){
		return signService.joinIdCheck(inputId);
	}
	
	@RequestMapping(value="/read.text")
	public String read(String fileName, Model model, String bookType) throws Exception{
		return readService.read(fileName, model, bookType);
	}
	
	@RequestMapping(value="/displayFile.text")
	public ResponseEntity<byte[]> displayFile(String fileName,String pageNum, String fileType) throws IOException {
		return displayService.display(fileName, pageNum, fileType);
	}
	
	@RequestMapping(value="/test.text")
	public String test(String fileName, Model model, String bookType) throws Exception{
		readService.read(fileName, model, bookType);
		return "viewer/test";
	}
}
