package com.subway.s1.product;

import java.util.List;

import com.subway.s1.menu.MenuVO;
import com.subway.s1.menu.menuFile.MenuFileVO;

import lombok.Data;

@Data
public class ProductVO extends MenuVO{
	
	private int sell;

	private List<MenuFileVO> fileVOs;
	
}
