package com.subway.s1.survey;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.subway.s1.util.Pager;

@Repository
@Mapper
public interface SurveyRepository {
	
	public List<SurveyVO> surveyList(String storeNum, String from, String to,Pager pager)throws Exception;

	public Long totalCount(String storeNum, String from, String to)throws Exception;
}
