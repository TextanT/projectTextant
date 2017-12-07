package com.besideYou.textant.comment.service;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.besideYou.textant.comment.common.Page;
import com.besideYou.textant.comment.dao.CommentDao;
import com.besideYou.textant.comment.dto.CommentDto;
@Service
public class CommentServiceImpl implements CommentService{

	@Autowired
	CommentDao commentDao;
	@Resource(name="pageBlock")
	Integer pageBlock;
	
	@Resource(name="pageSize")
	Integer pageSize;
	
	@Autowired
	private Page page;
	
	@Override
	public HashMap<String, Integer> scroll(CommentDto commentDto,int commentTo,int commentTop) {
		HashMap<String, Integer> commentScrollReset;
		int scrollCommentTopCount;
		if(commentTo!=0) {
			commentScrollReset=new HashMap<>();
			commentDto.setDepth(1);
			commentDto.setCommentGroup(commentTop);
			commentDao.scroll(commentDto);
			commentDao.scrollComment(commentTop);
			scrollCommentTopCount=commentDao.scrollCommentTopCount(commentTop);
			commentScrollReset.put("scrollCommentTopCount", scrollCommentTopCount);
			commentScrollReset.put("ScrollResetDivision", 1);
		}else {
			commentScrollReset=new HashMap<>();
			commentDto.setDepth(0);
			commentDto.setCommentGroup(0);
			commentDao.scroll(commentDto);
			commentScrollReset.put("ScrollResetDivision", 0);
		}
		return commentScrollReset;
	}


	
	
	@Override
	public List<CommentDto> scrollView(int page,int nextPage,int pageListCount,int pageCountBlock,int pageCut,int bookArticleNum,int commentNum,int commentDelete,int userNum) {
		List<CommentDto> commentList = null;
		int pageStart;
		int pageStop;
		HashMap<String,Integer>  pageBlockMin = new HashMap<String,Integer>();
		pageBlockMin.put("bookArticleNum", bookArticleNum);
		pageBlockMin.put("page", page);
		pageBlockMin.put("pageBlock", pageBlock);	
		pageBlockMin.put("pageCountBlock",pageCountBlock);
		pageBlockMin.put("commentNum",commentNum);
		pageBlockMin.put("userNum",userNum);
		if(commentDelete==1) {
			commentDelete=1;
		}else if(commentDelete==0) {
			commentDelete=0;
		}
		pageBlockMin.put("commentDelete",commentDelete);
		if(nextPage<=pageCut){
			pageStart=0;
			if(nextPage==1){
				pageStart=1;
			}else {
				pageStart=((nextPage-1)*pageSize)+1;
			}
			pageStop=nextPage*pageSize;
			pageBlockMin.put("pageStart",pageStart);
			pageBlockMin.put("pageStop",pageStop);
			return commentList=commentDao.commentList(pageBlockMin);	
		}else {
			return commentList;
		}
	}


	@Override
	public HashMap<String, Integer> commentCount(int page,int bookArticleNum) {
		HashMap<String, Integer> pagePoint = new HashMap<>();
		HashMap<String,Integer>  pageBlockMin = new HashMap<>();
		int pageListCount;
		int pageCut;
		pageBlockMin.put("page", page);
		pageBlockMin.put("pageBlock", pageBlock);
		int pageCountBlock =0;
		if(pageBlock>=page) {
			pageCountBlock=1;
		}else {
			int pageCountCut=pageBlock;
			pageCountCut--;
			pageCountBlock=page-pageCountCut;
			
		}
		pageBlockMin.put("pageCountBlock",pageCountBlock);
		pageBlockMin.put("bookArticleNum",bookArticleNum);
		System.out.println(pageBlockMin);
		pageListCount=commentDao.commentListCount(pageBlockMin);
		pageCut=(int)Math.ceil((double)pageListCount/pageSize);
		pagePoint.put("pageListCount",pageListCount);
		pagePoint.put("pageCountBlock",pageCountBlock);
		pagePoint.put("page",page);
		pagePoint.put("pageCut",pageCut);
		pagePoint.put("bookArticleNum",bookArticleNum);
		pagePoint.put("pageSize",pageSize);
		System.out.println(pagePoint);
		return pagePoint;
	}


	@Override
	public HashMap<String, Integer> commentGoodOrBad(int commentNum, int commentGoodOrBad,int userNum) {
//		List<Integer> commentGoodOrBadList = new ArrayList<Integer>();
		HashMap<String, Integer> commentGoodOrBadList = new HashMap<>();
		int commentGoodCheck=1;
		int commentBadCheck=2;
		int commentGoodCheckOk=0;
		int commentBadCheckOk=0;
		int commentGoodOrBadAllCount=0;
		int commentGoodOrBadAllCheck=0;
		HashMap<String, Integer> commentGoodOrBadCheck=new HashMap<String, Integer>();
		commentGoodOrBadCheck.put("commentNum", commentNum);
		commentGoodOrBadCheck.put("userNum", userNum);
		
		commentGoodOrBadCheck.put("commentGoodOrBadCheck", commentGoodCheck);
		commentGoodCheckOk=commentDao.commentGoodOrBad(commentGoodOrBadCheck);
		
		commentGoodOrBadCheck.put("commentGoodOrBadCheck", commentBadCheck);
		commentBadCheckOk=commentDao.commentGoodOrBad(commentGoodOrBadCheck);
		
		if(commentGoodOrBad==1) {
			commentGoodOrBadCheck.put("commentGoodOrBadCheck", commentGoodCheck);
		}else {
			commentGoodOrBadCheck.put("commentGoodOrBadCheck", commentBadCheck);
		}
		
		if(commentGoodCheckOk==0&&commentBadCheckOk==0){
			commentDao.commentGoodOrBadWrite(commentGoodOrBadCheck);
			commentDao.commentGoodOrBadUpdate(commentGoodOrBadCheck);
			commentGoodOrBadAllCount=commentDao.commentGoodOrBadCount(commentGoodOrBadCheck);
		}else if(commentGoodCheckOk==0) {
			commentGoodOrBadCheck.put("commentGoodOrBadCheck", commentGoodCheck);
		}else {
			commentGoodOrBadCheck.put("commentGoodOrBadCheck", commentBadCheck);
		}
		
		commentGoodOrBadAllCheck=commentGoodOrBadCheck.get("commentGoodOrBadCheck");
		
		commentGoodOrBadList.put("commentGoodOrBadAllCount", commentGoodOrBadAllCount);
		commentGoodOrBadList.put("commentGoodOrBadAllCheck", commentGoodOrBadAllCheck);
		
		return commentGoodOrBadList;
	}


