package com.subway.s1.sales;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import java.lang.reflect.Member;
import java.sql.Date;
import java.time.LocalDate;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.format.annotation.DateTimeFormat;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.servlet.ModelAndView;

import com.subway.s1.member.MemberService;
import com.subway.s1.member.MemberVO;
import com.subway.s1.point.PointService;
import com.subway.s1.point.PointVO;

import com.subway.s1.util.Pager;
import com.subway.s1.sales.chart.ChartService;
import com.subway.s1.sales.chart.ChartVO;
import com.subway.s1.sales.chart.PieChartVO;
import com.subway.s1.store.StoreService;
import com.subway.s1.store.StoreVO;

@Controller
@RequestMapping("/sales/**/")
public class SalesController {
	
	@Autowired
	private SalesService salesService;
	@Autowired
	private ChartService chartService;
	@Autowired
	private PointService pointService; 
	@Autowired
	private StoreService storeService; 
	@Autowired
	private MemberService memberService;
	
	//index(차트홈)
	@GetMapping("chart")
	public ModelAndView chart(HttpSession session)throws Exception{
		MemberVO memberVO = ((MemberVO)session.getAttribute("member"));
		StoreVO storeVO = storeService.selectStore(memberVO.getId());
		ModelAndView mv = new ModelAndView();
		List<ChartVO> ar=chartService.monthChart(memberVO.getStoreNum());
		System.out.println("monthchart:"+ar);
		List<ChartVO> ar2=chartService.timeChart(memberVO.getStoreNum());
		List<ChartVO> ar3=chartService.weekChart(memberVO.getStoreNum());
		List<ChartVO> ar4=chartService.yearChart(memberVO.getStoreNum());
		PieChartVO pieChartVO = chartService.pChart(memberVO.getStoreNum());
		
		mv.addObject("monthChart", ar);
		mv.addObject("timeChart", ar2);
		mv.addObject("weekChart", ar3);
		mv.addObject("yearChart", ar4);
		mv.addObject("member", memberVO);
		mv.addObject("store", storeVO);
		mv.addObject("pChart", pieChartVO);

		
		mv.setViewName("sales/charts");
		return mv;
	}
	
	
	

	//ByProduct(상품별매출)
	@GetMapping("byProduct")
	public ModelAndView byProdut(String from, String to,Pager pager,HttpSession session)throws Exception{
	
		ModelAndView mv = new ModelAndView();
		MemberVO memberVO = ((MemberVO)session.getAttribute("member"));
		StoreVO storeVO = storeService.selectStore(memberVO.getId());
		List<ByProductVO> ar = salesService.ByProduct(from, to, pager,memberVO.getStoreNum());
		ByProductVO vo = salesService.allMenu(from, to, memberVO.getStoreNum());
		
		mv.addObject("from", from);
		mv.addObject("to", to);
		mv.addObject("pager", pager);
		mv.addObject("byProduct", ar);
		mv.addObject("All", vo);
		mv.addObject("store", storeVO);
		mv.setViewName("sales/byProduct");
		return mv;
	
	}

	
	//ByOrder(건별매출)
	@GetMapping("byOrder")
	public ModelAndView byOrder(String from, String to,Pager pager,String storeNum,HttpSession session)throws Exception{
		
		ModelAndView mv = new ModelAndView();
		MemberVO memberVO = ((MemberVO)session.getAttribute("member"));
		StoreVO storeVO = storeService.selectStore(memberVO.getId());
		List<ByOrderVO> ar = salesService.ByOrder(from, to, pager,memberVO.getStoreNum());
		
		mv.addObject("from", from);
		mv.addObject("to", to);
		mv.addObject("pager", pager);
		mv.addObject("byOrder", ar);
		mv.addObject("store", storeVO);
		mv.setViewName("sales/byOrder");
		return mv;
		
	}

	@PostMapping("byOrder")
	@ResponseBody
	public ByOrderVO byOrder(String payNum,String storeNum,HttpSession session)throws Exception{
		System.out.println("payNum : "+payNum);
		ByOrderVO byOrderVO = new ByOrderVO();
		storeNum = ((MemberVO)session.getAttribute("member")).getStoreNum();
		byOrderVO = salesService.modal(payNum,storeNum);
		
		return byOrderVO;
	}
	
