package com.subway.s1.franchise;

import java.sql.Date;

import lombok.Data;

@Data
public class FranchiseVO {

	private int requestNum;
	private String ownerName;
	private String email1;
	private String email2;
	private String storeName;
	private String address;
	private int requestInfo;
	private Date requestDate;
	private String memo;
	
}
