package com.besideYou.textant;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.besideYou.textant.Dto.CommentDto;
import com.besideYou.textant.Dto.LoginDto;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	PdfService pdfService;
	
	@Autowired
	PdfServiceText pdfServiceText;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value="/scroll.text", method = RequestMethod.GET)
	public String scroll(Model model) {
		
		return "scroll";
	}
	
	@RequestMapping(value="/commentCount.text")
	@ResponseBody
	public List<Integer> commentCount(int page,int bookArticleNum){
		return pdfServiceText.commentCount(page,bookArticleNum);
	}
	
	@RequestMapping(value="/commentRead.text")
	@ResponseBody
	public List<CommentDto> commentRead(int page,int nextPage,int pageListCount,int pageCountBlock,int pageCut,int bookArticleNum){
		
		return pdfServiceText.scrollView(page,nextPage,pageListCount,pageCountBlock,pageCut,bookArticleNum);
	}
	
	@RequestMapping(value="/scroll.text", method = RequestMethod.POST)
	public String scrollWrite(CommentDto commentDto,int page) {
		
		commentDto.setPageGroup(page);
		commentDto.setUserId("obscu");
		pdfServiceText.scroll(commentDto);
		return "scroll";
	}
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/main.text", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
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
		
		
		
		return "main";
	}


	
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
	@RequestMapping(value="/login.text")
	public String login(LoginDto loginDto) {
		System.out.println(loginDto);
		return "redirect:main.text";
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
