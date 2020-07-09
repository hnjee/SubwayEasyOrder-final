package com.subway.s1.menuSoldout;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(rollbackFor = Exception.class)
public class MenuSoldoutService {
	
	@Autowired
	private MenuSoldoutRepository menuSoldoutRepository;

	//insert
	public int soldoutInsert(MenuSoldoutVO menuSoldoutVO, String storeNum)throws Exception{
		menuSoldoutVO.setStoreNum(storeNum);
		return menuSoldoutRepository.soldoutInsert(menuSoldoutVO);
	}
	
	//delete
	public int soldoutDelete(MenuSoldoutVO menuSoldoutVO,String storeNum)throws Exception{
		menuSoldoutVO.setStoreNum(storeNum);
		return menuSoldoutRepository.soldoutDelete(menuSoldoutVO);
	}
	
}
