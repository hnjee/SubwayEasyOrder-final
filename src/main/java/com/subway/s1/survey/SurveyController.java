package com.subway.s1.survey;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/survey/**/")
public class SurveyController {

	@Autowired
	private SurveyService surveyService;
	
	
}
