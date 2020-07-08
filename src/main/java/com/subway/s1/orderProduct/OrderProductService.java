package com.subway.s1.orderProduct;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.subway.s1.cart.CartVO;
import com.subway.s1.custom.CustomRepository;
import com.subway.s1.custom.CustomVO;
import com.subway.s1.ingredient.IngredientRepository;
import com.subway.s1.ingredient.IngredientVO;
import com.subway.s1.menu.MenuRepository;
import com.subway.s1.menu.MenuVO;

@Service
public class OrderProductService {
	
	@Autowired
	private OrderProductRepository orderProductRepository;
	@Autowired
	private MenuRepository menuRepository;
	@Autowired
	private CustomRepository customRepository;
	@Autowired
	private IngredientRepository ingredientRepository;
	
	
	
	public int orderProductInsert(CartVO cartVO) throws Exception {
		return orderProductRepository.orderProductInsert(cartVO);
	}
	
	public List<OrderProductVO> orderProductList(String payNum) throws Exception{
		List<OrderProductVO> ar =orderProductRepository.orderProductList(payNum);		
		
		
		return ar;
	};
	
}
