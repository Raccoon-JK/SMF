package com.smf.common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyFileRenamePolicy2 implements FileRenamePolicy{

	/*
	 * 반드시 미완성된 rename메소드를 오버라이딩해서 구현해야함.
	 * 기존의 파일을 전달받아서 파일명 수정 작업후에 수정된 파일을 반환해주는 메소드
	 */
	
	@Override
	public File rename(File originFile) {
		
		// 원본 파일명("aaa.jpg")
		String originName = originFile.getName();
		
		// 수정파일명 : 파일업로드시간(년월일시분초)+5자리랜덤값(10000~99999) => 최대한 이름이 겹치지 않게
		// 확장자 : 원본파일명에서 그대로 얻어올 예정
		
		//  원본명    -> 		    수정명
		// aaa.jpg 	-> 	2023022011265012345.jpg
		
		// 1. 파일 업로드된 시간(년월일시분초) => String currentTime;
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		// 2. int ranNum;
		int ranNum = (int)(Math.random()* 90000 + 10000); // 10000<= ranNum <100000
		
		// 3. 원본파일 확장자 => String ext
		/*
		 * 파일명 중간에 .이 들어가는 경우가 있기 때문에 원본파일명에서 가장 마지막의 .의 인덱스를 기준으로 파일명과 확장자를 나눌예정
		 */
		String ext = originName.substring(originName.lastIndexOf(".")); // .jpg , .png
		
		String ImgName = currentTime + ranNum + "_1" + ext; //2023022011265012345.jpg 
		
		return new File(originFile.getParent(), ImgName); // 원본파일을 수정된 파일명으로 적용시켜서 객체를 반환해줌
	}
	
}
