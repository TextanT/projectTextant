package com.besideYou.textant;

import java.io.*;
import java.net.URI;
import java.util.*;

import javax.inject.Named;

public class FileEx extends File {
	private FileSize fileSize = null;

	/**
	 * super클래스의 형태로 생성자를 정의...
	 * 
	 * @param pathname
	 * @param create
	 *            부모 패스를 생성할지 여부
	 */

	/**
	 * 이 생성자로 파일을 정의 할때 경로상의 상위 오브젝트(디렉토리)가 존재하지 않으면 자동으로 생성하고 해당 오브젝트를 생성한다.
	 */
	public FileEx(String pathname, boolean create) throws IOException {
		super(pathname);
		if (create)
			createParentPath();
	}

	public FileEx(String parent, String child, boolean create) throws IOException {
		super(parent, child);
		if (create)
			createParentPath();
	}

	public FileEx(File parent, String child, boolean create) throws IOException {
		super(parent, child);
		if (create)
			createParentPath();
	}

	public FileEx(URI uri) {
		super(uri);
	}

	/**
	 * 이 file객체의 상위 폴더들이 존재 하지 않을때 그 존재하지 않는 상위 폴더들을 생성해준다.
	 * 
	 * @throws IOException
	 */
	public void createParentPath() throws IOException {
		ArrayList p = new ArrayList();
		File parent = getParentFile();
		COMPLETE: while (parent != null) {
			if (!parent.exists())
				p.add(parent);
			else
				break COMPLETE;
			parent = parent.getParentFile();
		}
		for (int i = p.size() - 1; i >= 0; i--)
			((File) p.get(i)).mkdir();
	}

	/**
	 * 파일을 생성할때 상위 폴더가 존재 하지 않으면 존재하지않는 폴더들을 생성하고 파일을 생성한다.
	 */
	public boolean createNewFileEx() throws IOException {
		// 상위 디렉토리들을 생성한다...
		createParentPath();
		// 생성하고자 하는 파일 생성...
		return super.createNewFile();
	}

	/**
	 * file을 포함하고 그 서브 디렉토리 파일들을 모두 삭제 하는 함수... 지우고자 하는 파일이나 디렉토리가 file일때 이 함수를 호출하면
	 * 서브 파일 디렉토리를 모두 지워준다.
	 * 
	 * @param file
	 */
	public static void deleteWidthSubThings(File file) {
		if (file.isDirectory()) {
			if (file.listFiles().length != 0) {
				File[] fileList = file.listFiles();
				for (int i = 0; i < fileList.length; i++) {

					// 디렉토리이고 서브 디렉토리가 있을 경우 리커젼을 한다...
					deleteWidthSubThings(fileList[i]);
					file.delete();
				}
			} else {

				// 파일 트리의 리프까지 도달했을때 삭제...
				file.delete();
			}
		} else {

			// 파일 일 경우 리커젼 없이 삭제...
			file.delete();
		}
	}

	/**
	 * 파일 사이즈 오브젝트의 인스턴스를 생성해서 리턴한다.
	 * 
	 * @return
	 */
	public FileSize getFileSizeInstance() {
		if (fileSize == null) {
			fileSize = new FileSize();
		}
		return fileSize;
	}

	public class FileSize {
		/**
		 * 파일 사이즈를 계산 하기 위해서 바이트 단위를 상수화 해둔다.
		 */
		private static final long KBYTE = 1000L;

		private static final long MBYTE = KBYTE * 1000;

		private static final long GBYTE = MBYTE * 1000;

		private static final long TBYTE = GBYTE * 1000;

		private FileSize() {
		}

		/**
		 * getTByte, getGByte, getMByte, getKByte, getByte는 전체 사이즈에서 해당하는 단위의 사이즈만을
		 * 리턴한다.
		 * 
		 * @return
		 */
		public long getTByte() {
			return length() / TBYTE;
		}

		public long getGByte() {
			return (length() - (getTByte() * TBYTE)) / GBYTE;
		}

		public long getMByte() {
			return (length() - (getTByte() * TBYTE) - (getGByte() * GBYTE)) / MBYTE;
		}

		public long getKByte() {
			return (length() - (getTByte() * TBYTE) - (getGByte() * GBYTE) - (getMByte() * MBYTE)) / KBYTE;
		}

		public long getByte() {
			return length() - (getTByte() * TBYTE) - (getGByte() * GBYTE) - (getMByte() * MBYTE) - (getKByte() * KBYTE);
		}

		/**
		 * 사이즈를 해당 단위로 변환해서 float형으로 돌려준다.
		 * 
		 * @return
		 */
		public float getTByteLength() {
			return length() / (float) TBYTE;
		}

		public float getGByteLength() {
			return length() / (float) GBYTE;
		}

		public float getMByteLength() {
			return length() / (float) MBYTE;
		}

		public float getKByteLength() {
			return length() / (float) KBYTE;
		}

		public float getByteLength() {
			return length();
		}

		private long length() {
			return size(FileEx.this);
		}

		/**
		 * FileEx객체가 디렉토리 일 경우 서브디렉토리의 모든 파일들의 사이즈를 더한 결과가를 연산...
		 * 
		 * @param o
		 * @return
		 */
		private long size(File o) {
			long s = 0;
			if (o.isDirectory()) {
				File[] list = o.listFiles();
				if (list.length > 0) {
					for (int i = 0; i < list.length; i++) {
						s += size(list[i]);
					}
				}
			} else {
				s = o.length();
			}
			return s;
		}
	}

	private static final long serialVersionUID = -6245186655660350846L;
}
