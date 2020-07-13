package com.subway.s1.orderInfo;

import lombok.Data;

@Data
public class OrderInfoVO {
	
	private String payNum;
	private String codeDesc;
	private String name;
	private long totalPrice;
	private String payDate;
	private long productCount;
	private String setting;
	private String productNum;
	private long productPrice;
	
	//--------------------------
	private String ingreName;
	private long breadSize;
	private long breadToasting;
	private long ingrePrice;
	private String ingreCode;
	private long menuPrice;
	private long menuPrice30;
	
	private String storeNum;
	private String storeName;


}
