package com.subway.s1.ingredient.ingredientFile;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface IngredientFileRepository {

	public int ingredientRegister(IngredientFileVO ingredientFileVO) throws Exception;
	
	public int fileDelete(IngredientFileVO ingredientFileVO)throws Exception;
	
	public IngredientFileVO fileSelectOne(String ingreNum)throws Exception;

	public int deletes(List<String> ingreNums)throws Exception;
}
