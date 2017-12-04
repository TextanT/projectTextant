package com.besideYou.textant.converter;

import java.util.HashMap;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.besideYou.textant.dto.BookInfoDto;

public interface PdfServiceText {
	public String txtWrite(MultipartFile BookFile,MultipartFile bookImg,int line,int getNumOfOneLine,int getLineOfOnePage);
	public String pdfWrite(MultipartFile mFile,MultipartFile bookImg);
	public String check(BookInfoDto bookInfoDto)throws Exception;
	/*public void scroll(CommentDto commentDto,int commentTo,int commentTop);
	public List<CommentDto> scrollView(int page,int nextPage,int pageListCount,int pageCountBlock,int pageCut,int bookArticleNum,int commentNum,int commentDelete,int userNum);
	public List<Integer> commentCount(int page,int bookArticleNum);
	public List<Integer> commentGoodOrBad(int commentNum,int commentGoodOrBad,int userNum);
	public int commentDelete(int commentNum,int commentGroup);
	HashMap<String,String> getProgress(Model model);
	*/
}
