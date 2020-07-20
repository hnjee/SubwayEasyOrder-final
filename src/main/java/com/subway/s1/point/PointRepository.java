package com.subway.s1.point;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.subway.s1.survey.SurveyVO;

@Repository
@Mapper
public interface PointRepository {
	public PointVO pointSelect(String id) throws Exception;
	public int pointInsert(PointVO pointVO) throws Exception;
}
