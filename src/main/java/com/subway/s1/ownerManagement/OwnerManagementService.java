package com.subway.s1.ownerManagement;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.subway.s1.util.Pager;


@Service
public class OwnerManagementService {

	@Autowired
	private OwnerManagementRepository ownerRepository;
	
	//가맹점 회원가입
	public int ownerJoin(OwnerManagementVO ownerVO)throws Exception{
		return ownerRepository.ownerJoin(ownerVO);
	}
	
	//가맹점 회원관리
	public List<OwnerManagementVO>ownerList(Pager pager) throws Exception{
		if(pager.getKind()==null||pager.getSearch()==null) {
			pager.setKind("id");
			pager.setSearch("S");
		}
		//pager
		pager.makeRow();
		long totalCount=ownerRepository.ownerCount(pager);
		pager.makePage(totalCount);
		return ownerRepository.ownerList(pager);
	}


	public OwnerManagementVO ownerSelectOne(OwnerManagementVO ownerVO) throws Exception{
		return ownerRepository.ownerSelectOne(ownerVO);
	}
}
