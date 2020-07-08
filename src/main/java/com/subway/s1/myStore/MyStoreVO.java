package com.subway.s1.myStore;

import lombok.Data;

@Data
public class MyStoreVO {
	private String id;
	private String storeNum;
	private String name;
	private String address;
	private String telNumber;
	private Integer orderable;
}
