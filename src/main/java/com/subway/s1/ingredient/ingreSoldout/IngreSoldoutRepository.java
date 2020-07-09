package com.subway.s1.ingredient.ingreSoldout;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface IngreSoldoutRepository {
	
	public int soldoutInsert(IngreSoldoutVO ingreSoldoutVO);

	public int soldoutDelete(IngreSoldoutVO ingreSoldoutVO);
}
