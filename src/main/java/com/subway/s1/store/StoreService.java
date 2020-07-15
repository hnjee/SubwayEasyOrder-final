package com.subway.s1.store;


import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.subway.s1.franchise.FranchiseVO;

@Service
public class StoreService {

	@Autowired
	private StoreRepository storeRepository;
	
	public List<StoreVO> storeList(String address) throws Exception{
		return storeRepository.storeList(address);
	}

	
	public StoreVO selectStore(String id) throws Exception {
		return storeRepository.selectStore(id);
	}
	
	public StoreVO findStoreNum(StoreVO storeVO)throws Exception{
		return storeRepository.findStoreNum(storeVO);
	}
	
	//Store Open/Close
	public int storeOC(StoreVO storeVO)throws Exception{
		if(storeVO.getOrderable() == 1) {
			storeVO.setOrderable(0);
		}else if(storeVO.getOrderable() == 0){
			storeVO.setOrderable(1);
		}
		return storeRepository.storeOC(storeVO);
	}
	
	public int storeInsert(FranchiseVO franchiseVO) throws Exception{
		return storeRepository.storeInsert(franchiseVO);
	}

	public int storeManage(StoreVO storeVO) throws Exception{
		return storeRepository.storeManage(storeVO);
	}
	public void scoreUpdate(StoreVO storeVO)throws Exception{
		storeRepository.scoreUpdate(storeVO);
	}

}
