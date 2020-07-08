package com.subway.s1.point;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PointService {

	@Autowired
	private PointRepository pointRepository;
	
	public PointVO pointSelect (String id) throws Exception{
		return pointRepository.pointSelect(id);
	}
	
	public int pointInsert(PointVO pointVO) throws Exception{
		return pointRepository.pointInsert(pointVO);
	}
	
	
}
