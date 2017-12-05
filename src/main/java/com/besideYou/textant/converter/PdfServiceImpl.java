package com.besideYou.textant.converter;

import java.awt.image.BufferedImage;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.util.UUID;

import javax.annotation.Resource;
import javax.imageio.ImageIO;

import org.apache.pdfbox.cos.COSName;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.PDResources;
import org.apache.pdfbox.pdmodel.graphics.PDXObject;
import org.apache.pdfbox.pdmodel.graphics.image.PDImageXObject;
import org.apache.pdfbox.rendering.ImageType;
import org.apache.pdfbox.rendering.PDFRenderer;
import org.apache.pdfbox.text.PDFTextStripper;
import org.imgscalr.Scalr;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.besideYou.textant.dao.BookInfoDao;
import com.besideYou.textant.dto.BookInfoDto;

@Service
public class PdfServiceImpl implements PdfServiceText {

	@Autowired
	BookInfoDao bookInfoDao;
	
	@Resource(name = "saveDir")
	String destinationDir;
	
	int totalPageNum, currPageNum;
	BookInfoDto bookInfoDto;

	@Override
	public String check(BookInfoDto bookInfoDto) throws Exception {
		
		this.bookInfoDto = bookInfoDto;
		
		String view;
		String type;
		String imageType;
		int line;
		
		// 이미지 확장자 검사
		if (!bookInfoDto.getBookImg().isEmpty()) {
			type = bookInfoDto.getBookImg().getContentType();
			imageType = type.substring(type.lastIndexOf("/") + 1);
			if (!(imageType.equalsIgnoreCase("jpg") || imageType.equalsIgnoreCase("png")
					|| imageType.equalsIgnoreCase("jpeg"))) {
				return "write/imageFail";
			}
		}
		line = bookInfoDto.getLine();
		if (line == 1 || line == 2) {
			view = txtWrite(bookInfoDto.getBookFile(), bookInfoDto.getBookImg(), line, bookInfoDto.getNumOfOneLine(),
					bookInfoDto.getLineOfOnePage());
			bookInfoDao.writeBook(bookInfoDto);
		} else {
			view = pdfWrite(bookInfoDto.getBookFile(), bookInfoDto.getBookImg());
		}
		return view;
	}

