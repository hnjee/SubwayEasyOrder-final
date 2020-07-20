package com.subway.s1.sales;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.subway.s1.cart.CartVO;
import com.subway.s1.point.PointVO;
import com.subway.s1.util.Pager;

@Repository 
@Mapper
public interface SalesRepository {

	//ByProductVO
	public List<ByProductVO> getByProduct(String from, String to, Pager pager,String storeNum)throws Exception;
	
	//getMenuCount
	public String getMenuCount(String menuNum, String storeNum,String from, String to)throws Exception;
	
	//getMenuPrice
	public String getMenuPrice(String menuNum, String storeNum,String from, String to)throws Exception;
	
	//getAllMenuCount
	public String getAllMenuCount(String storeNum, String from, String to)throws Exception;
		
	//getAllMenuPrice
	public String getAllMenuPrice(String storeNum, String from, String to)throws Exception;
	
	//ByOrderVO
	public List<ByOrderVO> getByOrder(String from, String to, Pager pager,String storeNum)throws Exception;
	
	//getModal
	public ByOrderVO getModal(String payNum,String storeNum)throws Exception;
	
	//byOrder totalCount
	public long getOrderTotal(Pager pager, String from, String to,String storeNum)throws Exception;

	//byRefund update
	public int byRefund(String payNum,String storeNum)throws Exception;
	
	//byRefund-아이디 별 oriPoint 검색
	public int oriPoint(String id)throws Exception;
	
	//byRefund-주문 별 totalPoint 검색
	public int totalPoint(String payNum, String pointStat)throws Exception;
	
	public int pointUpdate(String id, String oriPoint)throws Exception;
	
	//byRefund-주문번호 별 Point 검색
	public PointVO point(String payNum)throws Exception;	
	
	//byProduct totalCount
	public long getProductTotal(Pager pager, String from, String to,String storeNum)throws Exception;

	//byDay
	public List<ByPeriodVO> byDay(String from, String to,String storeNum)throws Exception;

	//byPeriod
	public List<ByPeriodVO> byPeriod(String from, String to, Pager pager,String storeNum)throws Exception;
	
	//byTime
	public List<ByPeriodVO> byTime(String from, String to,Pager pager,String storeNum)throws Exception;
	
	//byPeriodCount
	public long byPeriodCount(String from, String to, Pager pager,String storeNum)throws Exception;

	// 결제 완료 시 Sales 테이블에 insert
	public int salesInsert(CartVO cartVO ) throws Exception;
	
	//byTimeCount
	public long byTimeCount(String from, String to, Pager pager,String storeNum)throws Exception;

}
