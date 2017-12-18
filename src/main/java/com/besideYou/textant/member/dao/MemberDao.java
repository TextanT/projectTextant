package com.besideYou.textant.member.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;
import com.besideYou.textant.member.dto.FileDto;
import com.besideYou.textant.member.dto.MemberDto;

@Repository
public interface MemberDao {

	
	public MemberDto viewMyInfo(String userNum);

	public MemberDto modifyGetMyInfo(String userNum);

	public int modifyMyInfo(MemberDto memberDao);

	public int getNextUserNum();
	
	public void insertFile(FileDto fileDto);
	
	public List<String> getFiles(String articleNum);
	
	public void dbDelFileName(ArrayList<String> delFileList);

	public void delete(String userNum);

	public MemberDto getMie(String userNum);

	public int mie(MemberDto mDto);

}
