package com.besideYou.textant.manager.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.besideYou.textant.comment.dto.CommentDto;
import com.besideYou.textant.common.dto.NoticeDto;
import com.besideYou.textant.common.dto.RecommendedBookDto;
import com.besideYou.textant.common.dto.ReportBookDto;
import com.besideYou.textant.common.dto.ReportCommentDto;
import com.besideYou.textant.main.dto.BookInfoDto;
import com.besideYou.textant.manager.dao.ManagerDao;
import com.besideYou.textant.manager.dto.CountDto;
import com.besideYou.textant.manager.dto.ManagingBookDto;
import com.besideYou.textant.manager.page.ManagerPage;

@Service
public class ManagerServiceImplement implements ManagerService {

	@Autowired
	ManagerDao managerDao;

	@Autowired
	ManagerPage managerPage;

	@Resource(name = "saveDir")
	String destinationDir;

	int pageBlock = 5;
	int pageSize = 10;

	@Override
	public void getUserName(int userNum, Model model) {
		model.addAttribute("userId", managerDao.getUserName(userNum));
		System.out.println("userId : " + managerDao.getUserName(userNum));
	}

	@Override
	public void managerMain(Model model) {
		HashMap<String, String> oneTen;

		
		
		oneTen = new HashMap<String, String>();
		oneTen.put("startPage", "1");
		oneTen.put("endPage", "5");

		model.addAttribute("getFirstRecommendedBookList", managerDao.getRecommendedBookList(oneTen));
		model.addAttribute("getFirstReportBookList", managerDao.getReportBookList(oneTen));
		model.addAttribute("getFirstReportCommentList", managerDao.getReportCommentList(oneTen));
		model.addAttribute("getFirstBadCommentList", managerDao.getBadCommentList(oneTen));
		model.addAttribute("getFirstNoticeList", managerDao.getNoticeList(oneTen));

		model.addAttribute("totalRecommendBook", managerDao.getTotalRecommendBookCount());
		model.addAttribute("totalReportBook", managerDao.getTotalReportBookCount());
		model.addAttribute("totalReportComment", managerDao.getTotalReportCommentCount());
		model.addAttribute("totalBadComment", managerDao.getTotalBadCommentsCount());
		
		
		List<CountDto> weekVisiter = managerDao.weekVisiter();
		System.out.println(weekVisiter);
		model.addAttribute("totalVisitCount",weekVisiter);
	}

	@Override
	public void managerRecommendBook(Model model, int pageNum, HttpServletRequest req) {
		int totalCount = 0;
		// pageNum = 1;
		ArrayList<RecommendedBookDto> recommendBookList = null;
		HashMap<String, String> pagingMap = null;
		HashMap<String, String> paramMap = null;
		ArrayList<ManagingBookDto> managingList = null;
		ManagingBookDto managingDto = null;
		try {
			totalCount = managerDao.getTotalRecommendBookCount();

			pagingMap = managerPage.paging(pageNum, totalCount, pageSize, pageBlock, req);

			int startRow = managerPage.getStartRow();
			int endRow = managerPage.getEndRow();
			paramMap = new HashMap<>();
			paramMap.put("startPage", String.valueOf(startRow));
			paramMap.put("endPage", String.valueOf(endRow));

			recommendBookList = (ArrayList<RecommendedBookDto>) managerDao.getRecommendedBookList(paramMap);
			System.out.println(recommendBookList);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}

		managingList = new ArrayList<>();

		for (RecommendedBookDto ml : recommendBookList) {
			managingDto = new ManagingBookDto();
			managingDto.setNum(ml.getRecommendNum());
			managingDto.setBookName(managerDao.getBookName(ml.getBookArticleNum()));
			managingDto.setUserName(managerDao.getUserName(ml.getUserNum()));
			managingDto.setComment(ml.getRecommendComment());
			managingDto.setWriteDate(ml.getWriteDate());
			managingList.add(managingDto);
		}

		model.addAttribute("totalCount", totalCount);
		System.out.println(pagingMap.get("pageCode"));
		model.addAttribute("managingList", managingList);
		model.addAttribute("pageCode", pagingMap.get("pageCode"));

		// model.addAttribute("managerRecommendBookList",
		// managerDao.getRecommendedBookList(pagingMap));
	}

