package com.subway.s1.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.subway.s1.custom.CustomRepository;
import com.subway.s1.custom.CustomVO;
import com.subway.s1.ingredient.IngredientRepository;
import com.subway.s1.ingredient.IngredientVO;
import com.subway.s1.menu.MenuRepository;
import com.subway.s1.menu.MenuVO;
import com.subway.s1.store.StoreRepository;
import com.subway.s1.store.StoreVO;

@Service
public class CartService {
	@Autowired
	private CartRepository cartRepository;
	@Autowired
	private MenuRepository menuRepository;
	@Autowired
	private CustomRepository customRepository;
	@Autowired
	private IngredientRepository ingredientRepository;
	
	public int cartInsert(CartVO cartVO) throws Exception{
		return cartRepository.cartInsert(cartVO);
	}


}

	
	
	


