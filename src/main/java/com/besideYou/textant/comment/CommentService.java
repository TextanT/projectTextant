package com.besideYou.textant.comment;
import com.besideYou.textant.dto.CommentDto;
import java.util.List;
public interface CommentService {
	public void scroll(CommentDto commentDto,int commentTo,int commentTop);
	public List<CommentDto> scrollView(int page,int nextPage,int pageListCount,int pageCountBlock,int pageCut,int bookArticleNum,int commentNum,int commentDelete,int userNum);
	public List<CommentDto> commentTotalRead(int page, int commentTotalCount, int userNum,int bookArticleNum,int commentNum,int commentDelete);
	public List<Integer> commentCount(int page,int bookArticleNum);
	public List<Integer> commentTotalCount(int bookArticleNum);
	public List<Integer> commentGoodOrBad(int commentNum,int commentGoodOrBad,int userNum);
	public int commentDelete(int commentNum,int commentGroup);
	public int reportComment(int commentNum,int userNum);
}
