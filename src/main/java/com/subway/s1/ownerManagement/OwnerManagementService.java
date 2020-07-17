package com.subway.s1.ownerManagement;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.subway.s1.member.MemberVO;
import com.subway.s1.survey.chart.MonthVO;
import com.subway.s1.survey.chart.SurveyChartService;
import com.subway.s1.util.Pager;


@Service
public class OwnerManagementService {

	@Autowired
	private OwnerManagementRepository ownerRepository;
	@Autowired
	private SurveyChartService surveyChartService;
	
	
	//가맹점 회원관리 ownerList
	public List<OwnerManagementVO>ownerList(Pager pager) throws Exception{
		//pager
		if(pager.getKind()==null||pager.getSearch()==null) {
			pager.setKind("storeNum");
			pager.setSearch("S");
		}		
		pager.makeRow();
		long totalCount=ownerRepository.ownerCount(pager);
		pager.makePage(totalCount);
		
		List<OwnerManagementVO> ar=ownerRepository.ownerList(pager);

//		for(int i=0;i<ar.size();i++) {
//			System.out.println(ar.get(i).getStoreNum());
//			List<MonthVO>ar2= surveyChartService.thisMonthScore(ar.get(i).getStoreNum());
//			if(ar2.size()>0) {
//			ar.get(i).setStoreScore(ar2.get(0).getTotalScore());
//			}else {
//				ar.get(i).setStoreScore(0);
//			}
//		}	
		return ar;
	}
	//best List
	public List<OwnerManagementVO> bestList(Pager pager) throws Exception{
		//pager
		if(pager.getKind()==null||pager.getSearch()==null) {
			pager.setKind("storeNum");
			pager.setSearch("S");
		}		
		pager.makeRow();
		long totalCount=ownerRepository.ownerCount(pager);
		pager.makePage(totalCount);
		
		List<OwnerManagementVO> ar=ownerRepository.bestList(pager);

//		for(int i=0;i<ar.size();i++) {
//			List<MonthVO>ar2= surveyChartService.thisMonthScore(ar.get(i).getStoreNum());
//			if(ar2.size()>0) {
//			ar.get(i).setStoreScore( ar2.get(0).getTotalScore());
//			
//			}else {
//				ar.get(i).setStoreScore(0);
//			}
//		}		
		return ar;
	}
	//worstList
	public List<OwnerManagementVO> worstList(Pager pager) throws Exception{
		//pager
		if(pager.getKind()==null||pager.getSearch()==null) {
			pager.setKind("storeNum");
			pager.setSearch("S");
		}		
		pager.makeRow();
		long totalCount=ownerRepository.ownerCount(pager);
		pager.makePage(totalCount);
		
		List<OwnerManagementVO> ar=ownerRepository.worstList(pager);

//		for(int i=0;i<ar.size();i++) {
//			List<MonthVO>ar2= surveyChartService.thisMonthScore(ar.get(i).getStoreNum());
//			if(ar2.size()>0) {
//			ar.get(i).setStoreScore( ar2.get(0).getTotalScore());
//			
//			}else {
//				ar.get(i).setStoreScore(0);
//			}
//		}		
		return ar;
	}
	public OwnerManagementVO ownerSelectOne(OwnerManagementVO ownerVO) throws Exception{
		return ownerRepository.ownerSelectOne(ownerVO);
	}
	
	public int ownerDelete(String storeNum) throws Exception{
		String ownerID="owner_"+storeNum;
		System.out.println("ownerID:"+ownerID);
		String staffID="staff_"+storeNum;
		System.out.println("staffID:"+staffID);
		ownerRepository.ownerMemberDelete(ownerID);
		ownerRepository.ownerMemberDelete(staffID);
		return ownerRepository.ownerDelete(storeNum);
	}
	
	public int ownerDeletes(List<String> deletes) throws Exception{
		for(int i=0;i<deletes.size();i++) {
			System.out.println("str:"+deletes.get(i));
			String ownerID="owner_"+deletes.get(i);
			String staffID="staff_"+deletes.get(i);
			ownerRepository.ownerMemberDelete(ownerID);
			ownerRepository.ownerMemberDelete(staffID);
		}
		return ownerRepository.ownerDeletes(deletes);
	}
	
	public int bestRest(OwnerManagementVO ownerVO) throws Exception{
		return ownerRepository.bestRest(ownerVO);
	}
	
	public int bestPick(List<String> pick) throws Exception{
		return ownerRepository.bestPick(pick);
	}
	
	//가맹점 회원가입
//	public int ownerJoin(OwnerManagementVO ownerVO)throws Exception{
//		return ownerRepository.ownerJoin(ownerVO);
//	}
	
}//end class
