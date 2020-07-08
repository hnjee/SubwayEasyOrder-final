package com.subway.s1.soldout;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SoldoutService {
	@Autowired
	private SoldoutRepository soldoutRepository;
	
	public List<String> menuSoldout(String storeNum) throws Exception{
		return soldoutRepository.menuSoldout(storeNum);
	}
	public List<String> ingreSoldout(String storeNum) throws Exception{
		return soldoutRepository.ingreSoldout(storeNum);
	}
	
}