	@Override
	public void managerReportBook(Model model, int pageNum, HttpServletRequest req) {
		int totalCount = 0;
		// pageNum = 1;
		ArrayList<ReportBookDto> reportBookList = null;
		HashMap<String, String> pagingMap = null;
		HashMap<String, String> paramMap = null;
		ArrayList<ManagingBookDto> managingList = null;
		ManagingBookDto managingDto = null;
		try {
			totalCount = managerDao.getTotalReportBookCount();

			pagingMap = managerPage.paging(pageNum, totalCount, pageSize, pageBlock, req);

			int startRow = managerPage.getStartRow();
			int endRow = managerPage.getEndRow();
			paramMap = new HashMap<>();
			paramMap.put("startPage", String.valueOf(startRow));
			paramMap.put("endPage", String.valueOf(endRow));

			reportBookList = (ArrayList<ReportBookDto>) managerDao.getReportBookList(paramMap);
			System.out.println(reportBookList);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}

		managingList = new ArrayList<>();

		for (ReportBookDto ml : reportBookList) {
			managingDto = new ManagingBookDto();
			managingDto.setNum(ml.getReportBookNum());
			managingDto.setBookName(managerDao.getBookName(ml.getBookArticleNum()));
			managingDto.setUserName(managerDao.getUserName(ml.getUserNum()));
			managingDto.setComment(ml.getRepoBookCont());
			managingDto.setWriteDate(ml.getWriteDate());
			System.out.println(ml);
			managingList.add(managingDto);
		}

		model.addAttribute("totalCount", totalCount);
		System.out.println(pagingMap.get("pageCode"));
		model.addAttribute("managingList", managingList);
		model.addAttribute("pageCode", pagingMap.get("pageCode"));
	}

	@Override
	public void managingRecommendContent(int num, Model model) {
		RecommendedBookDto recommendedBookDto;
		ManagingBookDto managingDto;

		recommendedBookDto = managerDao.getRecommendedBookOne(num);
		managingDto = new ManagingBookDto();
		managingDto.setNum(recommendedBookDto.getRecommendNum());
		managingDto.setBookName(managerDao.getBookName(recommendedBookDto.getBookArticleNum()));
		managingDto.setBookNum(recommendedBookDto.getBookArticleNum());
		managingDto.setUserName(managerDao.getUserName(recommendedBookDto.getUserNum()));
		managingDto.setComment(recommendedBookDto.getRecommendComment());
		managingDto.setWriteDate(recommendedBookDto.getWriteDate());
		model.addAttribute("managingList", managingDto);
	}

	@Override
	public void recommendWrite(RecommendedBookDto recommendedBookDto, HttpSession session) {
		System.out.println(recommendedBookDto);
		managerDao.writeRecommendbook(recommendedBookDto);
	}

	@Override
	public void deleteRecommendBook(int recommendNum) {
		managerDao.deleteRecommendBook(recommendNum);
	}

	@Override
	public void updateRecommendBook(RecommendedBookDto recommendedBookDto, HttpSession session) {
		managerDao.updateRecommendBook(recommendedBookDto);
	}

	@Override
	public void managingBookContent(int num, Model model) {
		ReportBookDto reportBookDto;
		ManagingBookDto managingDto;

		reportBookDto = managerDao.getManagingBookOne(num);
		managingDto = new ManagingBookDto();
		managingDto.setNum(reportBookDto.getReportBookNum());
		managingDto.setBookName(managerDao.getBookName(reportBookDto.getBookArticleNum()));
		managingDto.setUserName(managerDao.getUserName(reportBookDto.getUserNum()));
		managingDto.setComment(reportBookDto.getRepoBookCont());
		managingDto.setWriteDate(reportBookDto.getWriteDate());
		model.addAttribute("managingList", managingDto);
	}

