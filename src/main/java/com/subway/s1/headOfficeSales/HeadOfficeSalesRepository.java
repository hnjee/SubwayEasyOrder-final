package com.subway.s1.headOfficeSales;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.subway.s1.sales.ByOrderVO;
import com.subway.s1.sales.ByPeriodVO;
import com.subway.s1.sales.ByProductVO;
import com.subway.s1.util.Pager;

@Repository
@Mapper
public interface HeadOfficeSalesRepository {

	//ByProductVO
	public List<ByProductVO> getByProduct(String from, String to, Pager pager)throws Exception;
	
	//getMenuCount
	public String getMenuCount(String menuNum,String from, String to)throws Exception;
	
	//getMenuPrice
	public String getMenuPrice(String menuNum,String from, String to)throws Exception;
	
	//getAllMenuCount
	public String getAllMenuCount(String from, String to)throws Exception;
	
	//getAllMenuPrice
	public String getAllMenuPrice(String from, String to)throws Exception;

	//byProduct totalCount
	public long getProductTotal(Pager pager, String from, String to)throws Exception;

	//byDay
	public List<ByPeriodVO> byDay(String from, String to)throws Exception;

	//byPeriod
	public List<ByPeriodVO> byPeriod(String from, String to, Pager pager)throws Exception;
	
	//byTime
	public List<ByPeriodVO> byTime(String from, String to,Pager pager)throws Exception;
	
	//byPeriodCount
	public long byPeriodCount(String from, String to, Pager pager)throws Exception;

	//byTimeCount
	public long byTimeCount(String from, String to, Pager pager)throws Exception;
}
