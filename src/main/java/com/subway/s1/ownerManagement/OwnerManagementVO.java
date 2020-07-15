package com.subway.s1.ownerManagement;

import com.subway.s1.store.StoreVO;

import lombok.Data;

@Data
public class OwnerManagementVO{
	private String storeNum;
	private String name;
	private String address;
	private String telNumber;
	private String hours;
	private Integer orderable;
	private Integer best;
	private int StoreScore;
}
