package com.subway.s1.ingredient;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.subway.s1.ingredient.ingreSoldout.IngreSoldoutVO;
import com.subway.s1.util.Pager;

@Repository
@Mapper
public interface IngredientRepository {

	
	public List<IngredientVO> ingreList() throws Exception;
	
	//SH
	public List<IngredientVO> headOfficeIngredientList(Pager pager)throws Exception;
	
	public int ingredientRegister(IngredientVO ingredientVO) throws Exception;
	
	public List<IngredientVO> ingredientList(Pager pager) throws Exception;
	
	public IngredientVO ingredientSelectOne(IngredientVO ingredientVO)throws Exception;
	
	public int ingredientUpdate(IngredientVO ingredientVO)throws Exception;
	
	public int ingredientSoldOut(IngredientVO ingredientVO)throws Exception;
	
	public int ingredientUnsold(IngredientVO ingredientVO)throws Exception;
	
	public int ingredientDelete(IngredientVO ingredientVO)throws Exception;

	public int deletes(List<String> deletes)throws Exception;

	public IngredientVO ingreSelect (String ingreNum) throws Exception;
	
	public Integer getCustomPrice(String productNum) throws Exception;

	public long ingredientCount(Pager pager)throws Exception;

	public List<IngreSoldoutVO> soldoutCheck(String storeNum)throws Exception;

}

