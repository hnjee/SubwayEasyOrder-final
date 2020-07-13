package com.subway.s1.survey;

import lombok.Data;

@Data
public class SurveyVO {
	
	private String payNum;
	private String storeNum;
	private Integer taste;
	private Integer hygiene;
	private Integer kindness;
	private String commnet;
	private Integer totalScore;
	

}
