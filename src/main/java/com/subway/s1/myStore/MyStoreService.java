package com.subway.s1.myStore;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MyStoreService {
	
	@Autowired
	private MyStoreRepository myStoreRepository;
	
	public List<MyStoreVO> myStoreList(String id) throws Exception{
		return myStoreRepository.myStoreList(id);
	}
	
	public List<String> myStoreNumList(String id) throws Exception{
		return myStoreRepository.myStoreNumList(id);
	}
	
	public int myStoreDelete(MyStoreVO vo) throws Exception{
		return myStoreRepository.myStoreDelete(vo);
	}
	
	public int myStoreInsert(MyStoreVO vo) throws Exception{
		return myStoreRepository.myStoreInsert(vo);
	}
}

	
	
	


