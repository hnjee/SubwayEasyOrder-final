package com.subway.s2;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.UUID;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.subway.s1.cart.CartService;
import com.subway.s1.cart.CartVO;
import com.subway.s1.orderProduct.OrderProductService;
import com.subway.s1.payment.PaymentService;
import com.subway.s1.payment.PaymentVO;
import com.subway.s1.sales.SalesService;
import com.subway.s1.sales.SalesVO;
import com.subway.s1.store.StoreVO;



@SpringBootTest
public class dataTest {

	@Autowired
	private PaymentService paymentService;

	@Autowired
	private SalesService salesService;
	@Autowired
	private OrderProductService orderProductService; 
	@Autowired
	private CartService cartService;
	

	
	@Test
	public void paymentTest()throws Exception{
		

		
		for(int i=0;i<100;i++) {
			PaymentVO paymentVO = new PaymentVO();
			SalesVO salesVO = new SalesVO();
			CartVO cartVO  = new CartVO();
			StoreVO storeVO = new StoreVO();
			String payNum = UUID.randomUUID().toString();
			payNum = payNum.substring(0,8);
			storeVO.setStoreNum("S01");
			storeVO.setStoreNum("S02");
			storeVO.setStoreNum("S03");
			storeVO.setStoreNum("S04");
			storeVO.setStoreNum("S05");
			storeVO.setStoreNum("S06");
			storeVO.setStoreNum("S07");
			storeVO.setStoreNum("S08");
			storeVO.setStoreNum("S09");
			storeVO.setStoreNum("S10");
			storeVO.setStoreNum("S11");
			storeVO.setStoreNum("S12");
			
			
			paymentVO.setId("kiki");
			paymentVO.setPayNum(payNum);
			paymentVO.setTotalPrice(3400);
			paymentVO.setStoreNum("S09");
			paymentVO.setOrderInfo(3);
			int result = paymentService.paymentInsert(paymentVO);
			assertEquals(1, result);
			
		
			cartVO = cartService.cartSelect("P1594605655994");
			cartVO.setPayNum(payNum);
			
			
//			cartVO.setId("kiki");
//			cartVO.setMenuNum("M13");
			cartVO.setProductNum(cartVO.getProductNum());
//			cartVO.setProductPrice(5900);
//			cartVO.setProductCount(1);
//			cartVO.setSetting(null);
			int result2 = orderProductService.orderProductInsert(cartVO);
			assertEquals(1, result2);
			
			salesVO.setPayNum(payNum);
			
			
		}
	}
}
