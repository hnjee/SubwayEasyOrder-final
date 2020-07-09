package com.subway.s1.menuSoldout;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface MenuSoldoutRepository {
	
	//insert
	public int soldoutInsert(MenuSoldoutVO menuSoldoutVO)throws Exception;
	
	//delete
	public int soldoutDelete(MenuSoldoutVO menuSoldoutVO)throws Exception;
}
