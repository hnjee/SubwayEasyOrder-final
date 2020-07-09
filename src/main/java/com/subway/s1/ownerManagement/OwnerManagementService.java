package com.subway.s1.ownerManagement;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.subway.s1.member.MemberVO;
import com.subway.s1.util.Pager;


@Service
public class OwnerManagementService {

	@Autowired
	private OwnerManagementRepository ownerRepository;
	
	
	//가맹점 회원관리
	public List<OwnerManagementVO>ownerList(Pager pager) throws Exception{
		if(pager.getKind()==null||pager.getSearch()==null) {
			pager.setKind("storeNum");
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
	
	public int ownerDelete(OwnerManagementVO ownerVO) throws Exception{
		String ownerID="owner_"+ownerVO.getStoreNum();
		String staffID="staff_"+ownerVO.getStoreNum();
		int result=ownerRepository.ownerMemberDelete(ownerID);
		if(result>0) {
			System.out.println("owner삭제 성공");
		}else {
			System.out.println("오너 삭제 실패");
		}
		int result2=ownerRepository.ownerMemberDelete(staffID);
		if(result2>0) {
			System.out.println("스태프 삭제성공");
		}else{
			System.out.println("스태프 삭제 실패");
		}
		return ownerRepository.ownerDelete(ownerVO);
	}
	
	public int ownerDeletes(List<String> deletes) throws Exception{
		for(int i=0;i<deletes.size();i++) {
			System.out.println("str:"+deletes.get(i));
			String ownerID="owner_"+deletes.get(i);
			String staffID="staff_"+deletes.get(i);
			int result=ownerRepository.ownerMemberDelete(ownerID);
			int result2=ownerRepository.ownerMemberDelete(staffID);
		}
		return ownerRepository.ownerDeletes(deletes);
	}
	
	
	//가맹점 회원가입
//	public int ownerJoin(OwnerManagementVO ownerVO)throws Exception{
//		return ownerRepository.ownerJoin(ownerVO);
//	}
	
}//end class
