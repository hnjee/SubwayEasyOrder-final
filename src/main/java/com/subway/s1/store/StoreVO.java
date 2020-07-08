package com.subway.s1.store;

import lombok.Data;

@Data
public class StoreVO {
	private String storeNum;
	private String name;
	private String address;
	private String telNumber;
	private String hours;
	private int orderable;
}