	@Override
	public void deleteReportBook(int reportBookNum) {
		managerDao.deleteReportBook(reportBookNum);
	}

	@Override
	public void managerNotice(Model model, int pageNum, HttpServletRequest req) {
		int totalCount = 0;
		ArrayList<NoticeDto> noticeList = null;
		HashMap<String, String> pagingMap = null;
		HashMap<String, String> paramMap = null;
		ArrayList<ManagingBookDto> managingList = null;
		ManagingBookDto managingDto = null;
		try {
			totalCount = managerDao.getTotalNoticeCount();

			pagingMap = managerPage.paging(pageNum, totalCount, pageSize, pageBlock, req);

			int startRow = managerPage.getStartRow();
			int endRow = managerPage.getEndRow();
			paramMap = new HashMap<>();
			paramMap.put("startPage", String.valueOf(startRow));
			paramMap.put("endPage", String.valueOf(endRow));

			noticeList = (ArrayList<NoticeDto>) managerDao.getNoticeList(paramMap);
			System.out.println(noticeList);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}

		managingList = new ArrayList<>();
		for (NoticeDto ml : noticeList) {
			managingDto = new ManagingBookDto();
			managingDto.setNum(ml.getArticleNum());
			managingDto.setBookName(ml.getTitle());
			managingDto.setUserName(managerDao.getUserName(ml.getUserNum()));
			managingDto.setHit(ml.getHit());
			managingDto.setComment(ml.getContents());
			managingDto.setWriteDate(ml.getWriteDate());
			managingDto.setType(ml.getType());
			managingList.add(managingDto);
		}

		model.addAttribute("totalCount", totalCount);
		model.addAttribute("managingList", managingList);
		model.addAttribute("pageCode", pagingMap.get("pageCode"));

	}

	@Override
	public void noticeContent(int num, Model model) {
		NoticeDto noticeDto;
		ManagingBookDto managingDto;

		noticeDto = managerDao.getNoticeOne(num);

		managingDto = new ManagingBookDto();
		managingDto.setNum(noticeDto.getArticleNum());
		managingDto.setBookName(noticeDto.getTitle());
		managingDto.setUserName(managerDao.getUserName(noticeDto.getUserNum()));
		managingDto.setHit(noticeDto.getHit());
		managingDto.setComment(noticeDto.getContents());
		managingDto.setWriteDate(noticeDto.getWriteDate());
		managingDto.setType(noticeDto.getType());

		model.addAttribute("managingList", managingDto);
	}

	@Override
	public void noticeWrite(NoticeDto noticeDto, HttpSession session) {
		managerDao.writeNotice(noticeDto);
	}

	@Override
	public void deleteNotice(int articleNum) {
		managerDao.deleteNotice(articleNum);
	}

	@Override
	public void updateNotice(NoticeDto noticeDto, HttpSession session) {
		managerDao.updateNotice(noticeDto);
	}

	@Override
	public void managerReportComment(Model model, int pageNum, HttpServletRequest req) {
		int totalCount = 0;
		ArrayList<ReportCommentDto> reportCommentList = null;
		HashMap<String, String> pagingMap = null;
		HashMap<String, String> paramMap = null;
		ArrayList<ManagingBookDto> managingList = null;
		ManagingBookDto managingDto = null;
		try {
			totalCount = managerDao.getTotalReportCommentCount();

			pagingMap = managerPage.paging(pageNum, totalCount, pageSize, pageBlock, req);

			int startRow = managerPage.getStartRow();
			int endRow = managerPage.getEndRow();
			paramMap = new HashMap<>();
			paramMap.put("startPage", String.valueOf(startRow));
			paramMap.put("endPage", String.valueOf(endRow));

			reportCommentList = (ArrayList<ReportCommentDto>) managerDao.getReportCommentList(paramMap);
			System.out.println(reportCommentList);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}

		managingList = new ArrayList<>();

		for (ReportCommentDto ml : reportCommentList) {
			managingDto = new ManagingBookDto();
			managingDto.setNum(ml.getReportCommentNum());
			managingDto.setUserName(managerDao.getUserName(ml.getUserNum()));
			managingDto.setComment(ml.getRepoCommCont());
			managingDto.setWriteDate(ml.getWriteDate());
			System.out.println(ml);
			managingList.add(managingDto);
		}

		model.addAttribute("totalCount", totalCount);
		System.out.println(pagingMap.get("pageCode"));
		model.addAttribute("managingList", managingList);
		model.addAttribute("pageCode", pagingMap.get("pageCode"));
	}