	@Override
	public int commentDelete(int commentNum, int commentGroup) {

		
		HashMap<String, Integer> commentDelete=new HashMap<String, Integer>();
		commentDelete.put("commentNum", commentNum);
		commentDelete.put("commentGroup", commentGroup);
		int commentDeleteCheck=0;
		int commentCountCheck=0;
		if(commentGroup==0) {
			commentDelete.put("commentDeleteCheck", commentDeleteCheck); 
			commentDao.commentDelete(commentDelete);
		}else {
			commentDeleteCheck=1;
			commentDelete.put("commentDeleteCheck", commentDeleteCheck);
			commentDao.commentDelete(commentDelete); 
			commentDao.commentCountUpdate(commentDelete); 
			commentCountCheck=commentDao.commentCountCheck(commentDelete);
			
		}
		return commentCountCheck;
	}


	@Override
	public int reportComment(int commentNum, int userNum) {
		HashMap<String, Integer> reportCommentCheck=new HashMap<String, Integer>();
		reportCommentCheck.put("commentNum", commentNum);
		reportCommentCheck.put("userNum", userNum);
		String reportCommentCheckOk=null;
		int reportCommentCheckAllOk=0;
		reportCommentCheckOk=commentDao.reportCommentCheck(reportCommentCheck);
		if(reportCommentCheckOk==null) {
			reportCommentCheckAllOk=1;
			commentDao.reportCommentWrite(reportCommentCheck);
		}
		return reportCommentCheckAllOk;
	}


	@Override
	public HashMap<String, Integer> commentTotalCount(int bookArticleNum) {
		HashMap<String, Integer> commentTotalCountList=new HashMap<>();
		int totalCount=0;
		int bookTotalPage=0;
			bookTotalPage=commentDao.getbookTotalPage(bookArticleNum);
			totalCount=commentDao.getCommentTotalCount(bookArticleNum);
			commentTotalCountList.put("totalCount",totalCount);
			commentTotalCountList.put("pageSize",pageSize);
			commentTotalCountList.put("bookTotalPage",bookTotalPage);
		return commentTotalCountList;
	}


	@Override
	public List<CommentDto> commentTotalRead(int page, int commentTotalCount, int userNum,int bookArticleNum,int commentNum,int commentDelete,int commentSearchCheak, int commentSearchList,String commentSearch) {

		int totalCount=0;
		int commentSearchListCheak=0;
		String pageCode;
		HashMap<String, String> pagingMap = null;
		ArrayList<CommentDto> commentList= null;
		HashMap<String, String> CommentArticleList=new HashMap<>();
		if(commentDelete==1) {
			commentDelete=1;
		}else if(commentDelete==0) {
			commentDelete=0;
		}
			CommentArticleList.put("bookArticleNum",String.valueOf(bookArticleNum));
			CommentArticleList.put("commentSearch",commentSearch);
			CommentArticleList.put("userNum",String.valueOf(userNum));
			CommentArticleList.put("commentDelete",String.valueOf(commentDelete));

	   		if(commentSearchCheak==0) {
	   			pagingMap=this.page.paging(page,commentTotalCount,pageSize, pageBlock);
				CommentArticleList.put("startRow",pagingMap.get("startRow"));
				CommentArticleList.put("endRow",pagingMap.get("endRow"));
				CommentArticleList.put("commentSearchListCheak",String.valueOf(commentSearchListCheak));
				if(commentTotalCount!=0) {
				commentList=(ArrayList<CommentDto>)commentDao.getCommentArticleList(CommentArticleList);
				if(!commentList.isEmpty()) {
				commentList.get(0).setPageCode(pagingMap.get("pageCode"));
				}
				}else {
					commentList=null;
				}
	   		}else{
	   			if(commentSearchList==2){
	   				commentSearchListCheak=2;
	   				}
	   			else {
	   				commentSearchListCheak=1;
	   				}
				CommentArticleList.put("commentSearchListCheak",String.valueOf(commentSearchListCheak));
				totalCount=commentDao.getCommentSearchCount(CommentArticleList);
				pagingMap=this.page.paging(page,totalCount,pageSize, pageBlock);
				CommentArticleList.put("startRow",pagingMap.get("startRow"));
				CommentArticleList.put("endRow",pagingMap.get("endRow"));
				if(totalCount!=0) {
				commentList=(ArrayList<CommentDto>)commentDao.getCommentArticleList(CommentArticleList);
				if(!commentList.isEmpty()) {
				pageCode=pagingMap.get("pageCode");
				pageCode=pageCode.replaceFirst("getCommentRead", "getCommentSearchRead");
				commentList.get(0).setPageCode(pageCode);
				}
				}else {
					commentList=null;
				}
	   		}
			
	   	
		return commentList;
	}
}
