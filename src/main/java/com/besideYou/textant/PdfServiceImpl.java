package com.besideYou.textant;


import java.awt.image.BufferedImage;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.imageio.ImageIO;

import org.apache.commons.io.output.ByteArrayOutputStream;
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
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.besideYou.textant.Dao.CommentDao;
import com.besideYou.textant.Dto.CommentDto;

@Service
public class PdfServiceImpl implements PdfServiceText{
	
	@Override
	public String check(PdfFileDto fileDto)throws Exception {
		//이미지 확장자 검사
		if(!fileDto.getBookImg().isEmpty()){
		String type =fileDto.getBookImg().getContentType();
		String imageType=type.substring(type.lastIndexOf("/")+1);
			if(!(imageType.equalsIgnoreCase("jpg")||imageType.equalsIgnoreCase("png")||imageType.equalsIgnoreCase("jpeg"))) {
				return "500";
			}
		}
		String error=null;
		int line=fileDto.getLine();
			if(line==1||line==2){
				error=txtWrite(fileDto.getBookFile(),fileDto.getBookImg(),line,
						fileDto.getNumOfOneLine(),fileDto.getLineOfOnePage());
			}else{
				error=pdfWrite(fileDto.getBookFile(),fileDto.getBookImg());
			}
		

		return error;
	}


	public String txtWrite(MultipartFile bookFile,MultipartFile bookImg,int lineNum,int numLine,int linePage){
		UUID uid = UUID.randomUUID(); 
		String oldFileName=uid.toString()+"_"+bookFile.getOriginalFilename();
		String destinationDir = "D:/temp/Converted_txt/";
		BufferedReader br=null;
		File destinationFile =null;
		int numOfOneLine = 0;
		int lineOfOnePage = 0;
		
		destinationFile = new File(destinationDir + oldFileName);
		try {
	if (!destinationFile.exists()) {
		 destinationFile.mkdirs();
		}
//	Writer myWriter= new BufferedWriter(new OutputStreamWriter(
//		    new FileOutputStream(oldFileName), "UTF-8"));
//		try {
//		    myWriter.write(destinationDir + oldFileName+"/"+ oldFileName);
//		} catch(Exception e){
//		e.printStackTrace();
//		}
		new File(destinationDir + oldFileName+"/orgFile/"+ oldFileName).mkdirs();
		bookFile.transferTo(new File(destinationDir + oldFileName+"/orgFile/"+ oldFileName));
		//br = new BufferedReader(new FileReader(destinationDir + oldFileName+"/"+ oldFileName)); //Read .txt file  //"euc-kr"
		br = new BufferedReader(new InputStreamReader(new FileInputStream(new File(destinationDir + oldFileName+"/orgFile/"+ oldFileName)),"euc-kr"));
		if(numLine==0) {
			numOfOneLine=30;
		}else {
			numOfOneLine = numLine;	// Number of one line
		}
		if(linePage==0) {
			lineOfOnePage=30;
		}else {
			lineOfOnePage = linePage;	// Number of lines of One page
		}
		
		int page = 1;	// For count pages
		int numOfEnter;	// For search the number of Enter
		StringBuilder sb = new StringBuilder();
		String line = br.readLine(); // Read one line
		
		while (line != null) { // While line is exist
			if (line.length() <= numOfOneLine) {//길이가 3이하면 뒤에 엔터추가 하고  StringBuilder 에추가
				sb.append(line + "\r\n");
				line = br.readLine();	// Read next line when current line is lesser than numOfOneLine 
			} else {//길이가 3이하가 아니면 길이가 3문자에 잘라서 엔터추가 StringBuilder 에추가 하고 나머지는 line 에초기화
				sb.append(line.substring(0, numOfOneLine) + "\r\n");
				line = line.substring(numOfOneLine); // Cut line and reunite
			}//StringBuilder 에 엔터가 3이상이면 마지막에추가한 엔터값을 삭제하고 저장 및 StringBuilder 초기화 page++
			
			
			
//			if (line.length() <= numOfOneLine) {//길이가 3이하면 뒤에 엔터추가 하고  StringBuilder 에추가
//				sb.append(line + "\r\n");
//				line = br.readLine();	// Read next line when current line is lesser than numOfOneLine 
//			} else {//길이가 3이하가 아니면 길이가 3문자에 잘라서 엔터추가 StringBuilder 에추가 하고 나머지는 line 에초기화
//				sb.append(line.substring(0, numOfOneLine) + "\r\n");
//				line = line.substring(numOfOneLine); // Cut line and reunite
//			}//StringBuilder 에 엔터가 3이상이면 마지막에추가한 엔터값을 삭제하고 저장 및 StringBuilder 초기화 page++
			
			
			numOfEnter = StringUtils.countOccurrencesOf(sb.toString(), "\r\n");
			if(numOfEnter >= lineOfOnePage) {
				page = write(page,sb,oldFileName); // Write and return the number of page for increase
			}
					
		} // Exit when line is not exist
		
		write(page,sb,oldFileName); // Write the left text 
		br.close();
		}catch (Exception e) {
			allFileDelete(destinationFile);
			return "500";
		}
		fileImg(bookImg,oldFileName,destinationDir);
		return null;
	}
	public static int write(int page, StringBuilder sb,String oldFileName) throws Exception{
		if(sb.toString().equals("\r\n")) {System.out.println("\\r\\n");return page;}
		if(sb.toString().equals("")) {System.out.println("space");return page;}
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(new File("D:/temp/Converted_txt/"+oldFileName+"/"+ page +".txt")),"euc-kr"));
		//BufferedWriter bw = new BufferedWriter(new FileWriter(new File("D:/temp/Converted_txt/"+oldFileName+"/"+ page + oldFileName)));
		String withoutLastEnter = sb.toString().substring(0, sb.toString().lastIndexOf("\r\n"));
		bw.write(withoutLastEnter);