	@Override
	public void reportCommentContent(int num, Model model) {
		ReportCommentDto reportCommentDto;
		ManagingBookDto managingDto;

		reportCommentDto = managerDao.getReportCommentOne(num);

		managingDto = new ManagingBookDto();
		managingDto.setNum(reportCommentDto.getReportCommentNum());
		managingDto.setUserName(managerDao.getUserName(reportCommentDto.getUserNum()));
		managingDto.setReportComment(reportCommentDto.getRepoCommCont());
		managingDto.setWriteDate(reportCommentDto.getWriteDate());
		managingDto.setComment(managerDao.getComments(reportCommentDto.getCommentNum()));

		model.addAttribute("managingList", managingDto);
	}

	@Override
	public void deleteReportComment(int reportCommentNum) {
		managerDao.deleteReportComment(reportCommentNum);
	}

	@Override
	public void managerComment(Model model, int pageNum, HttpServletRequest req) {
		int totalCount = 0;
		// pageNum = 1;
		ArrayList<CommentDto> commentsList = null;
		HashMap<String, String> pagingMap = null;
		HashMap<String, String> paramMap = null;

		try {
			totalCount = managerDao.getTotalBadCommentsCount();

			pagingMap = managerPage.paging(pageNum, totalCount, pageSize, pageBlock, req);

			int startRow = managerPage.getStartRow();
			int endRow = managerPage.getEndRow();
			paramMap = new HashMap<>();
			paramMap.put("startPage", String.valueOf(startRow));
			paramMap.put("endPage", String.valueOf(endRow));

			commentsList = (ArrayList<CommentDto>) managerDao.getBadCommentList(paramMap);
			System.out.println(commentsList);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}

		model.addAttribute("totalCount", totalCount);
		model.addAttribute("commentsList", commentsList);
		model.addAttribute("pageCode", pagingMap.get("pageCode"));
	}

