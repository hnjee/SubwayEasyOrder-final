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

@Controller
@RequestMapping("/survey/**/")
public class SurveyController {

	@Autowired
	private SurveyService surveyService;
	
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
}