	public String txtWrite(MultipartFile bookFile, MultipartFile bookImg, int lineNum, int numLine, int linePage) {
		
		UUID uid;
		String oldFileName;
		String destinationDir;
		String line;
		StringBuilder textBuilder; 
		BufferedReader br;
		File destinationFile;
		int numOfOneLine, lineOfOnePage, page, numOfEnter;
		

		uid = UUID.randomUUID();
		oldFileName = uid.toString() + "_" + bookFile.getOriginalFilename();
//		destinationDir = "D:/temp/Converted_txt/";
		destinationDir = this.destinationDir;
		destinationFile = new File(destinationDir + oldFileName);
		try {
			if (!destinationFile.exists()) {
				destinationFile.mkdirs();
			}
			new File(destinationDir + oldFileName + "/orgFile/" + oldFileName).mkdirs();
			bookFile.transferTo(new File(destinationDir + oldFileName + "/orgFile/" + oldFileName));
			br = new BufferedReader(new InputStreamReader(
					new FileInputStream(new File(destinationDir + oldFileName + "/orgFile/" + oldFileName)), "euc-kr"));

			if (numLine <= 0) {
				numOfOneLine = 30;
			} else {
				numOfOneLine = numLine; // Number of one line
			}

			if (linePage <= 0) {
				lineOfOnePage = 30;
			} else {
				lineOfOnePage = linePage; // Number of lines of One page
			}

			page = 1; // For count pages
			
			textBuilder = new StringBuilder();
			line = br.readLine(); // Read one line

			while (line != null) { // While line is exist
				if (line.length() <= numOfOneLine) {// 길이가 3이하면 뒤에 엔터추가 하고 StringBuilder 에추가
					textBuilder.append(line + "\r\n");
					line = br.readLine(); // Read next line when current line is lesser than numOfOneLine
				} else {// 길이가 3이하가 아니면 길이가 3문자에 잘라서 엔터추가 StringBuilder 에추가 하고 나머지는 line 에초기화
					textBuilder.append(line.substring(0, numOfOneLine) + "\r\n");
					line = line.substring(numOfOneLine); // Cut line and reunite
				} // StringBuilder 에 엔터가 3이상이면 마지막에추가한 엔터값을 삭제하고 저장 및 StringBuilder 초기화 page++
				numOfEnter = StringUtils.countOccurrencesOf(textBuilder.toString(), "\r\n");
				if (numOfEnter >= lineOfOnePage) {
					page = write(page, textBuilder, oldFileName); // Write and return the number of page for increase
				}
			} // Exit when line is not exist

			write(page, textBuilder, oldFileName); // Write the left text
			br.close();
		} catch (Exception e) {
			allFileDelete(destinationFile);
			return "500";
		}
		fileImg(bookImg, oldFileName, destinationDir);
		return null;
	}

	
	public static int write(int page, StringBuilder sb, String oldFileName) throws Exception {
		BufferedWriter bw;
		String withoutLastEnter;
		
		if (sb.toString().equals("\r\n")) {
			return page;
		}
		if (sb.toString().equals("")) {
			return page;
		}
		bw = new BufferedWriter(new OutputStreamWriter(
				new FileOutputStream(new File("D:/temp/Converted_txt/" + oldFileName + "/" + page + ".txt")),
				"euc-kr"));
		withoutLastEnter = sb.toString().substring(0, sb.toString().lastIndexOf("\r\n"));
		bw.write(withoutLastEnter);
		bw.flush();
		bw.close();
		System.out.println("sb : " + withoutLastEnter);
		sb.setLength(0);
		page++;
		return page;
	}

