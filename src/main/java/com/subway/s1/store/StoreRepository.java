package com.subway.s1.store;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;


@Repository
@Mapper
public interface StoreRepository {
	public List<StoreVO> storeList(String address) throws Exception;
	
	public StoreVO selectStore(String id) throws Exception; 

	public StoreVO findStoreNum(StoreVO storeVO)throws Exception;
}
