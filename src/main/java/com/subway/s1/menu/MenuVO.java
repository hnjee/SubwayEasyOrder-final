package com.subway.s1.menu;

import lombok.Data;

@Data
public class MenuVO {
	private String menuNum;
	private String menuCode;
	private String name;
	private Integer menuPrice;
	private Integer menuPrice30;
	private int sale;
	private String desc;
	private String codeDesc;
}


