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
	//--------------------------막대--------------------------------------------------
	
	//thisBar
	public List<BarVO> thisBar(String storeNum)throws Exception{
		List<BarVO> ar= surveyChartRepository.thisBar(storeNum);
		return ar;
	}
	//totalBar
	public List<BarVO> totalBar(String storeNum)throws Exception{
		List<BarVO> ar= surveyChartRepository.thisBar(storeNum);
		for(int i=0;i<ar.size();i++) {

			int taste=ar.get(i).getTaste();
			int hygiene =ar.get(i).getHygiene();
			int kindness =ar.get(i).getKindness();
		

			
			int total=taste+hygiene+kindness;
			total=(total/3);
			ar.get(i).setTotal(total);

		}
		return ar;
	}
	
	
	//-----------------------------꺽은선-----------------------------------------------
	//month 
	public List<MonthVO> surveyMonth(String storeNum,String month)throws Exception{
		
		List<MonthVO> ar= surveyChartRepository.surveyMonth(storeNum,month);
		
		for(int i=0;i<ar.size();i++) {
			month=ar.get(i).getPayDate();
			int taste=ar.get(i).getTaste();
			int monthCount=surveyChartRepository.monthCount(storeNum, month);
			System.out.println("month"+month);
			System.out.println("monthCount:"+monthCount);
			taste=(taste/monthCount);
			ar.get(i).setTaste(taste);
			System.out.println("taste:"+ar.get(i).getTaste());
			System.out.println("taste+"+i +":"+taste);
			//확인끝
			int hygiene =ar.get(i).getHygiene();
			hygiene=(hygiene/monthCount);
			ar.get(i).setHygiene(hygiene);
			
			int kindness =ar.get(i).getKindness();
			kindness=(kindness/monthCount);
			ar.get(i).setKindness(kindness);

		}

		return ar;
	}
	
	//monthTotal
	public List<MonthVO> monthTotal(String storeNum,String month)throws Exception{
		
		List<MonthVO> ar= surveyChartRepository.surveyMonth(storeNum,month);
		
		for(int i=0;i<ar.size();i++) {
			month=ar.get(i).getPayDate();
			int monthCount=surveyChartRepository.monthCount(storeNum, month);
			
			int taste=ar.get(i).getTaste();
			taste=(taste/monthCount);
			ar.get(i).setTaste(taste);
			
			//확인끝
			int hygiene =ar.get(i).getHygiene();
			hygiene=(hygiene/monthCount);
			ar.get(i).setHygiene(hygiene);
			
			int kindness =ar.get(i).getKindness();
			kindness=(kindness/monthCount);
			ar.get(i).setKindness(kindness);
			
			int totalScore=taste+hygiene+kindness;
			totalScore=(totalScore/3);
			ar.get(i).setTotalScore(totalScore);

		}

		return ar;
	}
	
	//year
	public List<YearVO> surveyYear(String storeNum,String year)throws Exception{
		
		List<YearVO> ar= surveyChartRepository.surveyYear(storeNum, year);
		
		for(int i=0;i<ar.size();i++) {
			year=ar.get(i).getPayDate();
			int yearCount=surveyChartRepository.yearCount(storeNum, year);
			
			int taste=ar.get(i).getTaste();
			taste=(taste/yearCount);
			ar.get(i).setTaste(taste);
			
			int hygiene =ar.get(i).getHygiene();
			hygiene=(hygiene/yearCount);
			ar.get(i).setHygiene(hygiene);
			
			int kindness =ar.get(i).getKindness();
			kindness=(kindness/yearCount);
			ar.get(i).setKindness(kindness);

		}

		return ar;
	}
	

}
