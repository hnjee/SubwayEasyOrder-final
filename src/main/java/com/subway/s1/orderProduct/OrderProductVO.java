package com.subway.s1.orderProduct;

import java.util.List;

import com.subway.s1.custom.CustomVO;
import com.subway.s1.menu.MenuVO;

import lombok.Data;

@Data
public class OrderProductVO {

	private String payNum;
	private String productNum;
	private String menuNum;
	private int productCount;
	private int productPrice;
	private String setting;
	
	private String menuName;
	private MenuVO menuVO;
	private List<CustomVO> customVOs;
	
}