//		Writer wit=bw;
//		wit.write(withoutLastEnter);
		bw.flush();
		bw.close();
		System.out.println("sb : " + withoutLastEnter);
		sb.setLength(0);
		page++;
		return page;
	}
	
	
	
	public String pdfWrite(MultipartFile mFile,MultipartFile bookImg) {
		
		File destinationFile =null;
		String sourceDir = "D:/temp/"; // Pdf files are read from this folder
		String destinationDir = "D:/temp/Converted_PdfFiles_to_Image/"; // converted images from pdf document are
//		UUID uid = UUID.randomUUID();														// saved here
		String oldFileName = /*uid.toString()+"_"+*/mFile.getOriginalFilename();
		try {
			destinationFile = new File(destinationDir + oldFileName);
			//						D:/temp/Converted_PdfFiles_to_Image/+gameOfThrone.pdf
		if (!destinationFile.exists()) {
			destinationFile.mkdirs();
			System.out.println("Folder Created -> " + destinationFile.getAbsolutePath());
		}
			
		    new File(destinationDir+oldFileName+"/orgFile/"+oldFileName).mkdirs();
			mFile.transferTo(new File(destinationDir+oldFileName+"/orgFile/"+oldFileName));//************************
			Long startTime = System.currentTimeMillis();
			System.out.println(startTime);

			File sourceFile = new File(destinationDir + oldFileName+"/orgFile/" + oldFileName);//************************
			//							D:/temp/+gameOfThrone.pdf
			
			if (sourceFile.exists()) {
				
				System.out.println("Images copied to Folder: " + destinationFile.getName());
				
				PDDocument document = PDDocument.load(sourceFile);

//				PdfImageCounter counter = new PdfImageCounter();
//				counter.countImagesWithProcessor(document);
				PDFRenderer pdfRenderer = new PDFRenderer(document);
				int pageCounter = 0;
				String fileName = sourceFile.getName().replace(".pdf", "");
				System.out.println("Total files to be converted -> " + document.getPages().getCount());
				
				int pageNumber = 1;
				for (PDPage page : document.getPages())	{
					// 기존의 방식
/*				    // note that the page number parameter is zero based
				    BufferedImage bim = pdfRenderer.renderImageWithDPI(pageCounter, 300, ImageType.RGB);
				    File outputfile = new File(
							destinationDir + oldFileName + "/" + fileName + "_" + pageNumber + ".png");
					
				    // suffix in filename will be used as the file format
				    ImageIO.write(bim, "png", outputfile);
*/
					//새로운 방식 <훨씬 빠른듯>
					
					BufferedImage bim = pdfRenderer.renderImageWithDPI(pageCounter, 144, ImageType.RGB);
					
//					byte[] imageByte = ((DataBufferByte)bim.getData().getDataBuffer()).getData();
					
					ByteArrayOutputStream baos = new ByteArrayOutputStream();
					ImageIO.write( bim, "jpg", baos );
					baos.flush();
					byte[] imageInByte = baos.toByteArray();
					baos.close();
//					DataBufferInt imageByte = (DataBufferInt)bim.getData().getDataBuffer();
//					int[] imageInt = imageByte.getData();
				    FileOutputStream fos3 = new FileOutputStream(new File(
							destinationDir + oldFileName + "/" + pageNumber + ".jpg"));
					BufferedOutputStream bos3 = new BufferedOutputStream(fos3);
//					bos3.write(imageByte);
					bos3.write(imageInByte);
					bos3.close();
					fos3.close();
					
					
					PDFTextStripper reader = new PDFTextStripper();
					reader.setStartPage(pageNumber);
					reader.setEndPage(pageNumber);
					String pageText = reader.getText(document);
					new File(destinationDir + oldFileName + "/" + pageNumber).mkdir();
					FileOutputStream fos = new FileOutputStream(
							new File(destinationDir + oldFileName + "/" + pageNumber + "/"+fileName + ".txt"));

					BufferedOutputStream bos = new BufferedOutputStream(fos);
					bos.write(pageText.getBytes());
					System.out.println("TextCreated" + destinationDir + pageNumber + "/" + fileName + ".txt");
					bos.close();
					fos.close();
					
					
					PDResources pdResources = page.getResources();
					int imageCount = 1;
			        for (COSName cosName : pdResources.getXObjectNames()) {
			            PDXObject xobject = pdResources.getXObject(cosName);
			            if (xobject instanceof PDImageXObject) {
			            	//기존의 방식
			            	/*
			            	BufferedImage bi = ((PDImageXObject) xobject).getImage();
			            	String imageDest =destinationDir + oldFileName + "/" + pageNumber + "/" + fileName
									+ "_" + imageCount + ".png";
			            	System.out.println("Image created as " + imageDest);
			            	File file = new File(imageDest);
			            	ImageIO.write(bi, "png", file);
			            	*/
			            	
			            	//새로운 방식 <훨씬 빠른듯>
							
							
//							byte[] imageByte = ((DataBufferByte)bim.getData().getDataBuffer()).getData();
			            	BufferedImage bi = ((PDImageXObject) xobject).getImage();
							ByteArrayOutputStream baossa = new ByteArrayOutputStream();
							ImageIO.write( bi, "jpg", baossa );
							baossa.flush();
							byte[] imageInByteSa = baossa.toByteArray();
							baossa.close();
//							DataBufferInt imageByte = (DataBufferInt)bim.getData().getDataBuffer();
//							int[] imageInt = imageByte.getData();
							String imageDest4 =destinationDir + oldFileName + "/" + pageNumber + "/" + fileName
									+ "_" + imageCount + ".png";
						    FileOutputStream fos4 = new FileOutputStream(new File(imageDest4));
							BufferedOutputStream bos4 = new BufferedOutputStream(fos4);
//							bos3.write(imageByte);
							bos4.write(imageInByteSa);
							bos4.close();
							fos4.close();
			            	
			            	
			                imageCount++;
			                if (imageCount % 100 == 0) {
			                    System.out.println("Found image: #" + imageCount);
			                }
			            }
			        }
			        
			       
			        
					/*PDResources pdResources = page.getResources();
					int totalImages = 1;
					Map pageImages = pdResources.getImages();
					if (pageImages != null) {
						Iterator imageIter = pageImages.keySet().iterator();
						while (imageIter.hasNext()) {
							String key = (String) imageIter.next();
							PDImageXObject pdxObjectImage = (PDImageXObject) pageImages.get(key);
							pdxObjectImage.(destinationDir + oldFileName + "/" + pageNumber + "/" + fileName
									+ "_" + totalImages);
							totalImages++;
						}
					}*/
			        System.out.println("pageNumber : " + pageNumber);
					pageNumber++;
					pageCounter++;
				}
				document.close();
				System.out.println("걸린시간 : " + (System.currentTimeMillis() - startTime));
				System.out.println("Converted Images are saved at -> " + destinationFile.getAbsolutePath());
			}

		} catch (Exception e) {
			allFileDelete(destinationFile);
			return "500";
		}
		fileImg(bookImg,oldFileName,destinationDir);
		return "redirect:main.text";
	}
	
	public void fileImg(MultipartFile fileImg, String oldFileName, String destinationDir) {
		if(!fileImg.isEmpty()) {
		String oldFileNames=null;
		if(oldFileName.contains(".txt")) {
			oldFileNames=oldFileName.replace(".txt", "");
		}else if(oldFileName.contains(".pdf")) {
			oldFileNames=oldFileName.replace(".pdf", "");
		}
		String formatName = fileImg.getOriginalFilename().substring(fileImg.getOriginalFilename().lastIndexOf(".")+1);    
		File file =new File(destinationDir+oldFileName+"/OriginImg/"+/*oldFileNames+*/"1."+"jpg"/*formatName*/);
		if(!file.exists()) {
			file.mkdirs();
		}
		try {
			fileImg.transferTo(new File(destinationDir+oldFileName+"/OriginImg/"+/*oldFileNames+*/"1.jpg"/*+formatName*/));
			BufferedImage sourceImg = ImageIO.read(new File(destinationDir+oldFileName+"/OriginImg/"+/*oldFileNames+*/"1.jpg"/*+formatName*/));
			BufferedImage destImg = Scalr.resize(sourceImg, 
									Scalr.Method.AUTOMATIC, 
										Scalr.Mode.FIT_TO_HEIGHT,280);   
			String thumbnailName =	destinationDir+oldFileName+"/OriginImg/"+"s_"+oldFileNames+"."+formatName;   
			File newFile = new File(thumbnailName);  
			ImageIO.write(destImg, formatName.toUpperCase(), newFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		} else {
			
		}
		
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

	@Autowired
	CommentDao commentDao;
	@Resource(name="pageBlock")
	Integer pageBlock;
	
	@Resource(name="pageSize")
	Integer pageSize;
	
	@Override
	public void scroll(CommentDto commentDto) {
		commentDao.scroll(commentDto);
		
	}


//	@Override
//	public List<CommentDto> scrollView(int page, int nextPage) {
//		List<CommentDto> commentList;
//		HashMap<String,Integer>  pageBlockMin = new HashMap<String,Integer>();
//		pageBlockMin.put("page", page);
//		pageBlockMin.put("pageBlock", pageBlock);
//		int pageCountBlock = commentDao.pageCountBloack(pageBlockMin);
//		pageBlockMin.put("pageCountBlock",pageCountBlock);
//		int pageListCount=commentDao.commentListCount(pageBlockMin);
//		int pageCut=(int)Math.ceil((double)pageListCount/pageSize);
//		if(nextPage<=pageCut){
//			int pageStart=0;
//			if(nextPage==1){
//				pageStart=1;
//			}else {
//				pageStart=((nextPage-1)*pageSize)-1;
//			}
//			int pageStop=nextPage*pageSize;
//			pageBlockMin.put("pageStart",pageStart);
//			pageBlockMin.put("pageStop",pageStop);
//			return commentList=commentDao.commentList(pageBlockMin);	
//		}else {
//			return commentList=null;
//		}
//	}
	
	@Override
	public List<CommentDto> scrollView(int page,int nextPage,int pageListCount,int pageCountBlock,int pageCut,int bookArticleNum) {
		List<CommentDto> commentList;
		HashMap<String,Integer>  pageBlockMin = new HashMap<String,Integer>();
		pageBlockMin.put("bookArticleNum", bookArticleNum);
		pageBlockMin.put("page", page);
		pageBlockMin.put("pageBlock", pageBlock);
//		int pageCountBlock =0;
//		if(pageBlock>=page) {
//			pageCountBlock=1;
//		}else {
//			int pageCountCut=pageBlock;
//			pageCountCut--;
//			pageCountBlock=page-pageCountCut;
//			
//		}
		
		pageBlockMin.put("pageCountBlock",pageCountBlock);
//		int pageListCount=commentDao.commentListCount(pageBlockMin);
//		int pageCut=(int)Math.ceil((double)pageListCount/pageSize);
		if(nextPage<=pageCut){
			int pageStart=0;
			if(nextPage==1){
				pageStart=1;
			}else {
				pageStart=((nextPage-1)*pageSize)+1;
			}
			int pageStop=nextPage*pageSize;
			pageBlockMin.put("pageStart",pageStart);
			pageBlockMin.put("pageStop",pageStop);
			return commentList=commentDao.commentList(pageBlockMin);	
		}else {
			return commentList=null;
		}
	}


	@Override
	public List<Integer> commentCount(int page,int bookArticleNum) {
		List<Integer> pagePoint = new ArrayList<Integer>();
		HashMap<String,Integer>  pageBlockMin = new HashMap<String,Integer>();
		pageBlockMin.put("page", page);
		pageBlockMin.put("pageBlock", pageBlock);
		int pageCountBlock =0;
		if(pageBlock>=page) {
			pageCountBlock=1;
		}else {
			int pageCountCut=pageBlock;
			pageCountCut--;
			pageCountBlock=page-pageCountCut;
			
		}
		pageBlockMin.put("pageCountBlock",pageCountBlock);
		pageBlockMin.put("bookArticleNum",bookArticleNum);
		int pageListCount=commentDao.commentListCount(pageBlockMin);
		int pageCut=(int)Math.ceil((double)pageListCount/pageSize);
		System.out.println("++++++++++++++++"+pageCut);
		pagePoint.add(pageListCount);
		pagePoint.add(pageCountBlock);
		pagePoint.add(page);
		pagePoint.add(pageCut);
		pagePoint.add(bookArticleNum);
		return pagePoint;
	}
	
	
	
	
	
	
}
