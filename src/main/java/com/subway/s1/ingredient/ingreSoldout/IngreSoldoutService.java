package com.subway.s1.ingredient.ingreSoldout;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(rollbackFor = Exception.class)
public class IngreSoldoutService {

	@Autowired
	private IngreSoldoutRepository ingreSoldoutRepository;
	//insert
	public int soldoutInsert(IngreSoldoutVO ingreSoldoutVO, String storeNum)throws Exception{
		ingreSoldoutVO.setStoreNum(storeNum);
		return ingreSoldoutRepository.soldoutInsert(ingreSoldoutVO);
	}
	
	//delete
	public int soldoutDelete(IngreSoldoutVO ingreSoldoutVO,String storeNum)throws Exception{
		ingreSoldoutVO.setStoreNum(storeNum);
		return ingreSoldoutRepository.soldoutDelete(ingreSoldoutVO);
	}
	
}
