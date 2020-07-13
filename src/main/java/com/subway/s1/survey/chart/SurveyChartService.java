package com.subway.s1.survey.chart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(rollbackFor = Exception.class)
public class SurveyChartService {
	
	@Autowired
	private SurveyChartRepository surveyChartRepository;

}
