package com.subway.s1.custom;


import java.util.List;


import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface CustomRepository {

	public int customInsert (CustomVO customVO) throws Exception;
	
	public List<CustomVO> customList(String productNum) throws Exception;
	
	

}
