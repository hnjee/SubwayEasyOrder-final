package com.subway.s1.menu.menuFile;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface MenuFileRepository {
	
	public int menuRegister(MenuFileVO menuFileVO) throws Exception;
	
	public int fileDelete(MenuFileVO menuFileVO)throws Exception;
	
	public MenuFileVO fileSelectOne(String menuNum)throws Exception;
	
	public int deletes(List<String> menuNums)throws Exception;
}
