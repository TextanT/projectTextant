package com.besideYou.textant.comment.common;

import java.util.HashMap;

import javax.inject.Named;

import org.springframework.stereotype.Component;

//@Named
@Component  
public class MainPage {		
	private int startRow, endRow;
	private StringBuffer sb;	
	
	public synchronized HashMap<String,String> paging(int pageNum, int totalCount, int pageSize, int pageBlock){
		HashMap<String, String> pagingMap= new HashMap<>();
		int totalPage = (int) Math.ceil((double)totalCount/pageSize);
		startRow = (pageNum - 1) * pageSize+1;
		endRow = pageNum * pageSize;		
		pagingMap.put("startRow", String.valueOf(startRow));
		pagingMap.put("endRow", String.valueOf(endRow));
		
		int startPage = (int)((pageNum-1)/pageBlock)*pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
				
		if(endPage > totalPage) {
			endPage = totalPage;
		}			

		sb = new StringBuffer();
		if(startPage < pageBlock) {
			sb.append("<div style='width:100%; text-align:center; bottom:20px;position: absolute;'><img src='/textant/resources/icon_img/best_left.jpg' width='30' height='12'>");			
		} else {
			sb.append("<img src='/textant/resources/icon_img/best_left.jpg' width='30' height='12'");
			sb.append(" onclick='genresub(");
			sb.append(startPage - pageBlock);
			sb.append(")' style='cursor:pointer;'> ");
		}
		
		sb.append("&nbsp;&nbsp;|");
		for(int i = startPage; i <= endPage; i++) {		
			if(i == pageNum) {
				sb.append("&nbsp;&nbsp;<b style=''><font color='gray'>");
				sb.append(i);
				sb.append("</font></b>");
			} else {
				sb.append("&nbsp;&nbsp;<a style='cursor: pointer; color:black;' onclick='getMainBookList(");
				sb.append(i);
				sb.append(")'>");
				sb.append(i);
				sb.append("</a>");
			}
		}
		
		sb.append("&nbsp;&nbsp;|");		
		if(endPage < totalPage) {
			sb.append("<img src='/textant/resources/icon_img/best_right.jpg' width='30' height='12'");
			sb.append(" onclick='getMainBookList(");
			sb.append(startPage + pageBlock);
			sb.append(")' style='cursor:pointer'> ");						
		} else {
			sb.append("<img src='/textant/resources/icon_img/best_right.jpg' width='30' height='12'></div>");			
		}	
		
		pagingMap.put("pageCode", sb.toString());
		return pagingMap;
	}	

}