	//환불
	@GetMapping("byRefund")
	@ResponseBody
	public int ByRefund(String payNum,String id,String totalPrice,HttpSession session)throws Exception{
		int re = 0;
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		
		int result = salesService.byRefund(payNum,memberVO.getStoreNum());
		PointVO pointVO = salesService.point(payNum);
		if(pointVO.getPointStat()==0) {
			int cur = pointVO.getCurPoint();
			pointVO = new PointVO();
			pointVO.setPayNum(payNum);
			pointVO.setId(id);
			pointVO.setCurPoint(+cur);
			int oriPoint = salesService.oriPoint(id);
			pointVO.setOriPoint(oriPoint);
			pointVO.setTotalPoint(oriPoint+cur);
			pointVO.setPointStat(2);
			int result2 = pointService.pointInsert(pointVO);
			if(result2 > 0) {
				System.out.println("사용된 포인트 복원");
			}
			
			//딜레이주기
			Thread.sleep(1000);
			
			pointVO = new PointVO();
			pointVO.setPayNum(payNum);
			pointVO.setId(id);
			int total = Integer.parseInt(totalPrice);
			pointVO.setCurPoint(-(int)(total*0.01));
			String pointStat = "2";
			int totalPoint = salesService.totalPoint(payNum,pointStat);
			pointVO.setOriPoint(totalPoint);
			pointVO.setTotalPoint(totalPoint-((int)(total*0.01)));
			pointVO.setPointStat(3);
			result2 = pointService.pointInsert(pointVO);
			pointStat = "3";
			int totalPoint2 = salesService.totalPoint(payNum,pointStat);
			String oriPoint2 = Integer.toString(totalPoint2);
			int result3 = salesService.pointUpdate(id, oriPoint2);
			if(result > 0 || result2 > 0 || result3 >0) {
				re = 1;
			}
			
		}else {
			pointVO = new PointVO();
			pointVO.setPayNum(payNum);
			pointVO.setId(id);
			int total = Integer.parseInt(totalPrice);
			pointVO.setCurPoint(-(int)(total*0.01));
			int oriPoint = salesService.oriPoint(id);
			pointVO.setOriPoint(oriPoint);
			pointVO.setTotalPoint(oriPoint-((int)(total*0.01)));
			pointVO.setPointStat(3);
			int result2 = pointService.pointInsert(pointVO);
			String pointStat = "3";
			int totalPoint2 = salesService.totalPoint(payNum,pointStat);
			String oriPoint2 = Integer.toString(totalPoint2);
			int result3 = salesService.pointUpdate(id, oriPoint2);
			if(result > 0 || result2 > 0 || result3 >0) {
				re = 1;
			}
			
		}
		
		return re;
	}


	//-------------------------sihyun--------------------------//

	//byDay(요일별)
	@GetMapping("byDay")
	public ModelAndView byDay(String from,String to,HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberVO memberVO = ((MemberVO)session.getAttribute("member"));
		StoreVO storeVO = storeService.selectStore(memberVO.getId());
	
		List<ByPeriodVO>ar=salesService.byDay(from,to,memberVO.getStoreNum());
		
		mv.addObject("dayList", ar);
		System.out.println("요일별ar:"+ar);
		mv.addObject("from", from);
		mv.addObject("to", to);
		mv.addObject("store", storeVO);
		mv.setViewName("sales/byDay");
		return mv;
	}

	
	
	//byPeriod(기간별)
	@GetMapping("byPeriod")
	//@RequestParam(defaultValue="2020-06-24")
	public ModelAndView byPeriod(String from,String to,Pager pager,HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberVO memberVO = ((MemberVO)session.getAttribute("member"));
		StoreVO storeVO = storeService.selectStore(memberVO.getId());
		System.out.println("byPeriod controller");
		List<ByPeriodVO>ar=salesService.byPeriod(from, to,pager,memberVO.getStoreNum());
		mv.addObject("periodList", ar);
		mv.addObject("from", from);
		mv.addObject("to", to);
		mv.addObject("pager",pager);
		mv.addObject("store", storeVO);
		mv.setViewName("sales/byPeriod");
		return mv;
	}
	
	
	//byTime(시간별)
	@GetMapping("byTime")
	public ModelAndView byTime(String from,String to,Pager pager,HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberVO memberVO = ((MemberVO)session.getAttribute("member"));
		StoreVO storeVO = storeService.selectStore(memberVO.getId());
		List<ByPeriodVO>ar=salesService.byTime(from, to,pager,memberVO.getStoreNum());
		mv.addObject("timeList", ar);
		mv.addObject("from", from);
		mv.addObject("to", to);
		mv.addObject("store", storeVO);
		mv.setViewName("sales/byTime");
		return mv;
	}

	
}//end class
