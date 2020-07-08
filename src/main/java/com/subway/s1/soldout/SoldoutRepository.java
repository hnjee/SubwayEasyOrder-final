package com.subway.s1.soldout;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;


@Repository
@Mapper
public interface SoldoutRepository {
	public List<String> menuSoldout(String storeNum) throws Exception;
	public List<String> ingreSoldout(String storeNum) throws Exception;
}
