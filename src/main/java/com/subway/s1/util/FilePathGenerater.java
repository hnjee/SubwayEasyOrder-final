package com.subway.s1.util;

import java.io.File;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Component;
@Component
public class FilePathGenerater {
	@Autowired
	private ResourceLoader resourceLoader;

	
	public File getUserResourceLoader(String path) throws Exception{

		String defaultPath="classpath:/static/";
		File file= resourceLoader.getResource(defaultPath).getFile(); 
		file= new File(file,path); //file->static  path->child
		if(!file.exists()) {
			file.mkdirs();
		}
		System.out.println(file.getAbsolutePath()); //실제경로
		return file;
	}

}
