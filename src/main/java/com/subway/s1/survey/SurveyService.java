package com.subway.s1.survey;

import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.subway.s1.util.Pager;

import com.subway.s1.payment.PaymentVO;

@Service
@Transactional(rollbackFor = Exception.class)
public class SurveyService {
	
	@Autowired
	private SurveyRepository surveyRepository;

	public List<SurveyVO> surveyList(String storeNum, String from, String to,Pager pager)throws Exception{
		//오늘날짜 만들기
				Calendar cal = Calendar.getInstance();
				int year = cal.get(Calendar.YEAR);
				int mon = cal.get(Calendar.MONTH)+1;
				int day = cal.get(Calendar.DAY_OF_MONTH);
				
				String yy = Integer.toString(year);
				String mm = Integer.toString(mon);
				
				if(mm.length() < 2) {
					mm = '0'+mm;
				}
				String dd = Integer.toString(day);
				String dd2 = Integer.toString(day+1);
				
				if(dd.length()<2 || dd2.length()<2) {
					dd = '0'+dd;
					dd2 = '0'+dd2;
				}
				
				String tfrom = yy+"-"+mm+"-"+dd;
				String tto = yy+"-"+mm+"-"+dd2;
				
				System.out.println("today"+tfrom);
				System.out.println("today11"+tto);
				if(from==null && to==null) {
					from = tfrom;
					to = tto;
				}else {
					//to 문자열의 끝에 day만 자르는 작업
					String ddd =  to.substring(8, 10);
					//자른 day를 숫자로 전환
					int ddd2 = Integer.parseInt(ddd);
					//to 문자열에 day빼고 앞부분 가져오기
					String main = to.substring(0, 8);
					//day를 숫자로 변환하여 1 더해주기
					System.out.println("mainnn: "+main);
					String to2 = Integer.toString(ddd2+1);
					//to2의 길이가 2보다 작을경우 앞에 0 붙여주기
					if(to2.length()<2) {
						to2 = '0'+to2;
					}
					//to에 최종날짜 합쳐서 넣기
					to = main+to2;
				}
				
				//Pager
				pager.makeRow();
				long totalCount = surveyRepository.totalCount(storeNum, from, to);
				pager.makePage(totalCount);
				
		return surveyRepository.surveyList(storeNum, from, to,pager);
	}


	public SurveyVO surveyMonthAVG(PaymentVO paymentVO)throws Exception{
		return surveyRepository.surveyMonthAVG(paymentVO);
	}

}
