package com.subway.s1.custom;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.subway.s1.ingredient.IngredientRepository;
import com.subway.s1.ingredient.IngredientVO;

@Service
public class CustomService {

	@Autowired
	private CustomRepository customRepository;
	@Autowired
	private IngredientRepository ingredientRepository;


	public int customInsert (CustomVO customVO) throws Exception{
		return customRepository.customInsert(customVO);
	}
	
	public List<CustomVO> setIngreName(String productNum) throws Exception{
		List<CustomVO> ar = customRepository.customList(productNum);
		if (ar != null) {
			for(CustomVO customVO : ar) {
				IngredientVO ingredientVO = ingredientRepository.ingreSelect(customVO.getIngreNum());
				customVO.setIngredientVO(ingredientVO);
			}
		}
		return ar;
	}
	

}
