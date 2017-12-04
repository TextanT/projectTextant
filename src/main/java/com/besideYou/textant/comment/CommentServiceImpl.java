package com.besideYou.textant.comment;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.besideYou.textant.dao.CommentDao;
import com.besideYou.textant.dto.CommentDto;
@Service
public class CommentServiceImpl implements CommentService{

	@Autowired
	CommentDao commentDao;
	@Resource(name="pageBlock")
	Integer pageBlock;
	
	@Resource(name="pageSize")
	Integer pageSize;
	
	@Autowired
	private com.besideYou.textant.common.Page page;
	
	@Override
	public void scroll(CommentDto commentDto,int commentTo,int commentTop) {
		if(commentTo!=0) {
			commentDto.setDepth(1);
			commentDto.setCommentGroup(commentTop);
			commentDao.scroll(commentDto);
			commentDao.scrollComment(commentTop);
		}else {
			commentDto.setDepth(0);
			commentDto.setCommentGroup(0);
			commentDao.scroll(commentDto);
		}
		
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
	public List<Integer> commentCount(int page,int bookArticleNum) {
		List<Integer> pagePoint = new ArrayList<Integer>();
		HashMap<String,Integer>  pageBlockMin = new HashMap<String,Integer>();
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
		pageListCount=commentDao.commentListCount(pageBlockMin);
		pageCut=(int)Math.ceil((double)pageListCount/pageSize);
		pagePoint.add(pageListCount);
		pagePoint.add(pageCountBlock);
		pagePoint.add(page);
		pagePoint.add(pageCut);
		pagePoint.add(bookArticleNum);
		pagePoint.add(pageSize);
		return pagePoint;
	}


	@Override
	public List<Integer> commentGoodOrBad(int commentNum, int commentGoodOrBad,int userNum) {
		List<Integer> commentGoodOrBadList = new ArrayList<Integer>();
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
		
		commentGoodOrBadList.add(0, commentGoodOrBadAllCount);
		commentGoodOrBadList.add(1, commentGoodOrBadAllCheck);
		
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
	public List<Integer> commentTotalCount(int bookArticleNum) {
		List<Integer> commentTotalCountList = new ArrayList<>();
		int totalCount=0;
		int bookTotalPage=0;
			bookTotalPage=commentDao.getbookTotalPage(bookArticleNum);
			totalCount=commentDao.getCommentTotalCount(bookArticleNum);
			commentTotalCountList.add(totalCount);
			commentTotalCountList.add(pageSize);
			commentTotalCountList.add(bookTotalPage);
		return commentTotalCountList;
	}


	@Override
	public List<CommentDto> commentTotalRead(int page, int commentTotalCount, int userNum,int bookArticleNum,int commentNum,int commentDelete) {
		int totalCount=0;
		HashMap<String, String> pagingMap = null;
		ArrayList<CommentDto> commentList= null;
		if(commentDelete==1) {
			commentDelete=1;
		}else if(commentDelete==0) {
			commentDelete=0;
		}
	   	try {			
			pagingMap=this.page.paging(page,commentTotalCount,pageSize, pageBlock);	
			HashMap<String, String> CommentArticleList= new HashMap<>();
			CommentArticleList.put("userNum",String.valueOf(userNum));
			CommentArticleList.put("bookArticleNum",String.valueOf(bookArticleNum));
			CommentArticleList.put("startRow",pagingMap.get("startRow"));
			CommentArticleList.put("endRow",pagingMap.get("endRow"));
			CommentArticleList.put("commentDelete",String.valueOf(commentDelete));
			commentList=(ArrayList<CommentDto>)commentDao.getCommentArticleList(CommentArticleList);
	   	}catch (Exception e) {
			e.printStackTrace();
		}
	   	commentList.get(0).setPageCode(pagingMap.get("pageCode"));
		return commentList;
	}
}
