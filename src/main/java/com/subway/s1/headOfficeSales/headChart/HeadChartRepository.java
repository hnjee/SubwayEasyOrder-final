package com.subway.s1.headOfficeSales.headChart;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.subway.s1.sales.chart.ChartVO;
import com.subway.s1.sales.chart.PieChartVO;

@Repository
@Mapper
public interface HeadChartRepository {
	
	public List<ChartVO> monthChart() throws Exception;
	public List<ChartVO> timeChart() throws Exception;
	public List<ChartVO> weekChart() throws Exception;
	public List<ChartVO> yearChart() throws Exception;
	public Long menuCount(String code)throws Exception;
}//END CLASS
