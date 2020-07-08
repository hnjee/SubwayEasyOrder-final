package com.subway.s1.myStore;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface MyStoreRepository {
	public List<MyStoreVO> myStoreList(String id) throws Exception;
	public List<String> myStoreNumList(String id) throws Exception;
	public int myStoreDelete(MyStoreVO vo) throws Exception;
	public int myStoreInsert(MyStoreVO vo) throws Exception;
}
