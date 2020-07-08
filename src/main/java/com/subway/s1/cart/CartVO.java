package com.subway.s1.cart;

import java.util.List;

import com.subway.s1.custom.CustomVO;
import com.subway.s1.menu.MenuVO;

//import com.subway.s1.custom.CustomVO;
//import com.subway.s1.menu.MenuVO;

import lombok.Data;

@Data
public class CartVO {
	private String id;
	private String menuNum;
	private String productNum;
	private int productPrice;
	private int productCount;
	private String setting;
	
	private MenuVO menuVO;

	private List<CustomVO> customVOs;
	private Integer customPrice;
	
	public Integer getCustomPrice() {
		if(this.customPrice==null) {
			this.customPrice=0;
		}
		return customPrice;
	}
	
	private String payNum;
}

