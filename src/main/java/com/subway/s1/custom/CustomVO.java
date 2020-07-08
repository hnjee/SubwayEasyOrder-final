package com.subway.s1.custom;

import com.subway.s1.ingredient.IngredientVO;
import lombok.Data;

@Data
public class CustomVO {

	private String productNum;
	private String ingreNum;
	private Integer breadSize;
	private Integer breadToasting;


	private IngredientVO ingredientVO;


}
