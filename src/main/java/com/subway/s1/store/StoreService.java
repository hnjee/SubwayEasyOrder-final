package com.subway.s1.store;


import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class StoreService {

	@Autowired
	private StoreRepository storeRepository;
	
	
	public StoreVO selectStore(String id) throws Exception {
		return storeRepository.selectStore(id);
	}
	
}
