package com.besideYou.textant;

import java.awt.Image;
import java.awt.Point;
import java.awt.Toolkit;
import java.awt.image.BufferedImage;
import java.awt.image.DataBufferByte;
import java.awt.image.Raster;
import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.imageio.ImageIO;

public class ImageEx {
	public static void main(String[] args) throws IOException {
		System.out.println("걸린시간 : ");
		long sum=0;
		for(int i = 0; i<10; i++) {
			BufferedImage bi = ImageIO.read(new File("d:/temp/background-2943548_1920.jpg"));
			long StartTime = System.currentTimeMillis();
			byte[] imageInByte = ((DataBufferByte) bi.getRaster().getDataBuffer()).getData();
			/*
			BufferedImage bim = new BufferedImage(bi.getWidth(), bi.getHeight(), BufferedImage.TYPE_3BYTE_BGR);
			bim.setData(Raster.createRaster(bi.getSampleModel(), new DataBufferByte(imageInByte,imageInByte.length), new Point()));
			ImageIO.write(bim, "png", new File("d:/temp/sample.png"));
			*/
			/*
			
			BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(new File("d:/temp/sample.jpg")));
			
			bos.write();
			bos.flush();
			bos.close();
			*/
//			ByteArrayOutputStream baos = new ByteArrayOutputStream();
//			ImageIO.write(bi, "png", /*new File("d:/temp/sample.jpg")*/baos);
//			BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(new File("d:/temp/sample.jpg")));
//			bos.write(baos.toByteArray());
//			
			
			ImageIO.write(bi, "png", new File("d:/temp/sample.jpg"));
			sum+=System.currentTimeMillis()-StartTime;
			System.out.println(System.currentTimeMillis()-StartTime + ", ");	
		}
		System.out.println("평균 : " + sum/10);
		
	}
}
