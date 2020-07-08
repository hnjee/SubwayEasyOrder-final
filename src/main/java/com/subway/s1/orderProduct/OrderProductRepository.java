package com.subway.s1.orderProduct;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.subway.s1.cart.CartVO;

@Repository
@Mapper
public interface OrderProductRepository {
	
	public int orderProductInsert(CartVO cartVO);
	public List<OrderProductVO> orderProductList(String payNum);

}
