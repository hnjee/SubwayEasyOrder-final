package com.subway.s1.member;
import com.subway.s1.util.PagerOrderList;

import lombok.Data;

@Data
public class MemberVO {
	private String id;
	private String pw;
	private String name;
	private String phone;
	private String phone2;
	private String phone3;
	private int oriPoint;
	private String storeNum;
	
	
	private int orderInfo;
	private int startNum;
	private int lastNum;
	
	private int level;
	private PagerOrderList pager;
}

