package com.subway.s1.point;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface PointRepository {
	public PointVO pointSelect(String id) throws Exception;
	public int pointInsert(PointVO pointVO) throws Exception;
}
