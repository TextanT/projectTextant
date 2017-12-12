package com.besideYou.textant.manager.page;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
//@Named
@Component
public class ManagerPage {

	
	private int startRow, endRow;
	private StringBuffer sb;
	
	public synchronized HashMap<String, String> paging(int pageNum, int totalCount, int pageSize, int pageBlock, HttpServletRequest req){
		HashMap<String, String> pagingValue = new HashMap<String, String>();
		String reqURI = req.getRequestURI().substring(req.getRequestURI().lastIndexOf("/")+1);
		
		int totalPage = (int) Math.ceil((double)totalCount/pageSize);
		startRow = (pageNum - 1) * pageSize+1;
		endRow = pageNum * pageSize;		
		
		pagingValue.put("startRow", String.valueOf(startRow));
		pagingValue.put("endRow", String.valueOf(endRow));
		
		int startPage = (int)((pageNum-1)/pageBlock)*pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
				
		if(endPage > totalPage) {
			endPage = totalPage;
		}			

		sb = new StringBuffer();
		if(startPage < pageBlock) {
			sb.append("<span class=\"glyphicon glyphicon-chevron-left\" aria-hidden=\"true\"></span>");			
		} else {
			sb.append("<span class=\"glyphicon glyphicon-chevron-left\" aria-hidden=\"true\"");
			sb.append(" onclick='location.href=\"" + reqURI + "?pageNum=");
			sb.append(startPage - pageBlock);
			sb.append("\"'style='cursor:pointer' ></span> ");
		}
		
		sb.append("&nbsp;&nbsp;|");
		for(int i = startPage; i <= endPage; i++) {		
			if(i == pageNum) {
				sb.append("&nbsp;&nbsp;<b><font color='#91B7EF'>");
				sb.append(i);
				sb.append("</font></b>");
			} else {
				sb.append("&nbsp;&nbsp;<a href='" + reqURI);
				sb.append("?pageNum=");
				sb.append(i);
				sb.append("'>");
				sb.append(i);
				sb.append("</a>");
			}
		}
		
		sb.append("&nbsp;&nbsp;|");		
		if(endPage < totalPage) {
			sb.append("&nbsp;&nbsp;<span class=\"glyphicon glyphicon-chevron-right\" aria-hidden=\"true\"");
			sb.append(" onclick='location.href=\"" + reqURI + "?pageNum=");
			sb.append(startPage + pageBlock);
			sb.append("\"' style='cursor:pointer'></span> ");
		} else {
			sb.append("&nbsp;&nbsp;<span class=\"glyphicon glyphicon-chevron-right\" aria-hidden=\"true\"></span>");			
		}
		
		pagingValue.put("pageCode", sb.toString());
		return pagingValue;
	}
	public synchronized HashMap<String, String> paging(int pageNum, int totalCount, int pageSize, int pageBlock, HttpServletRequest req, String searchType, String commentContents){
		HashMap<String, String> pagingValue = new HashMap<String, String>();
		String reqURI = req.getRequestURI().substring(req.getRequestURI().lastIndexOf("/")+1);
		
		int totalPage = (int) Math.ceil((double)totalCount/pageSize);
		startRow = (pageNum - 1) * pageSize+1;
		endRow = pageNum * pageSize;		
		
		pagingValue.put("startRow", String.valueOf(startRow));
		pagingValue.put("endRow", String.valueOf(endRow));
		
		int startPage = (int)((pageNum-1)/pageBlock)*pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
				
		if(endPage > totalPage) {
			endPage = totalPage;
		}			

		sb = new StringBuffer();
		if(startPage < pageBlock) {
			sb.append("<span class=\"glyphicon glyphicon-chevron-left\" aria-hidden=\"true\"></span>");			
		} else {
			sb.append("<span class=\"glyphicon glyphicon-chevron-left\" aria-hidden=\"true\"");
			sb.append(" onclick='location.href=\"" + reqURI + "?pageNum=");
			sb.append(startPage - pageBlock);
			sb.append("&searchType=" +searchType + "&commentContents=" + commentContents);
			sb.append("\"'style='cursor:pointer' ></span> ");
		}
		
		sb.append("&nbsp;&nbsp;|");
		for(int i = startPage; i <= endPage; i++) {		
			if(i == pageNum) {
				sb.append("&nbsp;&nbsp;<b><font color='#91B7EF'>");
				sb.append(i);
				sb.append("</font></b>");
			} else {
				sb.append("&nbsp;&nbsp;<a href='" + reqURI);
				sb.append("?pageNum=");
				sb.append(i);
				sb.append("&searchType=" +searchType + "&commentContents=" + commentContents);
				sb.append("'>");
				sb.append(i);
				sb.append("</a>");
			}
		}
		
		sb.append("&nbsp;&nbsp;|");		
		if(endPage < totalPage) {
			sb.append("&nbsp;&nbsp;<span class=\"glyphicon glyphicon-chevron-right\" aria-hidden=\"true\"");
			sb.append(" onclick='location.href=\"" + reqURI + "?pageNum=");
			sb.append(startPage + pageBlock);
			sb.append("&searchType=" +searchType + "&commentContents=" + commentContents);
			sb.append("\"' style='cursor:pointer'></span> ");
		} else {
			sb.append("&nbsp;&nbsp;<span class=\"glyphicon glyphicon-chevron-right\" aria-hidden=\"true\"></span>");			
		}
		
		pagingValue.put("pageCode", sb.toString());
		return pagingValue;
	}
	public int getStartRow() {
		return startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public StringBuffer getSb() {
		return sb;
	}

}
