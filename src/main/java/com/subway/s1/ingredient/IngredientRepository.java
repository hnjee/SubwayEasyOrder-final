package com.subway.s1.ingredient;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface IngredientRepository {

	public List<IngredientVO> ingreList() throws Exception;
	

	public int ingredientRegister(IngredientVO ingredientVO) throws Exception;
	
	public List<IngredientVO> ingredientList(IngredientVO ingredientVO) throws Exception;
	
	public IngredientVO ingredientSelectOne(IngredientVO ingredientVO)throws Exception;
	
	public int ingredientUpdate(IngredientVO ingredientVO)throws Exception;
	
	public int ingredientDelete(IngredientVO ingredientVO)throws Exception;

	
	public int deletes(List<String> deletes)throws Exception;


	public IngredientVO ingreSelect (String ingreNum) throws Exception;
	
	public Integer getCustomPrice(String productNum) throws Exception;

}