	@Override
	public void searchComment(Model model, int pageNum, HttpServletRequest req, String searchType,
			String commentContents) {
		int totalCount = 0;
		ArrayList<CommentDto> commentsList = null;
		HashMap<String, String> pagingMap = null;
		HashMap<String, String> paramMap = null;
		HashMap<String, String> totalMap = null;

		try {
			totalMap = new HashMap<>();
			totalMap.put("searchType", searchType);
			totalMap.put("commentContents", commentContents);
			totalCount = managerDao.getTotalCommentsCount(totalMap);

			pagingMap = managerPage.paging(pageNum, totalCount, pageSize, pageBlock, req, searchType, commentContents);

			int startRow = managerPage.getStartRow();
			int endRow = managerPage.getEndRow();
			paramMap = new HashMap<>();
			paramMap.put("startPage", String.valueOf(startRow));
			paramMap.put("endPage", String.valueOf(endRow));
			paramMap.put("searchType", searchType);
			paramMap.put("commentContents", commentContents);

			commentsList = (ArrayList<CommentDto>) managerDao.searchComment(paramMap);
			System.out.println(commentsList);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("commentsList", commentsList);
		model.addAttribute("pageCode", pagingMap.get("pageCode"));

	}

	@Override
	public void commentContent(int num, Model model, HttpServletRequest req) {
		CommentDto commentDto;
		ManagingBookDto managingDto;

		commentDto = managerDao.getCommentOne(num);

		managingDto = new ManagingBookDto();
		managingDto.setUserName(managerDao.getUserName(commentDto.getUserNum()));
		managingDto.setBookName(managerDao.getBookName(commentDto.getBookArticleNum()));
		model.addAttribute("referer", req.getHeader("referer").replaceAll("&", "%26"));
		model.addAttribute("managingList", managingDto);
		model.addAttribute("commentsList", commentDto);
	}

	@Override
	public void deleteComment(int commentNum) {
		managerDao.deleteComment(commentNum);
	}

	@Override
	public void managerAllBook(Model model, int pageNum, HttpServletRequest req) {
		int totalCount = 0;
		ArrayList<BookInfoDto> bookInfoList = null;
		HashMap<String, String> pagingMap = null;
		HashMap<String, String> paramMap = null;

		try {
			totalCount = managerDao.getAllBookCount();

			pagingMap = managerPage.paging(pageNum, totalCount, pageSize, pageBlock, req);

			int startRow = managerPage.getStartRow();
			int endRow = managerPage.getEndRow();
			paramMap = new HashMap<>();
			paramMap.put("startPage", String.valueOf(startRow));
			paramMap.put("endPage", String.valueOf(endRow));

			bookInfoList = (ArrayList<BookInfoDto>) managerDao.getAllBooks(paramMap);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}

		model.addAttribute("totalCount", totalCount);
		model.addAttribute("bookInfoList", bookInfoList);
		model.addAttribute("pageCode", pagingMap.get("pageCode"));
	}

	@Override
	public void allBookContent(int num, Model model, HttpServletRequest req) {
		BookInfoDto bookInfoDto;
		ManagingBookDto managingDto;

		bookInfoDto = managerDao.getBookOne(num);

		managingDto = new ManagingBookDto();
		managingDto.setUserName(managerDao.getUserName(bookInfoDto.getUserNum()));
		managingDto.setBookName(managerDao.getBookName(bookInfoDto.getBookArticleNum()));
		model.addAttribute("referer", req.getHeader("referer").replaceAll("&", "%26"));
		model.addAttribute("managingList", managingDto);
		model.addAttribute("bookInfoList", bookInfoDto);

	}

	@Override
	public void deleteBookInfo(int bookArticleNum) {
		BookInfoDto bookInfoDto;
		bookInfoDto = managerDao.getBookOne(bookArticleNum);
		managerDao.deleteBookInfo(bookArticleNum);

		File file = new File(destinationDir + bookInfoDto.getFileLocation());
		allFileDelete(file);
	}

	@Override
	public void searchAllBook(Model model, int pageNum, HttpServletRequest req, String searchType,
			String commentContents) {
		
		int totalCount = 0;
		// pageNum = 1;
		ArrayList<BookInfoDto> bookInfoList = null;
		HashMap<String, String> pagingMap = null;
		HashMap<String, String> paramMap = null;
		HashMap<String, String> totalMap = null; 
		
		try {
			totalMap = new HashMap<>();
			totalMap.put("searchType", searchType);
			totalMap.put("commentContents", commentContents);
			totalCount = managerDao.getTotalBookCount(totalMap);
			
			pagingMap = managerPage.paging(pageNum, totalCount, pageSize, pageBlock, req, searchType, commentContents);
			

			int startRow = managerPage.getStartRow();
			int endRow = managerPage.getEndRow();
			paramMap = new HashMap<>();
			
			paramMap.put("startPage", String.valueOf(startRow));
			paramMap.put("endPage", String.valueOf(endRow));
			paramMap.put("searchType", searchType);
			paramMap.put("commentContents", commentContents);
			
			bookInfoList = (ArrayList<BookInfoDto>) managerDao.searchAllBook(paramMap);
			System.out.println(bookInfoList);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}

		model.addAttribute("totalCount", totalCount);
		model.addAttribute("bookInfoList", bookInfoList);
		model.addAttribute("pageCode", pagingMap.get("pageCode"));
	
	}

	public void allFileDelete(File file) {
		if (file.isDirectory()) {
			if (file.listFiles().length != 0) {
				File[] fileList = file.listFiles();
				for (int i = 0; i < fileList.length; i++) {
					allFileDelete(fileList[i]);
					file.delete();
				}
			} else {
				file.delete();
			}
		} else {
			file.delete();
		}
	}

}
