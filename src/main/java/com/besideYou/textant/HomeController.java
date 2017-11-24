package com.besideYou.textant;

import java.awt.image.BufferedImage;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.besideYou.textant.Dto.LoginDto;
import com.besideYou.textant.Dto.SignDto;
import com.besideYou.textant.login.LoginService;
import com.besideYou.textant.sign.SignService;




/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	SignService signService;
	
	@Autowired
	LoginService loginService;
	
	@Autowired
	PdfService pdfService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/main.text", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpSession session) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		File file = new File("D:\\temp\\Converted_PdfFiles_to_Image\\");
		File[] files = file.listFiles();
		ArrayList<String> fileNames = new ArrayList<String>();
		for(File lis : files) {
			System.out.println("파일이름 : " + lis.getName());
			fileNames.add(lis.getName());
		}
		model.addAttribute("fileList", fileNames);
		model.addAttribute("id",session.getAttribute("id"));
		
		
		return "main";
	}
	/*
	@RequestMapping(value = "/write.text", method = RequestMethod.GET)
	public String writeForm() {
		return "writeForm1";
	}
	*/
	/*
	@RequestMapping(value = "/write.text", method = RequestMethod.POST)
	public String write(String title, String content, @RequestPart("textFile") List<MultipartFile> mFile, Model model) {
		for(MultipartFile file : mFile) {
			
			System.out.println(file.getOriginalFilename());
			File files = new File("d:/temp/temp/"+file.getOriginalFilename());
			
			try {
				BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(files));
				bos.flush();
				bos.write(file.getBytes());
				bos.close();
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			pdfService.setOldFileName(files.getName());
			pdfService.setModel(model);
			Thread thread = new Thread(pdfService);
			thread.start();
//			pdfService.run();
		}
		
		return "progress";
	}*/
	
	@Autowired
	PdfServiceText pdfServiceText;

	
	@RequestMapping(value="/write.text",method=RequestMethod.GET)
	public String text(){
		
		return "writeForm";
	}

	
	@RequestMapping(value="/write.text",method=RequestMethod.POST)
	public String write(PdfFileDto fileDto)throws Exception{
		String view=null;
		
		view=pdfServiceText.check(fileDto);
		if(view==null) {
			view="redirect:main.text";
		}
		
		return view;
	}
//	@RequestMapping(value="/viewer.text")
//	public String viewer(){
//		return "viewer/viewer";
//	}
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
	
//	@RequestMapping(value="/login.text")
//	public String login(LoginDto loginDto) {
//		System.out.println(loginDto);
//		return "redirect:main.text";
//	}
	
	@RequestMapping(value = "/login.text", method = RequestMethod.GET)
	public String loginForm(HttpServletRequest req, Model model) {
		
		return "main/login";
	}

	@RequestMapping(value = "/login.text", method = RequestMethod.POST)
	public String login(String id, String pass, String prveUrl, HttpSession session, Model model) {

		System.out.println("=-=-=-=-=-=" + id + pass + session);
		
		model.addAttribute("id",id);
		
		return loginService.login(id, pass, session, model);

	}
	@RequestMapping(value="/logout.text")
	public String  logout(HttpSession session){		
		session.invalidate();
		return "redirect:main.text";
	}
	
	
	@RequestMapping(value="/sign.text", method=RequestMethod.GET)
	public String  signForm(HttpServletRequest req, Model model){	
//		req.getHeader("Referer");
//		model.addAttribute("prevUrl",req.getHeader("Referer"));
		return "main/signup";
	}
	@RequestMapping(value="/sign.text", method=RequestMethod.POST)
	public String  sign(SignDto sDto ,@RequestParam("gender") byte jender){
		
		sDto.setJender(jender);
		
		signService.sign(sDto);
		
		System.out.println("------------------"+sDto+jender);
		
		return "main/login";
		
//		return null;
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
		
		int idStatus=signService.joinIdCheck(inputId);
		
		return idStatus;
	}
	
	
	
	
	@RequestMapping(value="/read.text")
	public String read(String fileName, Model model) throws Exception{
		int totalPageNum = 0;
		System.out.println(fileName);
		try {
			File file = new File("d:\\temp\\Converted_PdfFiles_to_Image\\"+fileName+"\\");
			File[] filefile = file.listFiles();
			for(File lfile : filefile) {
				String imgFile = lfile.getName();
				System.out.println(imgFile);
				if((imgFile.lastIndexOf("."))!=-1) {
					if((imgFile.substring(imgFile.lastIndexOf("."))).equals(".jpg")) {
						totalPageNum++;
						System.out.println("이미지 파일! " + totalPageNum);
					}	
				}
				
			}
		} catch (Exception e) {
			System.out.println("파일에 문제가 있군요");
			e.printStackTrace();
		}
		model.addAttribute("fileName", fileName);
		model.addAttribute("totalPageNum", totalPageNum);
//		return "content";
		return "viewer/viewer";
	}
	
	
	@RequestMapping(value="/displayFile.text")
	public ResponseEntity<byte[]> displayFile(String fileName,String pageNum) throws IOException {
		String realName = fileName.substring(0,fileName.lastIndexOf("."));
		File file = new File("d:/temp/Converted_PdfFiles_to_Image/"+fileName+"/"+/*realName+"_"+*/pageNum+".jpg");
		System.out.println(file.getName());
		BufferedInputStream bis=null;
		ResponseEntity<byte[]> entity = null;
		try {
			bis = new BufferedInputStream(new FileInputStream(file));
		} catch (FileNotFoundException e1) {
			System.out.println("마지막 페이지 입니다");
//			e1.printStackTrace();
			bis = new BufferedInputStream(new FileInputStream("d:/temp/temp/TEXTANT.png"));
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(bis),HttpStatus.BAD_REQUEST);
			bis.close();
			return entity;
		}
			try {
				HttpHeaders headers = new HttpHeaders();
				System.out.println(file);
				headers.add("Content-Disposition",
						"attachment; filename=\"" + URLEncoder.encode(file.getName(), "utf-8").replace("+", "%20") + "\"");
				entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(bis), headers, HttpStatus.CREATED);
			} catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
			} finally {
				bis.close();
			}
			return entity;
	}
	
}
