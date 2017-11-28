package com.besideYou.textant.display;

import java.io.IOException;

import org.springframework.http.ResponseEntity;

public interface DisplayService {
	public ResponseEntity<byte[]> display (String fileName,String pageNum, String fileType) throws IOException;
}
