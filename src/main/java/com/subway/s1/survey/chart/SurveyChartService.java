package com.subway.s1.survey.chart;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.subway.s1.member.MemberVO;

@Service
@Transactional(rollbackFor = Exception.class)
public class SurveyChartService {
	
	@Autowired
	private SurveyChartRepository surveyChartRepository;
	
	public List<MonthVO> surveyMonth(String storeNum,String month)throws Exception{
		MonthVO monthVO = new MonthVO();
		List<MonthVO> ar= surveyChartRepository.surveyMonth(storeNum,month);
		
		for(int i=0;i<ar.size();i++) {
			month=ar.get(i).getPayDate();
			int taste=ar.get(i).getTaste();
			int monthCount=surveyChartRepository.monthCount(storeNum, month);
			System.out.println("month"+month);
			System.out.println("monthCount:"+monthCount);
			taste=(taste/monthCount);
			monthVO.setTaste(taste);
			System.out.println("taste:"+ar.get(i).getTaste());
			System.out.println("taste+"+i +":"+taste);
			System.out.println("mothVO: "+monthVO.getTaste());
			//확인끝
			int hygiene =ar.get(i).getHygiene();
			hygiene=(hygiene/monthCount);
			
			int kindness =ar.get(i).getKindness();
			kindness=(kindness/monthCount);
			
			
			
		}

		return ar;
	}

}
