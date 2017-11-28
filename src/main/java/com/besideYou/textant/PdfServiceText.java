package com.besideYou.textant;

import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.besideYou.textant.Dto.CommentDto;

public interface PdfServiceText {
	public String txtWrite(MultipartFile BookFile,MultipartFile bookImg,int line,int getNumOfOneLine,int getLineOfOnePage);
	public String pdfWrite(MultipartFile mFile,MultipartFile bookImg);
	public String check(PdfFileDto fileDto)throws Exception;
	public void scroll(CommentDto commentDto,int commentTo,int commentTop);
	public List<CommentDto> scrollView(int page,int nextPage,int pageListCount,int pageCountBlock,int pageCut,int bookArticleNum,int commentNum);
	public List<Integer> commentCount(int page,int bookArticleNum);
}
