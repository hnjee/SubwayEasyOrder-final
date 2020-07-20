package com.subway.s1.payment;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.subway.s1.cart.CartService;
import com.subway.s1.cart.CartVO;
import com.subway.s1.member.MemberService;
import com.subway.s1.member.MemberVO;
import com.subway.s1.orderProduct.OrderProductService;
import com.subway.s1.point.PointService;
import com.subway.s1.point.PointVO;
import com.subway.s1.store.StoreService;
import com.subway.s1.store.StoreVO;
import com.subway.s1.util.Pager;
import com.subway.s1.util.PagerOrderList;

@Controller
@RequestMapping("/payment/**/")
public class PaymentController {
	
	@Autowired
	private CartService cartService;
	@Autowired
	private StoreService storeService;
	@Autowired
	private PaymentService paymentService;
	@Autowired
	private OrderProductService orderProductService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private PointService pointService;
	
	
	

	// 결제하기 페이지
	// 장바구니에서 선택해서 넘어온 항목들만 가져온다,
	// 해당하는 productNum과 (세트 여부도 생각해서) productCount값들을 배열로 가져오기
	@PostMapping("paymentOngoing")
	public ModelAndView paymentOngoing(@RequestParam(value = "productNum") String[] productNums,
			@RequestParam(value = "productCount") int[] productCounts,
			@RequestParam(value = "setMenuNum",required = false) String[] setMenuNums, int point, HttpSession session) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		List<CartVO> cartVOs =new ArrayList<CartVO>();
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		StoreVO storeVO = storeService.selectStore(memberVO.getId());
		
		// 넘어온 productNum 해당 갯수를 데이터베이스에 update
		if(productNums.length>0) {
			for(int i=0; i<productNums.length;i++) {
				CartVO cartVO = new CartVO();
				cartVO.setProductNum(productNums[i]);
				cartVO.setProductCount(productCounts[i]);
				cartService.cartUpdate(cartVO);
				cartVO = cartService.cartSelect(productNums[i]);
				cartVOs.add(cartVO);
			}
		}
		
		// 세트에 함께오는 메뉴들 처리
		if(setMenuNums !=null && setMenuNums.length>0) {
			for(int i=0; i<setMenuNums.length;i++) {
				CartVO cartVO = new CartVO();				
				cartVO = cartService.cartSelect(setMenuNums[i]);
				cartVOs.add(cartVO);
			}
		}		
		
		cartVOs = cartService.cartSelectDetail(cartVOs);
		mv.addObject("member", memberVO);
		mv.addObject("point", point);
		mv.addObject("list", cartVOs);
		mv.addObject("store", storeVO);
		mv.setViewName("payment/paymentOngoing");
		
