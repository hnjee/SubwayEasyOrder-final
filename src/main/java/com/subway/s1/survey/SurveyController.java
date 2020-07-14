package com.subway.s1.survey;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.subway.s1.member.MemberVO;
import com.subway.s1.store.StoreService;
import com.subway.s1.store.StoreVO;
import com.subway.s1.survey.chart.MonthVO;
import com.subway.s1.survey.chart.SurveyChartService;

@Controller
@RequestMapping("/survey/**/")
public class SurveyController {

	@Autowired
	private SurveyService surveyService;
	@Autowired
	private SurveyChartService surveyChartService;
	
	@GetMapping("chart")
	public ModelAndView chart(HttpSession session,String storeNum,String month)throws Exception{
		ModelAndView mv = new ModelAndView();
		storeNum = ((MemberVO)session.getAttribute("member")).getStoreNum();
		MemberVO memberVO = ((MemberVO)session.getAttribute("member"));
		List<MonthVO> surveyMonth =surveyChartService.surveyMonth(storeNum, month);
		for(int i=0;i<surveyMonth.size();i++) {
			surveyMonth.get(i).getKindness();
			surveyMonth.get(i).getHygiene();
			surveyMonth.get(i).getTaste();
			System.out.println("Kindness:"+i+":"+surveyMonth.get(i).getKindness());
			System.out.println("Hygiene:"+i+":"+surveyMonth.get(i).getHygiene());
			System.out.println("Taste():"+i+":"+surveyMonth.get(i).getTaste());
		}
		mv.addObject("surveyMonth", surveyMonth);
		mv.addObject("member", memberVO);
		mv.setViewName("survey/charts");
		return mv;
	}
}
