package com.subway.s1.headOfficeSales.headChart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.subway.s1.sales.chart.ChartVO;
import com.subway.s1.sales.chart.PieChartVO;

@Service
@Transactional(rollbackFor = Exception.class) // 예외처리
public class HeadChartService {
	@Autowired
	private HeadChartRepository chartRepository;
	
	public List<ChartVO> monthChart() throws Exception	{
		return chartRepository.monthChart();
	}
	
	public List<ChartVO> timeChart() throws Exception{
		return chartRepository.timeChart();
	}
	
	public List<ChartVO> weekChart() throws Exception{
		return chartRepository.weekChart();
	}
	
	public List<ChartVO> yearChart() throws Exception{
		return chartRepository.yearChart();
	}
	
	public PieChartVO pChart()throws Exception{
		Long swCount = chartRepository.menuCount("SW");
		Long wrCount = chartRepository.menuCount("WR");
		Long siCount = chartRepository.menuCount("SI");
		Long saCount = chartRepository.menuCount("SA");
		Long grCount = chartRepository.menuCount("GR");
		
		System.out.println(swCount);
		System.out.println(wrCount);
		System.out.println(siCount);
		System.out.println(saCount);
		System.out.println(grCount);
		
		PieChartVO pieChartVO = new PieChartVO();
		
		pieChartVO.setSwCount(swCount);
		pieChartVO.setSiCount(siCount);
		pieChartVO.setSaCount(saCount);
		pieChartVO.setWrCount(wrCount);
		pieChartVO.setGrCount(grCount);
		
		
		//전체값 구하기
		Long total = swCount+wrCount+siCount+saCount+grCount;
		System.out.println(total);
		//메뉴별 백분율 구하기
		Long swResult = swCount*100/total;
		System.out.println(swResult);
		Long wrResult = wrCount*100/total;
		Long siResult = siCount*100/total;
		Long saResult = saCount*100/total;
		Long grResult = grCount*100/total;

		pieChartVO.setSwPercent(swResult);
		pieChartVO.setSiPercent(siResult);
		pieChartVO.setSaPercent(saResult);
		pieChartVO.setWrPercent(wrResult);
		pieChartVO.setGrPercent(grResult);

	
		return pieChartVO;
	}
	
	
//	public List<ChartVO> timeChart() throws Exception{
//		List<ChartVO> re= new ArrayList<>();
//		List<ChartVO> re2 = new ArrayList<>();
//		List<ChartVO>ar=chartRepository.timeChart();
//		String time="";
//		String str="";
//		String str2="";
//		Calendar ca = Calendar.getInstance();
//		String y = ca.get(Calendar.YEAR)+"";
//		String m =ca.get(Calendar.MONTH)+1+"";
//		if(m.length()<2) {
//			m=0+m;
//		}
//		m=y+"-"+m;
//		for(int i=0;i<ar.size();i++) {
//			time=ar.get(i).getTime();
//			str =time.substring(0, 7);
//			str2 =time.substring(11, 13);
//			if(str.equals(m)) {
//				re.add(ar.get(i));			
//				System.out.println("str2:"+str2);
//			}
//			
//		}//end for문
//		return re;
//	}
	
	
	

}//end class
