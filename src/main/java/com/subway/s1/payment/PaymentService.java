package com.subway.s1.payment;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.subway.s1.custom.CustomRepository;
import com.subway.s1.custom.CustomVO;
import com.subway.s1.ingredient.IngredientRepository;
import com.subway.s1.ingredient.IngredientVO;
import com.subway.s1.member.MemberVO;
import com.subway.s1.menu.MenuRepository;
import com.subway.s1.menu.MenuVO;
import com.subway.s1.orderProduct.OrderProductRepository;
import com.subway.s1.orderProduct.OrderProductVO;
import com.subway.s1.util.Pager;
import com.subway.s1.util.PagerOrderList;

@Service
public class PaymentService {
	
	@Autowired
	private PaymentRepository paymentRepository;
	@Autowired
	private OrderProductRepository orderProductRepository;
	@Autowired
	private MenuRepository menuRepository;
	@Autowired
	private CustomRepository customRepository;
	@Autowired
	private IngredientRepository ingredientRepository;
	
	
	
	public int paymentInsert(PaymentVO paymentVO) throws Exception{
		return paymentRepository.paymentInsert(paymentVO);
	}
	
	
	public List<PaymentVO> paymentListByStore(MemberVO memberVO,PagerOrderList pager) throws Exception{
		pager.makeRow();
		memberVO.setPager(pager);
		int totalCount = paymentRepository.paymentTotal(memberVO);
		
		pager.makePage(totalCount);
		
		memberVO.setPager(pager);
		List<PaymentVO> ar = paymentRepository.paymentListByStore(memberVO);
		
		// orderInfo 1로 들어온 경우
		if(memberVO.getOrderInfo() == 1) {
			List<PaymentVO> list1 =  paymentRepository.paymentListByStore(memberVO);
			memberVO.setOrderInfo(2);
			List<PaymentVO> list2 =  paymentRepository.paymentListByStore(memberVO);
			ar = new ArrayList<PaymentVO>();
			ar.addAll(list1);
			ar.addAll(list2);
		}
		
		// payDate를 시간으로 바꿔서 VO에 set하기
		if(ar!=null) {
			for(PaymentVO paymentVO:ar) {					
				SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
				String payDate = sdf.format(paymentVO.getPayDate());
				paymentVO.setPayTime(payDate);			
				java.sql.Date sqlDate = new java.sql.Date(paymentVO.getPayDate().getTime());
				paymentVO.setPayDate(sqlDate);

				List<OrderProductVO> orderItems= orderProductRepository.orderProductList(paymentVO.getPayNum());
				
				for(OrderProductVO orderProductVO : orderItems) {						
					orderProductVO.setMenuName(menuRepository.menuSelect(orderProductVO.getMenuNum()).getName());
					MenuVO menuVO = menuRepository.menuSelect(orderProductVO.getMenuNum());
					
					System.out.println("메뉴이름 : "+menuVO.getName());
					orderProductVO.setMenuVO(menuVO);			
					List<CustomVO> customs = customRepository.customList(orderProductVO.getProductNum());
					
					// 샌드위치, 샐러드의 경우 커스텀 정보를 List로 가져오기
					if(customs != null) {
						for(CustomVO customVO : customs) {
						// 재료 이름, 가격등을 가져오기 위해서 IngredientVO를 가져온다
						IngredientVO ingreVO = ingredientRepository.ingreSelect(customVO.getIngreNum());
						customVO.setIngredientVO(ingreVO);
						}
					orderProductVO.setCustomVOs(customs);
					}
				}							
				paymentVO.setOrderItems(orderItems);
				paymentVO.setMenuCounts(orderItems.size());			
			}		
		}
				
		return ar;		
	}
	
	
	public int paymentUpdate(PaymentVO paymentVO) throws Exception{
		return paymentRepository.paymentUpdate(paymentVO);
	}
	
	public int getEachTotal(MemberVO memberVO) throws Exception{
		return paymentRepository.getEachTotal(memberVO);
	}
	
	
}