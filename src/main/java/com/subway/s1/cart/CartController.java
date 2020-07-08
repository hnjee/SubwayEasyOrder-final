package com.subway.s1.cart;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.subway.s1.custom.CustomService;
import com.subway.s1.custom.CustomVO;
import com.subway.s1.member.MemberVO;
import com.subway.s1.store.StoreService;
import com.subway.s1.store.StoreVO;

;

@Controller
@RequestMapping("/cart/**/")
public class CartController {
	
	@Autowired
	private CartService cartService;
	@Autowired
	private StoreService storeService;
	@Autowired
	private CustomService customService;
	
	@PostMapping("cartInsert")
	public ModelAndView cartInsert(CartVO cartVO, String[] ingreNum, Integer breadSize, Integer breadToasting,String coo, String drink, String menuCode, HttpServletRequest request) throws Exception{
	//1. CartVO INSERT
		//1)CartVO의 productNum
		long productNum = System.currentTimeMillis();
		cartVO.setProductNum("P"+productNum);
		
		//2)CartVO의 id 
		MemberVO memberVO = (MemberVO)request.getSession().getAttribute("member");
		cartVO.setId(memberVO.getId());
	
		//3)CartVO의 가격 : 상품 1개 가격  
		cartVO.setProductPrice(cartVO.getProductPrice()/cartVO.getProductCount());
		
		//4) setting 값 설정 
		boolean set = true;
		if(cartVO.getSetting()!=null) { 
			if(cartVO.getSetting().equals("0")) {
				set = false;
				cartVO.setSetting(null);
			} else {
				cartVO.setSetting(cartVO.getProductNum());
			}
		}
		
		//5)Cart table에 INSERT
		cartService.cartInsert(cartVO);
		System.out.println("메인메뉴 insert 완료: " + cartVO.getProductNum());
		
	
	//2. 샌드위치, 샐러드인 경우
		if(menuCode.contains("SW")&&(!menuCode.equals("SW4"))||menuCode.contains("SA")) {
			//1) CustomVO INSERT
			if(ingreNum!=null) {
				//고객이 선택한 Ingredient들 Custom table에 insert하기 
				CustomVO customVO = new CustomVO();
				for(String i : ingreNum) {
					customVO.setProductNum(cartVO.getProductNum());
					customVO.setIngreNum(i);
					customVO.setBreadToasting(breadToasting);
					customVO.setBreadSize(breadSize);
					customService.customInsert(customVO);
					System.out.println("커스텀 insert 완료: " + customVO.getProductNum());
				}
			}
		
			//3) set인 경우 : 쿠키, 음료 CartVO INSERT 
			if(set) {
				System.out.println("세트임!!!");
				// 세트의 메뉴들 cartVO 세팅 (위의 cartVO 재활용, id는 똑같으니까 놔둠) 
				// 쿠키 
				cartVO.setSetting("P"+productNum); //메인메뉴의 productNum 
				cartVO.setMenuNum(coo);
				cartVO.setProductNum("P"+System.currentTimeMillis()); //쿠키의 productNum
				cartVO.setProductPrice(0);
				cartVO.setProductCount(1);
				cartService.cartInsert(cartVO);
				System.out.println("쿠키 insert 완료: " + cartVO.getProductNum());
				// 음료 
				cartVO.setSetting("P"+productNum); //메인메뉴의 productNum 
				cartVO.setMenuNum(drink);
				cartVO.setProductNum("P"+System.currentTimeMillis()); //음료의 productNum
				cartService.cartInsert(cartVO);
				System.out.println("음료 insert 완료: " + cartVO.getProductNum());
			}
		}
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:cartList");
		return mv;
	}
	
	@GetMapping("cartList")
	public ModelAndView cartList(HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();

		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		List<CartVO> ar = cartService.cartList(memberVO.getId());
		StoreVO storeVO = storeService.selectStore(memberVO.getId());
//		PointVO pointVO = new PointVO(); 
//		pointVO = pointRepository.pointSelect(memberVO.getId());
	
		mv.addObject("member", memberVO);
		mv.addObject("list", ar);
		mv.addObject("store", storeVO);
		mv.setViewName("cart/cartList");
		
		if(storeVO == null) {
			mv.addObject("result", "장바구니가 비었습니다.");
			mv.addObject("path", "/");
			mv.setViewName("template/result");
		}
		return mv;
	}
	
	
	@GetMapping("cartDelete")
	public String cartDelete(String productNum) throws Exception{		
		int res = cartService.cartDelete(productNum);
		return "redirect:./cartList";
	}
	
	@GetMapping("cartDeleteAll")
	//public String cartDelete(세션 받아오기(아이디 이용해서 삭제)) throws Exception{		
	public ModelAndView cartDelete(String id,ModelAndView mv) throws Exception{		
		int res = cartService.cartDeleteAll(id);
		System.out.println("삭제 갯수 : "+res);
		mv.addObject("result", "장바구니 전체 삭제합니다..");
		mv.addObject("path", "cartList");
		mv.setViewName("template/result");
		return mv;
	}
	
	@GetMapping("howToUse")
	public void howToUse() throws Exception{
		
	}
	
}
