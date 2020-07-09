package com.subway.s1.ingredient;

import java.util.List;

import com.subway.s1.ingredient.ingreSoldout.IngreSoldoutVO;
import com.subway.s1.ingredient.ingredientFile.IngredientFileVO;

import lombok.Data;

@Data
public class IngredientVO {

	private String ingreNum;
	private String ingreCode;
	private String name;
	private int price;
	private int sale;
	
	private int sell;
	private List<IngredientFileVO> fileVOs;


}