		return mv;
	}
	
	
	// 결제 완료 페이지
	@PostMapping("paymentSuccess")
	public ModelAndView paymentSuccess(@RequestParam(value = "productNum") String[] productNums,int totalPrice, HttpSession session, int point) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		// 완료 페이지로 넘어올 때
		// 1. 결제 번호 (일련번호) 생성
		String payNum = UUID.randomUUID().toString();
		payNum = payNum.substring(0,8);

		// 2. Payment 테이블에 정보 insert
		//		totalPrice, payDate,id
		PaymentVO paymentVO = new PaymentVO();
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		
		paymentVO.setId(memberVO.getId());
		paymentVO.setPayNum(payNum);
		paymentVO.setTotalPrice(totalPrice);
		paymentVO.setStoreNum(memberVO.getStoreNum());
		
		int result = paymentService.paymentInsert(paymentVO);
		if(result>0) {
			System.out.println("pay내역 저장...");
		} else {
			System.out.println("pay 저장 실패...");
		}
		
		
		// 3. 결제가 완료된 항목들만 OrderProduct 테이블에 저장
		//		파라미터로 받아올 것 : productNum 배열
		//						productNum으로 Cart 조회해서
		//						menuNum, productCount,productPrice,setting 넣어 주기
		int res =0;
		for(int i=0; i<productNums.length;i++) {
			CartVO cartVO = cartService.cartSelect(productNums[i]);
			cartVO.setPayNum(payNum);
			res = res + orderProductService.orderProductInsert(cartVO);
		}
			
		// 5. 저장 성공 시 해당 productNum갖는 데이터 들은 Cart테이블에서 삭제 
		//		파라미터로 받아온 productNum 해당 정보 삭제
		if(res>0) {
			for(int i=0; i<productNums.length;i++) {
				cartService.cartDelete(productNums[i]);
			}
		}
		
		// 5. 포인트  insert
		// Member 테이블 수정, Point 테이블에 삽입
		// curPoint : 적립 또는 차감될 포인트, oriPoint : 원래 갖고 있던 포인트, totalPoint : 총 포인트		
		
		
		// 장바구니에서 사용 한 내역
		
		PointVO pointVO = new PointVO();
		pointVO.setPayNum(payNum);
		pointVO.setId(memberVO.getId());
		pointVO.setCurPoint(point);
		pointVO.setOriPoint(memberVO.getOriPoint());
		pointVO.setTotalPoint(memberVO.getOriPoint()-point);
		pointVO.setPointStat(0);
		if(point>0) {
			pointService.pointInsert(pointVO);			
		}			
		// 변경된 Point를 회원테이블 update - 1
		memberVO.setOriPoint(pointVO.getTotalPoint());
		memberService.memberPointUpdate(memberVO);
		
		
		// 수정된 oriPoint를 위해 
		// member 다시 가져오기
		memberVO = memberService.idCheck(memberVO);			
		// 결제 후 적립된 포인트
		pointVO.setCurPoint((int)(totalPrice*0.01));
		pointVO.setOriPoint(memberVO.getOriPoint());
		pointVO.setTotalPoint(memberVO.getOriPoint()+(int)(totalPrice*0.01));
		pointVO.setPointStat(1);
		Thread.sleep(1000); //포인트 내역 정렬을 위해 yjh
		pointService.pointInsert(pointVO);				
		// 변경된 Point를 회원테이블에 넣어주기 - 2
		memberVO.setOriPoint(pointVO.getTotalPoint());
		memberService.memberPointUpdate(memberVO);		
		
		//session member update yjh
		session.setAttribute("member", memberVO);
		
		// 결제 완료 페이지에 필요한 정보 -> 주문한 매장 정보
		StoreVO storeVO = storeService.selectStore(memberVO.getId());
		mv.addObject("store", storeVO);
		mv.setViewName("payment/paymentSuccess");
		return mv;
	}
	
	
	// 관리자 주문 접수 관리
	@GetMapping("orderList")
	public ModelAndView orderList(HttpSession session,ModelAndView mv,@RequestParam(defaultValue = "0")int orderInfo, PagerOrderList pager) throws Exception{
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		memberVO.setOrderInfo(orderInfo);
		List<PaymentVO> ar = paymentService.paymentListByStore(memberVO,pager);
		
		int[] cases = new int[4];
		for(int i =0; i<4;i++) {
			memberVO.setOrderInfo(i);
			int num = paymentService.getEachTotal(memberVO);
			System.out.println("---Num : "+num);
			cases[i] = num;
		}
		System.out.println("------curBlock : " +pager.getCurBlock());
		System.out.println("------curPage : " +pager.getCurPage());
		System.out.println("------startNum : " +pager.getStartNum());
		System.out.println("------lastNum : " +pager.getLastNum());
		
		
		
		mv.addObject("pager", pager);
		mv.addObject("orderInfo", orderInfo);
		mv.addObject("list", ar);
		mv.addObject("cases", cases);
		mv.addObject("member", memberVO);
		mv.setViewName("payment/orderList");
		return mv;
	}
	
	//orderInfo를 변경할 
	@PostMapping("orderList")
	public ModelAndView orderList(PaymentVO paymentVO,ModelAndView mv,HttpSession session,PagerOrderList pager) throws Exception{
		paymentService.paymentUpdate(paymentVO);
		
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		memberVO.setOrderInfo(paymentVO.getOrderInfo());
		List<PaymentVO> ar = paymentService.paymentListByStore(memberVO,pager);
		
		int[] cases = new int[4];
		for(int i =0; i<4;i++) {
			memberVO.setOrderInfo(i);
			int num = paymentService.paymentListByStore(memberVO,pager).size();
			cases[i] = num;
		}
		
		int setOrderInfo = paymentVO.getOrderInfo();
		if(setOrderInfo == 2) {
			setOrderInfo = 1;
		}
			
		mv.addObject("pager", pager);
		mv.addObject("orderInfo", setOrderInfo);
		mv.addObject("list", ar);
		mv.addObject("cases", cases);
		mv.addObject("member", memberVO);
		mv.setViewName("redirect:../payment/orderList");
		return mv;
	}
	
	
	
	
	@PostMapping("paymentFail")
	public ModelAndView paymentFail(ModelAndView mv) {
		mv.addObject("result", "결제 실패했습니다. 다시 시도 해주세요");
		mv.addObject("path", "../cart/cartList");
		mv.setViewName("template/result");
		return mv;
	}
	
	@GetMapping("paymentOngoing")
	public ModelAndView paymentOngoing(ModelAndView mv) {
		mv.addObject("result", "잘못된 경로 입니다");
		mv.addObject("path", "/");
		mv.setViewName("template/result");
		return mv;
	}
	
	@GetMapping("paymentSuccess")
	public ModelAndView paymentSuccess(ModelAndView mv) {
		mv.addObject("result", "잘못된 경로 입니다");
		mv.addObject("path", "/");
		mv.setViewName("template/result");
		return mv;
	}
	
	
	
	
}