	// pdf파일 컨버팅
	public String pdfWrite(MultipartFile mFile, MultipartFile bookImg) {

		File destinationDirFile = null;
		File sourceFile;
		File outputfile;
		File file;
		UUID uid;
		String sourceDir;
		String destinationDir;
		String fileName;
		String onlyFileName;
		String imageDest;
		String locatedDir;
		PDDocument document;
		PDFRenderer pdfRenderer;
		PDFTextStripper reader;
		FileOutputStream fos;
		BufferedOutputStream bos;
		PDResources pdResources;
		PDXObject xobject;
		BufferedImage resourcesImage;
		BufferedImage bim;
		long startTime;
		int pageCounter;
		
//		destinationDir = "D:/temp/Converted_PdfFiles_to_Image/"; // converted images from pdf document are
		destinationDir = this.destinationDir;
		fileName = mFile.getOriginalFilename();
		uid = UUID.randomUUID();
		locatedDir = destinationDir + uid.toString() + "_" + fileName;
		try {
			destinationDirFile = new File(locatedDir);
			if (!destinationDirFile.exists()) {
				destinationDirFile.mkdirs();
				System.out.println("Folder Created -> " + destinationDirFile.getAbsolutePath());
			}

			new File(locatedDir + "/orgFile/" + fileName).mkdirs();
			mFile.transferTo(new File(locatedDir + "/orgFile/" + fileName));// ************************
			
			startTime = System.currentTimeMillis();
			System.out.println(startTime);
			sourceDir = locatedDir + "/";
			sourceFile = new File(locatedDir + "/orgFile/" + fileName);// ************************

			//파일이 있는지 먼저 체크
			if (sourceFile.exists()) {

				System.out.println("Images copied to Folder: " + destinationDirFile.getName());

				document = PDDocument.load(sourceFile);
				pdfRenderer = new PDFRenderer(document);
				
				totalPageNum = document.getPages().getCount();
				
				bookInfoDto.setTotalPage(totalPageNum);
				bookInfoDto.setFileLocation((uid.toString() + "_" + fileName));
				
				pageCounter = 0;
				onlyFileName = sourceFile.getName().replace(".pdf", "");
				System.out.println("Total files to be converted -> " + document.getPages().getCount());

				int pageNumber = 1;
				
				// pdf파일을 페이지 별로 나누기
				for (PDPage page : document.getPages()) {
					bim = pdfRenderer.renderImageWithDPI(pageCounter, 300, ImageType.RGB);
					outputfile = new File(
							locatedDir + "/" + /* fileName + "_" + */pageNumber + ".jpg");
					ImageIO.write(bim, "jpg", outputfile);

					// pdf파일을 텍스트로 변환
					reader = new PDFTextStripper();
					reader.setStartPage(pageNumber);
					reader.setEndPage(pageNumber);
					String pageText = reader.getText(document);
					new File(locatedDir + "/" + pageNumber).mkdir();
					fos = new FileOutputStream(
							new File(locatedDir + "/" + pageNumber + "/" + onlyFileName + ".txt"));

					bos = new BufferedOutputStream(fos);
					bos.write(pageText.getBytes());
					System.out.println("TextCreated" + destinationDir + pageNumber + "/" + onlyFileName + ".txt");
					bos.close();
					fos.close();

					pdResources = page.getResources();
					int imageCount = 1;
					for (COSName cosName : pdResources.getXObjectNames()) {
						xobject = pdResources.getXObject(cosName);
						if (xobject instanceof PDImageXObject) {
							// 기존의 방식

							resourcesImage = ((PDImageXObject) xobject).getImage();
							imageDest = locatedDir + "/" + pageNumber + "/" + onlyFileName + "_"
									+ imageCount + ".jpg";
							System.out.println("Image created as " + imageDest);
							file = new File(imageDest);
							ImageIO.write(resourcesImage, "jpg", file);

							imageCount++;
							if (imageCount % 100 == 0) {
								System.out.println("Found image: #" + imageCount);
							}
						}
					}

					System.out.println("pageNumber : " + pageNumber);
					pageNumber++;
					pageCounter++;
				}
				document.close();
				System.out.println("걸린시간 : " + (System.currentTimeMillis() - startTime));
				System.out.println("Converted Images are saved at -> " + destinationDirFile.getAbsolutePath());
			}

		} catch (Exception e) {
			allFileDelete(destinationDirFile);
			return "500";
		}
		fileImg(bookImg, fileName, destinationDir + uid.toString() + "_");
		return "redirect:main.text";
	}

	public void fileImg(MultipartFile fileImg, String oldFileName, String destinationDir) {
		String oldFileNames = null;
		String formatName;
		File file;
		BufferedImage sourceImg;
		BufferedImage destImg;
		String thumbnailName;
		File newFile;
		
		if (!fileImg.isEmpty()) {
			if (oldFileName.contains(".txt")) {
				oldFileNames = oldFileName.replace(".txt", "");
			} else if (oldFileName.contains(".pdf")) {
				oldFileNames = oldFileName.replace(".pdf", "");
			}
			formatName = fileImg.getOriginalFilename()
					.substring(fileImg.getOriginalFilename().lastIndexOf(".") + 1);
			file = new File(
					destinationDir + oldFileName + "/OriginImg/" + /* oldFileNames+ */"1." + "jpg"/* formatName */);
			if (!file.exists()) {
				file.mkdirs();
			}
			try {
				fileImg.transferTo(new File(
						destinationDir + oldFileName + "/OriginImg/" + /* oldFileNames+ */"1.jpg"/* +formatName */));
				sourceImg = ImageIO.read(new File(
						destinationDir + oldFileName + "/OriginImg/" + /* oldFileNames+ */"1.jpg"/* +formatName */));
				destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 280);
				thumbnailName = destinationDir + oldFileName + "/OriginImg/" + "s_" + oldFileNames + "."
						+ formatName;
				newFile = new File(thumbnailName);
				ImageIO.write(destImg, formatName.toUpperCase(), newFile);
				
				bookInfoDto.setThumbnail(newFile.toString());
				bookInfoDao.writeBook(bookInfoDto);
				System.out.println(bookInfoDto);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else {

		}

	}

}
