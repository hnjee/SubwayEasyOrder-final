package com.subway.s1.util;


import java.io.File;
import java.util.UUID;

import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileSaver {

	private String makeNameByUUID(String name) {
		String result=UUID.randomUUID().toString();
		result=result+"_"+name;
		return result;
	}
	
	
	//1. 폴더 생성
	//2. 저장할 파일명 생성
	//3. 파일 HDD 저장
	public String saveByUtils(MultipartFile file,String path)throws Exception{
		File f = new File(path);
		
		if(!f.exists()) {
			f.mkdirs();
		}
		String fileName = this.makeNameByUUID(file.getOriginalFilename());
		
		f= new File(f,fileName);
		FileCopyUtils.copy(file.getBytes(),f);
		
		return fileName;
	
	}
	
	public int fileDelete(String fileName, File path) throws Exception{
		File file = new File(path, fileName);
		boolean check = false;
		int result=0;
		if(file.exists()) {
			check=file.delete();
		}
		if(check) {
			result=1;
		}
		
		return result;
	}
	
	
	
}
