package com.besideYou.textant.myStudy.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.besideYou.textant.comment.common.Page;
import com.besideYou.textant.comment.dto.CommentDto;
import com.besideYou.textant.main.dto.BookInfoDto;
import com.besideYou.textant.myStudy.common.myStudyPage;
import com.besideYou.textant.myStudy.dao.MyStudyDao;
import com.besideYou.textant.myStudy.dto.BookMarkDto;
import com.besideYou.textant.myStudy.dto.BookWishDto;
import com.besideYou.textant.myStudy.dto.ReadBookDto;

@Service
public class MyStudyServiceImpl implements MyStudyService {
	@Autowired
	MyStudyDao myStudyDao;
	
	@Autowired
	myStudyPage page;
	
	@Override
	public void getMyStudyMain(int userNum, Model model) {
		HashMap<String, String> paging = new HashMap<>();
		paging.put("userNum", String.valueOf(userNum));
		paging.put("startRow", "1");
		paging.put("endRow", "10");
		paging.put("commentCheak", "0");
		model.addAttribute("commentList", myStudyDao.getMyComment(paging));
		paging.put("commentCheak", "1");
		model.addAttribute("commentReplyList", myStudyDao.getMyComment(paging));
		model.addAttribute("bookWriteList", myStudyDao.getMyBookWrite(paging));
		model.addAttribute("bookReadList", myStudyDao.getMyBookRead(paging));
		model.addAttribute("wishList", myStudyDao.getMyWish(paging));
		model.addAttribute("bookMarkList", myStudyDao.getMyBookmark(paging));
	}
	
	@Override //나의 댓글
	public void getMyComment(int userNum, Model model,int pageNum) {
		HashMap<String, String> paging = new HashMap<>();
		int count = 0;
		paging.put("commentCheak", "0");
		count = myStudyDao.getMyCommentCount(userNum);
		paging.put("userNum", String.valueOf(userNum));
			paging =page.paging(pageNum, count, 10, 5);
			paging.put("count", paging.get("count"));
			paging.put("startRow", paging.get("startRow"));
			paging.put("endRow", paging.get("endRow"));
			paging.put("pageCode", paging.get("pageCode"));
			model.addAttribute("pageCode", paging.get("pageCode"));
			model.addAttribute("commentList", myStudyDao.getMyComment(paging));
	}
	
	@Override //나의 댓글 댓글
	public void getMyCommentReply(int userNum, Model model,int pageNum) {
		HashMap<String, String> paging = new HashMap<>();
		int count = 0;
		paging.put("commentCheak", "1");
		count = myStudyDao.getMyCommentCount(userNum);
		paging.put("userNum", String.valueOf(userNum));
		paging =page.paging(pageNum, count, 10, 5);
		paging.put("count", paging.get("count"));
		paging.put("startRow", paging.get("startRow"));
		paging.put("endRow", paging.get("endRow"));
		paging.put("pageCode", paging.get("pageCode"));
		model.addAttribute("pageCode", paging.get("pageCode"));
		model.addAttribute("commentReplyList", myStudyDao.getMyComment(paging));
	}

	@Override //내가 쓴책
	public void getMyBookWrite(int userNum, Model model,int pageNum) {
		HashMap<String, String> paging = new HashMap<>();
		int count = 0;
		count = myStudyDao.getMyBookWriteCount(userNum);
		paging.put("userNum", String.valueOf(userNum));
			paging =page.paging(pageNum, count, 10, 5);
			paging.put("count", paging.get("count"));
			paging.put("startRow", paging.get("startRow"));
			paging.put("endRow", paging.get("endRow"));
			paging.put("pageCode", paging.get("pageCode").replaceFirst("myCommentView", "myBookWriteView"));
			model.addAttribute("pageCode", paging.get("pageCode"));
			model.addAttribute("bookWriteList", myStudyDao.getMyBookWrite(paging));
	}

	@Override //내가읽은 책
	public void getMyBookRead(int userNum, Model model,int pageNum) {
		HashMap<String, String> paging = new HashMap<>();
		int count = 0;
		count = myStudyDao.getMyBookReadCount(userNum);
		paging.put("userNum", String.valueOf(userNum));
			paging =page.paging(pageNum, count, 10, 5);
			paging.put("count", paging.get("count"));
			paging.put("startRow", paging.get("startRow"));
			paging.put("endRow", paging.get("endRow"));
			paging.put("pageCode", paging.get("pageCode").replaceFirst("myCommentView", "myBookReadView"));
			model.addAttribute("pageCode", paging.get("pageCode"));
			model.addAttribute("bookReadList", myStudyDao.getMyBookRead(paging));
	}

	@Override //내가 찜한책
	public void getMyWish(int userNum, Model model,int pageNum) {
		HashMap<String, String> paging = new HashMap<>();
		int count = 0;
		count = myStudyDao.getMyWishCount(userNum);
		paging.put("userNum", String.valueOf(userNum));
			paging =page.paging(pageNum, count, 10, 5);
			paging.put("count", paging.get("count"));
			paging.put("startRow", paging.get("startRow"));
			paging.put("endRow", paging.get("endRow"));
			paging.put("pageCode", paging.get("pageCode").replaceFirst("myCommentView", "myWishView"));
			model.addAttribute("pageCode", paging.get("pageCode"));
			model.addAttribute("wishtList", myStudyDao.getMyWish(paging));
	}

	@Override //북마크
	public void getMyBookMark(int userNum, Model model,int pageNum) {
		HashMap<String, String> paging = new HashMap<>();
		int count = 0;
		count = myStudyDao.getMyBookMarkCount(userNum);
		paging.put("userNum", String.valueOf(userNum));
			paging =page.paging(pageNum, count, 10, 5);
			paging.put("count", paging.get("count"));
			paging.put("startRow", paging.get("startRow"));
			paging.put("endRow", paging.get("endRow"));
			paging.put("pageCode", paging.get("pageCode").replaceFirst("myCommentView", "myBookMarkView"));
			model.addAttribute("pageCode", paging.get("pageCode"));
			model.addAttribute("bookmarkList", myStudyDao.getMyBookmark(paging));
	}

	@Override
	public void commentDelete(CommentDto commentDto) {
		myStudyDao.commentDelete(commentDto);
		
	}

	@Override
	public void bookWriteDelete(BookInfoDto bookInfoDto) {
		myStudyDao.bookWriteDelete(bookInfoDto);
		
	}

	@Override
	public void wishDelete(BookWishDto bookWishDto) {
		myStudyDao.wishDelete(bookWishDto);
		
	}

	@Override
	public void bookReadDelete(ReadBookDto readBookDto) {
		myStudyDao.bookWriteDelete(readBookDto);
		
	}

	@Override
	public void bookMarkDelete(BookMarkDto bookMarkDto) {
		myStudyDao.bookMarkDelete(bookMarkDto);
		
	}

	

	
	
	
}