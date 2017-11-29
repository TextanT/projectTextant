package com.besideYou.textant.display;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.Charset;

import org.apache.commons.io.IOUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

@Service
public class DisplayServiceImpl implements DisplayService {
	@Override
	public ResponseEntity<byte[]> display(String fileName, String pageNum, String fileType) throws IOException {
		if (fileType.equals("jpg")) { //만약 jpg로 보려고 한다면

			
			File file = new File(
					"d:/temp/Converted_PdfFiles_to_Image/" + fileName + "/" + /* realName+"_"+ */pageNum + ".jpg");
			System.out.println(file.getName());
			BufferedInputStream bis = null;
			ResponseEntity<byte[]> entity = null;
			try {
				bis = new BufferedInputStream(new FileInputStream(file));
			} catch (FileNotFoundException e1) {
				System.out.println("마지막 페이지 입니다");
				// e1.printStackTrace();
				bis = new BufferedInputStream(new FileInputStream("d:/temp/temp/TEXTANT.png"));
				entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(bis), HttpStatus.BAD_REQUEST);
				bis.close();
				return entity;
			}
			try {
				HttpHeaders headers = new HttpHeaders();
				System.out.println(file);
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
			ResponseEntity<byte[]> entity = null;
			System.out.println(fileName);
			String realName = fileName.substring(0, fileName.lastIndexOf("."));
			File file = new File(
					"d:/temp/Converted_PdfFiles_to_Image/" + fileName + "/" + pageNum + "/" + realName + ".txt");
			System.out.println("text파일은 "+ file.getName());
			BufferedReader br = new BufferedReader(new FileReader(file));
			StringBuilder sb = new StringBuilder();
			String s;
			while((s=br.readLine())!=null) {
				sb.append(s+"<br/>");
			}
			System.out.println("sb.toString()"+sb.toString());
			byte[] b = sb.toString().getBytes("UTF-8");
			System.out.println("byte[] : "+b);
			HttpHeaders headers = new HttpHeaders();
			System.out.println(file);
			headers.add("Content-Disposition", "attachment; filename=\""
					+ URLEncoder.encode(file.getName(), "utf-8").replace("+", "%20") + "\"");
			entity = new ResponseEntity<byte[]>(b,HttpStatus.OK);
			return entity;
		}
	}
}
