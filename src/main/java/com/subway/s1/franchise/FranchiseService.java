package com.subway.s1.franchise;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FranchiseService {

	@Autowired
	private FranchiseRepository franchiseRepository;
	
	public int franchiseInsert(FranchiseVO franchiseVO) throws Exception{
		return franchiseRepository.franchiseInsert(franchiseVO);
	}
	
	public List<FranchiseVO> franchiseList() throws Exception{
		return franchiseRepository.franchiseList();
	}
	
	public int franchiseUpdate(int requestNum) throws Exception{
		return franchiseRepository.franchiseUpdate(requestNum);
	}
	
	public FranchiseVO franchiseSelect(int requestNum) throws Exception{
		return franchiseRepository.franchiseSelect(requestNum);
	}
}
