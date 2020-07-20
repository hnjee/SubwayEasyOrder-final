package com.subway.s1.menu;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface MenuRepository {
	public List<MenuVO> menuList(String menuCode) throws Exception;
	public List<MenuVO> menuListAll(String menuCode) throws Exception;
	public MenuVO menuSelect(String menuNum) throws Exception;

}

