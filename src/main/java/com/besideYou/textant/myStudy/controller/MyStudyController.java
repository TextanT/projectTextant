package com.besideYou.textant.myStudy.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.besideYou.textant.comment.dto.CommentDto;
import com.besideYou.textant.main.dto.BookInfoDto;
import com.besideYou.textant.myStudy.dto.BookMarkDto;
import com.besideYou.textant.myStudy.dto.BookWishDto;
import com.besideYou.textant.myStudy.dto.ReadBookDto;
import com.besideYou.textant.myStudy.service.MyStudyService;

@Controller
public class MyStudyController {
	@Autowired
	MyStudyService myStudyService;
	
//	나의 댓글 comment
//	내가 쓴책 write
//	내가읽은 책 read
//	내가 찜한책 wish
//	북마크 mark
	
	//메인페이지
	@RequestMapping(value = "myStudy.text")
	public String myStudymain(HttpSession session, Model model) {
		int userNum=(int)session.getAttribute("userNum");
		myStudyService.getMyStudyMain(userNum, model);
		
		
		return "myStudy/myStudyMain";
	}
	
	// *더보기 페이지
	
	//나의 댓글 전체 페이지
	@RequestMapping(value = "myCommentView.text")
	public String myCommentView(HttpSession session, Model model,int pageNum) {
		int userNum=(int)session.getAttribute("userNum");
		myStudyService.getMyComment(userNum, model, pageNum);
		
		return "myStudy/myCommentView";
	}
	//나의 댓글 댓글 전체 페이지
	@RequestMapping(value = "myCommentReplyView.text")
	public String myCommentReplyView(HttpSession session, Model model,int pageNum) {
		int userNum=(int)session.getAttribute("userNum");
		myStudyService.getMyCommentReply(userNum, model, pageNum);
		
		return "myStudy/myCommentReplyView";
	}
	
	//내가 쓴책 전체 페이지
	@RequestMapping(value = "myBookWriteView.text")
	public String myBookWriteView(HttpSession session, Model model,int pageNum) {
		int userNum=(int)session.getAttribute("userNum");
		myStudyService.getMyBookWrite(userNum, model, pageNum);
		
		return "myStudy/myBookWriteView";
	}
	
	//내가읽은 책 전체 페이지
	@RequestMapping(value = "myBookReadView.text")
	public String myBookReadView(HttpSession session, Model model,int pageNum) {
		int userNum=(int)session.getAttribute("userNum");
		myStudyService.getMyBookRead(userNum, model, pageNum);
		
		return "myStudy/myBookReadView";
	}
	
	//내가 찜한책 전체 페이지
	@RequestMapping(value = "myWishView.text")
	public String myWishView(HttpSession session, Model model,int pageNum) {
		int userNum=(int)session.getAttribute("userNum");
		myStudyService.getMyWish(userNum, model, pageNum);
		
		return "myStudy/myWishView";
	}
	
	//나의 북마크 전체 페이지
	@RequestMapping(value = "myBookMarkView.text")
	public String myBookMarkView(HttpSession session, Model model,int pageNum) {
		int userNum=(int)session.getAttribute("userNum");
		myStudyService.getMyBookMark(userNum, model, pageNum);
		
		return "myStudy/myBookMarkView";
	}
	
	//삭제
	@RequestMapping(value = "myCommentDelete.text")
	public String myCommentDelete(HttpSession session,CommentDto commentDto,int pageNum) {
		int userNum=(int)session.getAttribute("userNum");
		commentDto.setUserNum(userNum);
		myStudyService.commentDelete(commentDto);
		
		return "redirect:/myCommentView.text?pageNum="+pageNum;
		
	}
	
	@RequestMapping(value = "myCommentReplyDelete.text")
	public String myCommentReplyDelete(HttpSession session,CommentDto commentDto,int pageNum) {
		int userNum=(int)session.getAttribute("userNum");
		commentDto.setUserNum(userNum);
		myStudyService.commentDelete(commentDto);
		
		return "redirect:myCommentReplyView.text?pageNum="+pageNum;
	}
	
	@RequestMapping(value = "myBookWriteDelete.text")
	public String BookWriteDelete(HttpSession session,BookInfoDto bookInfoDto,int pageNum) {
		bookInfoDto.setUserNum((int)session.getAttribute("userNum"));
		myStudyService.bookWriteDelete(bookInfoDto);
		
		return "redirect:myBookWriteView.text?pageNum="+pageNum;
	}
	
	@RequestMapping(value = "myBookReadDelete.text")
	public String BookReadDelete(HttpSession session,ReadBookDto readBookDto  ,int pageNum) {
		int userNum=(int)session.getAttribute("userNum");
		readBookDto.setUserNum(userNum);
		myStudyService.bookReadDelete(readBookDto);
		
		return "redirect:myBookReadView.text?pageNum="+pageNum;
	}
	@RequestMapping(value = "myWishDelete.text")
	public String myWishDelete(HttpSession session,BookWishDto bookWishDto,int pageNum) {
		int userNum=(int)session.getAttribute("userNum");
		bookWishDto.setUserNum(userNum);
		myStudyService.wishDelete(bookWishDto);
		
		return "redirect:myWishView.text?pageNum="+pageNum;
	}
	
	@RequestMapping(value = "myBookMarkDelete.text")
	public String myBookMarkDelete(HttpSession session,BookMarkDto bookMarkDto, int pageNum) {
		int userNum=(int)session.getAttribute("userNum");
		bookMarkDto.setUserNum(userNum);
		myStudyService.bookMarkDelete(bookMarkDto);
		
		return "redirect:myBookMarkView.text?pageNum="+pageNum;
	}
}
