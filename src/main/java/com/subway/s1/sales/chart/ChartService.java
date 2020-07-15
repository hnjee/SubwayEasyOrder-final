package com.subway.s1.sales.chart;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(rollbackFor = Exception.class) // 예외처리
public class ChartService {
	@Autowired
	private ChartRepository chartRepository;
	
	public List<ChartVO> monthChart(String storeNum) throws Exception	{
		return chartRepository.monthChart(storeNum);
	}
	
	public List<ChartVO> timeChart(String storeNum) throws Exception{
		return chartRepository.timeChart(storeNum);
	}
	
	public List<ChartVO> weekChart(String storeNum) throws Exception{
		return chartRepository.weekChart(storeNum);
	}
	
	public List<ChartVO> yearChart(String storeNum) throws Exception{
		return chartRepository.yearChart(storeNum);
	}
	
	public PieChartVO pChart(String storeNum)throws Exception{
		
		Long swCount = chartRepository.menuCount("SW",storeNum);
		Long wrCount = chartRepository.menuCount("WR",storeNum);
		Long siCount = chartRepository.menuCount("SI",storeNum);
		Long saCount = chartRepository.menuCount("SA",storeNum);
		Long grCount = chartRepository.menuCount("GR",storeNum);
		
		PieChartVO pieChartVO = new PieChartVO();
		
		pieChartVO.setSwCount(swCount);
		pieChartVO.setSiCount(siCount);
		pieChartVO.setSaCount(saCount);
		pieChartVO.setWrCount(wrCount);
		pieChartVO.setGrCount(grCount);		
		
		double sw = pieChartVO.getSwCount();
		double si = pieChartVO.getSiCount();
		double sa = pieChartVO.getSaCount();
		double wr = pieChartVO.getWrCount();
		double gr = pieChartVO.getGrCount();

		
		//전체값 구하기
		Long total = swCount+wrCount+siCount+saCount+grCount;
		System.out.println(total);
		//메뉴별 백분율 구하기
		double swResult = Double.parseDouble(String.format("%.2f", sw*100/total));
		double wrResult = Double.parseDouble(String.format("%.2f", wr*100/total));
		double siResult = Double.parseDouble(String.format("%.2f", si*100/total));
		double saResult = Double.parseDouble(String.format("%.2f", sa*100/total));
		double grResult = Double.parseDouble(String.format("%.2f", gr*100/total));
		
		//반올림
		swResult = Math.round(swResult);
		wrResult = Math.round(wrResult);
		siResult = Math.round(siResult);
		saResult = Math.round(saResult);
		grResult = Math.round(grResult);

		pieChartVO.setSwPercent((int)swResult);
		pieChartVO.setSiPercent((int)siResult);
		pieChartVO.setSaPercent((int)saResult);
		pieChartVO.setWrPercent((int)wrResult);
		pieChartVO.setGrPercent((int)grResult);

	
		return pieChartVO;
	}
	
}//end class
