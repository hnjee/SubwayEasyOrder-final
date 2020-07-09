package com.subway.s1.store;


import javax.servlet.http.HttpSession;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.subway.s1.member.MemberRepository;
import com.subway.s1.member.MemberService;
import com.subway.s1.member.MemberVO;
import com.subway.s1.myStore.MyStoreService;
import com.subway.s1.myStore.MyStoreVO;

@Controller
@RequestMapping("/store/**")
public class StoreController {
	@Autowired
	private StoreService storeService;
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private MyStoreService myStoreService;
	
	@GetMapping("storeList")
	public ModelAndView storeList(Integer cases) throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.addObject("cases", cases);
		return mv;
	}
	
	@PostMapping("storeList")
	public ModelAndView storeList(ModelAndView mv, String address, HttpServletRequest request, Integer cases) throws Exception{
		List<StoreVO> ar = storeService.storeList(address);	
		
		MemberVO memberVO = (MemberVO)request.getSession().getAttribute("member");
		List<String> myNums = myStoreService.myStoreNumList(memberVO.getId()); 
		
		mv.addObject("myNums", myNums);
		mv.addObject("list", ar);
		mv.addObject("storeCnt", ar.size());
		mv.addObject("st", 1);
		mv.addObject("address", address);
		mv.addObject("cases", cases);
		return mv;
	}
	
	@GetMapping("myStoreList")
	public ModelAndView myStoreList(ModelAndView mv, HttpServletRequest request, Integer cases) throws Exception{
		MemberVO memberVO = (MemberVO)request.getSession().getAttribute("member");
		List<MyStoreVO> myList = myStoreService.myStoreList(memberVO.getId());
		
		mv.addObject("myList", myList);
		mv.addObject("myCnt", myList.size());
		mv.addObject("cases", cases);
		return mv;
	}
	
	@GetMapping("storeUpdate")
	public ModelAndView storeUpdate(String storeNum, HttpServletRequest request, Integer cases) throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberVO memberVO = (MemberVO)request.getSession().getAttribute("member");
		memberVO.setStoreNum(storeNum);
		memberService.memberStoreUpdate(memberVO);
		if(cases==null) {
			mv.setViewName("redirect:../menu/menuList?menuCode=SW");
		} else {
			mv.setViewName("redirect:../cart/cartList");
		}
		return mv;
	}
	
	@GetMapping("myStoreDelete")
	public ModelAndView myStoreDelete(String storeNum, HttpServletRequest request, String returnUrl) throws Exception{
		ModelAndView mv = new ModelAndView();
		MyStoreVO vo = new MyStoreVO();
		MemberVO memberVO = (MemberVO)request.getSession().getAttribute("member");
		vo.setId(memberVO.getId());
		vo.setStoreNum(storeNum);
		myStoreService.myStoreDelete(vo);
		mv.setViewName("redirect:"+returnUrl);
		return mv;
	}
	
	@GetMapping("myStoreInsert")
	public ModelAndView myStoreInsert(String storeNum, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView();
		MyStoreVO vo = new MyStoreVO();
		MemberVO memberVO = (MemberVO)request.getSession().getAttribute("member");
		vo.setId(memberVO.getId());
		vo.setStoreNum(storeNum);
		myStoreService.myStoreInsert(vo);
		mv.setViewName("redirect:storeList");
		return mv;
	}

	@GetMapping("storeSearch")
	public void storeSearch()throws Exception{
		
	}
	@GetMapping("storeSearch2")
	public void storeSearch2()throws Exception{
		
	}
	
	
	//지워도 될것같은..
	@GetMapping("findStore")
	@ResponseBody
	public String findStore(StoreVO storeVO)throws Exception{
		if(storeService.findStoreNum(storeVO)==null) {
			System.out.println("null");
			return "null";
		} else {
			storeVO=storeService.findStoreNum(storeVO);
			return storeVO.getStoreNum();
		}
	}
	
	//SooKyoung
	//Store Open/Close
		@GetMapping("storeOC")
		public ModelAndView storeOC(StoreVO storeVO)throws Exception{
			ModelAndView mv = new ModelAndView();
			int result = storeService.storeOC(storeVO);
			if(result > 0) {
				if(storeVO.getOrderable()==1) {
					mv.addObject("result", "개점완료!");
				}else {
					mv.addObject("result", "마감완료!");
				}
				mv.addObject("path", "/sales/chart");
			}
			mv.setViewName("common/result");
			return mv;
		}
	
	
}
