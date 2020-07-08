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
	
	
	 
	public List<CartVO> cartList(String id) throws Exception{
		List<CartVO> ar = cartRepository.cartList(id);
		if (ar != null) {
			for(CartVO cartVO : ar) {
				// 각 상품 번호에 해당하는 MenuNum으로 메뉴 정보(가격,이름 등등) 가져오기
				MenuVO menuVO = menuRepository.menuSelect(cartVO.getMenuNum());
				cartVO.setMenuVO(menuVO);
				List<CustomVO> customs = customRepository.customList(cartVO.getProductNum());
				
				// 샌드위치, 샐러드의 경우 커스텀 정보를 List로 가져오기
				if(customs != null) {
					for(CustomVO customVO : customs) {
					// 재료 이름, 가격등을 가져오기 위해서 IngredientVO를 가져온다
					IngredientVO ingreVO = ingredientRepository.ingreSelect(customVO.getIngreNum());
					customVO.setIngredientVO(ingreVO);
					}
				cartVO.setCustomVOs(customs);
				cartVO.setCustomPrice(ingredientRepository.getCustomPrice(cartVO.getProductNum()));
				}
			}
		}		
		return ar;
	}
	

	public int cartInsert(CartVO cartVO) throws Exception{
		return cartRepository.cartInsert(cartVO);
	}

	public CartVO cartSelect(String productNum) throws Exception{
		return cartRepository.cartSelect(productNum);
	}
	
	
	// cartSelect의 결과물에 해당하는 상세 정보 가져오기
	public List<CartVO> cartSelectDetail(List<CartVO> ar) throws Exception{

		if (ar != null) {
			for(CartVO cartVO : ar) {
				// 각 상품 번호에 해당하는 MenuNum으로 메뉴 정보(가격,이름 등등) 가져오기
				MenuVO menuVO = menuRepository.menuSelect(cartVO.getMenuNum());
				cartVO.setMenuVO(menuVO);
				List<CustomVO> customs = customRepository.customList(cartVO.getProductNum());
				
				// 샌드위치, 샐러드의 경우 커스텀 정보를 List로 가져오기
				if(customs != null) {
					for(CustomVO customVO : customs) {
					// 재료 이름, 가격등을 가져오기 위해서 IngredientVO를 가져온다
					IngredientVO ingreVO = ingredientRepository.ingreSelect(customVO.getIngreNum());
					customVO.setIngredientVO(ingreVO);
					}
				cartVO.setCustomVOs(customs);
				cartVO.setCustomPrice(ingredientRepository.getCustomPrice(cartVO.getProductNum()));
				}
			}
		}		
		return ar;	
	}
	
	
	public int cartDelete(String productNum) throws Exception{
		return cartRepository.cartDelete(productNum);
	}
	
	public int cartDeleteAll(String id) throws Exception{
		return cartRepository.cartDeleteAll(id);

	}
	
	public int cartUpdate(CartVO cartVO) throws Exception{
		return cartRepository.cartUpdate(cartVO);
	}

}

	
	
	


