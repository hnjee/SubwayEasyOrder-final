package com.subway.s1.survey.chart;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface SurveyChartRepository {

	public List<BarVO> thisBar(String storeNum)throws Exception;
	
	public List<MonthVO> surveyMonth(String storeNum,String month)throws Exception;
	public int monthCount(String storeNum,String month)throws Exception;
	
	public List<YearVO> surveyYear(String storeNum,String year)throws Exception;
	public int yearCount(String storeNum,String year)throws Exception;
	

}
