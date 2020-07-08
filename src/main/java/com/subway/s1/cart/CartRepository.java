package com.subway.s1.cart;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface CartRepository {
	
	public List<CartVO> cartList(String id) throws Exception;

	public int cartInsert(CartVO cartVO) throws Exception;
	public int cartUpdate(CartVO cartVO) throws Exception;
	public int cartDelete(String productNum) throws Exception;
	public int cartDeleteAll(String id) throws Exception;

	public CartVO cartSelect(String productNum) throws Exception;

}
