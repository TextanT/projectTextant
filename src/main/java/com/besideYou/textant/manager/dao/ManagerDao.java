package com.besideYou.textant.manager.dao;

import java.util.HashMap;
import java.util.List;

import com.besideYou.textant.comment.dto.CommentDto;
import com.besideYou.textant.common.dto.NoticeDto;
import com.besideYou.textant.common.dto.RecommendedBookDto;
import com.besideYou.textant.common.dto.ReportBookDto;
import com.besideYou.textant.common.dto.ReportCommentDto;

public interface ManagerDao {
	
	List<ReportCommentDto> getReportCommentList(HashMap<String,String> hashMap);
	List<CommentDto> getBadCommentList(HashMap<String,String> hashMap);
	List<ReportBookDto> getReportBookList(HashMap<String,String> hashMap);
	List<NoticeDto> getNoticeList(HashMap<String,String> hashMap);
	List<RecommendedBookDto> getRecommendedBookList(HashMap<String,String> hashMap);
	
	int getTotalRecommendBookCount();
	int getTotalReportBookCount();
	String getUserName(int userNum);
	String getBookName(int bookArticleNum);
	
	RecommendedBookDto getRecommendedBookOne(int num);
	void writeRecommendbook(RecommendedBookDto recommendedBookDto);
	void deleteRecommendBook(int recommendNum);
	ReportBookDto getManagingBookOne(int num);
	void deleteReportBook(int reportBookNum);
	
	int getUserGrade(int userNum);
	int getTotalNoticeCount();
	NoticeDto getNoticeOne(int num);
	void writeNotice(NoticeDto noticeDto);
	void deleteNotice(int articleNum);
}
