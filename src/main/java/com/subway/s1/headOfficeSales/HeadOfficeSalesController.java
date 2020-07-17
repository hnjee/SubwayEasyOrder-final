package com.subway.s1.headOfficeSales;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.RequestMapping;


import org.springframework.web.servlet.ModelAndView;


import com.subway.s1.util.Pager;
import com.subway.s1.headOfficeSales.headChart.HeadChartService;
import com.subway.s1.member.MemberVO;
import com.subway.s1.sales.ByPeriodVO;
import com.subway.s1.sales.ByProductVO;
import com.subway.s1.sales.chart.ChartVO;
import com.subway.s1.sales.chart.PieChartVO;

@Controller
@RequestMapping("/headOfficeSales/**/")
public class HeadOfficeSalesController {
	
	@Autowired
	private HeadOfficeSalesService headOfficeSalesService;
	@Autowired
	private HeadChartService chartService;

	
	@GetMapping("chart2")
	public ModelAndView chart2()throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("headOfficeSales/chart2");
		return mv;
	}
	
	//index(차트홈)
	@GetMapping("chart")
	public ModelAndView chart(HttpSession session)throws Exception{

		String storeName = ((MemberVO)session.getAttribute("member")).getName();
		ModelAndView mv = new ModelAndView();
		List<ChartVO> ar=chartService.monthChart();
		List<ChartVO> ar2=chartService.timeChart();
		List<ChartVO> ar3=chartService.weekChart();
		List<ChartVO> ar4=chartService.yearChart();
		PieChartVO pieChartVO = chartService.pChart();
		
		mv.addObject("monthChart", ar);
		mv.addObject("timeChart", ar2);
		mv.addObject("weekChart", ar3);
		mv.addObject("yearChart", ar4);
		mv.addObject("storeName",storeName);
		mv.addObject("pChart", pieChartVO);

		//System.out.println("ar:"+ar.get(0).getTotalPrice());
		for(int i=0;i<ar2.size();i++) {
			System.out.println("ar2:"+ar2.get(i).getTime()+":"+ar2.get(i).getTotalPrice());
		}
		mv.setViewName("headOfficeSales/charts");
		return mv;
	}
	
	
	

	//ByProduct(상품별매출)
	@GetMapping("byProduct")
	public ModelAndView byProdut(String from, String to,Pager pager)throws Exception{

		ModelAndView mv = new ModelAndView();
		
		List<ByProductVO> ar = headOfficeSalesService.ByProduct(from, to, pager);
		ByProductVO vo = headOfficeSalesService.allMenu(from, to);
		mv.addObject("from", from);
		mv.addObject("to", to);
		mv.addObject("pager", pager);
		mv.addObject("byProduct", ar);
		mv.addObject("All", vo);
		mv.setViewName("headOfficeSales/byProduct");
		return mv;
	
	}


	//-------------------------sihyun--------------------------//

	//byDay(요일별)
	@GetMapping("byDay")
	public ModelAndView byDay(String from,String to,HttpSession session)throws Exception{
		String storeName = ((MemberVO)session.getAttribute("member")).getName();
		ModelAndView mv = new ModelAndView();
		List<ByPeriodVO>ar=headOfficeSalesService.byDay(from,to);
		mv.addObject("dayList", ar);
		System.out.println("요일별ar:"+ar);
		mv.addObject("from", from);
		mv.addObject("to", to);
		mv.addObject("storeName",storeName);
		mv.setViewName("headOfficeSales/byDay");
		return mv;
	}

	
	
	//byPeriod(기간별)
	@GetMapping("byPeriod")
	//@RequestParam(defaultValue="2020-06-24")
	public ModelAndView byPeriod(String from,String to,Pager pager,HttpSession session)throws Exception{
		String storeName = ((MemberVO)session.getAttribute("member")).getName();
		ModelAndView mv = new ModelAndView();
		System.out.println("controller");
		List<ByPeriodVO>ar=headOfficeSalesService.byPeriod(from, to,pager);
		mv.addObject("periodList", ar);
		mv.addObject("from", from);
		mv.addObject("to", to);
		mv.addObject("pager",pager);
		mv.addObject("storeName",storeName);
		mv.setViewName("headOfficeSales/byPeriod");
		return mv;
	}
	
	
	//byTime(시간별)
	@GetMapping("byTime")
	public ModelAndView byTime(String from,String to,Pager pager,HttpSession session)throws Exception{
		String storeName = ((MemberVO)session.getAttribute("member")).getName();
		ModelAndView mv = new ModelAndView();
		List<ByPeriodVO>ar=headOfficeSalesService.byTime(from, to,pager);
		mv.addObject("timeList", ar);
		mv.addObject("from", from);
		mv.addObject("to", to);
		mv.addObject("storeName",storeName);
		mv.setViewName("headOfficeSales/byTime");
		return mv;
	}

	
}//end class
