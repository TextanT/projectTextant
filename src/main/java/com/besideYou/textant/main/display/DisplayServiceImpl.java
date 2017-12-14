package com.besideYou.textant.main.display;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.net.URLEncoder;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

@Service
public class DisplayServiceImpl implements DisplayService {
	@Resource(name="saveDir")
	String destinationDir;
	
	@Override
	public ResponseEntity<byte[]> display(String fileName, String pageNum, String fileType) throws IOException {
		File file;
		BufferedInputStream bis = null;
		ResponseEntity<byte[]> entity = null;
		HttpHeaders headers;
		String realName;
		String s;
		StringBuilder sb;
		BufferedReader br;
		byte[] b;
		if (fileType.equals("jpg")) { //만약 jpg로 보려고 한다면

			
			file = new File(
					destinationDir + fileName + "/" + /* realName+"_"+ */pageNum + ".jpg");
//			System.out.println(file.getName());
			
			
			try {
				bis = new BufferedInputStream(new FileInputStream(file));
			} catch (FileNotFoundException e1) {
//				System.out.println("마지막 페이지 입니다");
				// e1.printStackTrace();
				bis = new BufferedInputStream(new FileInputStream("d:/temp/temp/TEXTANT.png"));
				entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(bis), HttpStatus.BAD_REQUEST);
				bis.close();
				return entity;
			}
			try {
				headers = new HttpHeaders();
//				System.out.println(file);
				headers.add("Content-Disposition", "attachment; filename=\""
						+ URLEncoder.encode(file.getName(), "utf-8").replace("+", "%20") + "\"");
				entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(bis), headers, HttpStatus.CREATED);
			} catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
			} finally {
				bis.close();
			}
			return entity;
		} else { //아니라면
//			System.out.println(fileName);
			realName = fileName.substring(0, fileName.lastIndexOf("."));
			file = new File(
					destinationDir+ fileName + "/" + pageNum + "/" + realName.substring(realName.indexOf("_")+1) + ".txt");
//			System.out.println("text파일은 "+ file.getName());
			br = new BufferedReader(new FileReader(file));
			sb = new StringBuilder();
			
			while((s=br.readLine())!=null) {
				sb.append(s+"\r\n");
			}
//			System.out.println("sb.toString()"+sb.toString());
			b = sb.toString().getBytes("UTF-8");
//			System.out.println("byte[] : "+b);
			headers = new HttpHeaders();
//			System.out.println(file);
			headers.add("Content-Disposition", "attachment; filename=\""
					+ URLEncoder.encode(file.getName(), "utf-8").replace("+", "%20") + "\"");
			entity = new ResponseEntity<byte[]>(b,HttpStatus.OK);
			br.close();
			return entity;
		}
	}
}
