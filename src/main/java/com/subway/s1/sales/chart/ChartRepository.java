package com.subway.s1.sales.chart;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface ChartRepository {
	
	public List<ChartVO> monthChart(String storeNum) throws Exception;
	public List<ChartVO> timeChart(String storeNum) throws Exception;
	public List<ChartVO> weekChart(String storeNum) throws Exception;
	public List<ChartVO> yearChart(String storeNum) throws Exception;
	public List<PieChartVO> pChart(String storeNum)throws Exception;
	public Long menuCount(String code,String storeNum)throws Exception;
}//END CLASS
