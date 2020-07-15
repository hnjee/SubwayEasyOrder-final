package com.subway.s1.ownerManagement;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.subway.s1.util.Pager;

@Repository
@Mapper
public interface OwnerManagementRepository {
	//public int ownerJoin(OwnerManagementVO ownerVO)throws Exception;
	
	public List<OwnerManagementVO> ownerList(Pager pager)throws Exception;
	
	public List<OwnerManagementVO> bestList (Pager pager)throws Exception;

	public List<OwnerManagementVO> worstList(Pager pager)throws Exception;
	
	public long ownerCount(Pager pager) throws Exception;
	
	public OwnerManagementVO ownerSelectOne(OwnerManagementVO ownerVO)throws Exception;

	public int ownerDelete(OwnerManagementVO ownerVO) throws Exception;
	
	public int ownerDeletes(List<String> deletes)throws Exception;
	
	public int ownerMemberDelete(String id)throws Exception;
	
	public int bestRest(OwnerManagementVO ownerVO) throws Exception;
	
	public int bestPick(List<String> pick)throws Exception;
	
	public int storeScore(OwnerManagementVO ownerVO)throws Exception;
	
}
