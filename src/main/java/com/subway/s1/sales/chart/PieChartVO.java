package com.subway.s1.sales.chart;

import lombok.Data;

@Data
public class PieChartVO {
	
	private Long swCount;
	private Long siCount;
	private Long saCount;
	private Long wrCount;
	private Long grCount;
	
	private int swPercent;
	private int siPercent;
	private int saPercent;
	private int wrPercent;
	private int grPercent;

}
