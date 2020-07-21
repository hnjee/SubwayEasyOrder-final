package com.subway.s1.point;

import java.sql.Date;

import lombok.Data;

@Data
public class PointVO {
	
	private String payNum;
	private String id;
	private int curPoint;
	private int oriPoint;
	private int totalPoint;
	private Integer pointStat;
	private String pointDate;
	
}
