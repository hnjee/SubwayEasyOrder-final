package com.subway.s1.survey;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.subway.s1.member.MemberVO;

import com.subway.s1.util.Pager;

import com.subway.s1.survey.chart.BarVO;
import com.subway.s1.survey.chart.MonthVO;
import com.subway.s1.survey.chart.SurveyChartService;
import com.subway.s1.survey.chart.YearVO;


@Controller
@RequestMapping("/survey/**/")
public class SurveyController {

	@Autowired
	private SurveyService surveyService;
	@Autowired
	private SurveyChartService surveyChartService;

	//List
	@GetMapping("surveyList")
	public ModelAndView surveyList(HttpSession session, String from, String to,Pager pager)throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		List<SurveyVO> ar = surveyService.surveyList(memberVO.getStoreNum(),from,to,pager);
		mv.addObject("pager", pager);
		mv.addObject("from", from);
		mv.addObject("to", to);
		mv.addObject("survey", ar);
		mv.setViewName("survey/surveyList");	
		return mv;
	}

	@GetMapping("chart")
	public ModelAndView chart(HttpSession session,String storeNum,String month,String year)throws Exception{
		ModelAndView mv = new ModelAndView();
		storeNum = ((MemberVO)session.getAttribute("member")).getStoreNum();
		MemberVO memberVO = ((MemberVO)session.getAttribute("member"));
		List<MonthVO> surveyMonth =surveyChartService.surveyMonth(storeNum, month);
		List<YearVO> surveyYear=surveyChartService.surveyYear(storeNum, year);
		List<MonthVO> monthTotal =surveyChartService.monthTotal(storeNum, month);
		List<BarVO> thisBar =surveyChartService.thisBar(storeNum);
		List<BarVO> totalBar=surveyChartService.totalBar(storeNum);
		
		for(int i=0;i<surveyMonth.size();i++) {
			surveyMonth.get(i).getKindness();
			surveyMonth.get(i).getHygiene();
			surveyMonth.get(i).getTaste();
		}
		mv.addObject("totalBar", totalBar);
		mv.addObject("thisBar", thisBar);
		mv.addObject("surveyMonth", surveyMonth);
		mv.addObject("surveyYear", surveyYear);
		mv.addObject("monthTotal", monthTotal);
		mv.addObject("member", memberVO);
		mv.setViewName("survey/charts");
		return mv;
	}
}
