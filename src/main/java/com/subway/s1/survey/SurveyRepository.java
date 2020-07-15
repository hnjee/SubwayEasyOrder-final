package com.subway.s1.survey;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.subway.s1.payment.PaymentVO;

@Repository
@Mapper
public interface SurveyRepository {
	public SurveyVO surveyMonthAVG(PaymentVO paymentVO)throws Exception;
}	
