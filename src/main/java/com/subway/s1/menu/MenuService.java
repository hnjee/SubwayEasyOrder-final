package com.subway.s1.menu;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MenuService {
	@Autowired
	private MenuRepository menuRepository;
	
	public List<MenuVO> menuList(String menuCode) throws Exception{
		return menuRepository.menuList(menuCode);
	}
	
	public MenuVO menuSelect(String menuNum) throws Exception{
		return menuRepository.menuSelect(menuNum);
	}
}
