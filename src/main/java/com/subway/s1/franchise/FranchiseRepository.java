package com.subway.s1.franchise;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface FranchiseRepository {
	
	public int franchiseInsert(FranchiseVO franchiseVO) throws Exception;
	public List<FranchiseVO> franchiseList() throws Exception;
	public int franchiseUpdate(int requestNum) throws Exception;
	public FranchiseVO franchiseSelect(int requestNum) throws Exception;
	
}
