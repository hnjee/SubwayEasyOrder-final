package com.subway.s1.ingredient;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;


@Service
@Transactional(rollbackFor = Exception.class)
public class IngredientService {
	@Autowired
	private IngredientRepository ingredientRepository;
	
	
	public List<IngredientVO> ingreList() throws Exception{
		return ingredientRepository.ingreList();
	}
	
	
	
}
