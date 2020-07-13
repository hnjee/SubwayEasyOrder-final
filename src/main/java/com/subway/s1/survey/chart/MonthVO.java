package com.subway.s1.survey.chart;

import lombok.Data;

@Data
public class MonthVO {

	private int taste;
	private int hygiene;
	private int kindness;
	private int monthCount;

	private String month;
	private String payDate;
}
