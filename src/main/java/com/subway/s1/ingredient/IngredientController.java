package com.subway.s1.ingredient;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.subway.s1.ingredient.ingreSoldout.IngreSoldoutService;
import com.subway.s1.ingredient.ingreSoldout.IngreSoldoutVO;
import com.subway.s1.member.MemberVO;
import com.subway.s1.store.StoreService;
import com.subway.s1.store.StoreVO;
import com.subway.s1.util.Pager;

@Controller
@RequestMapping("/ingredient/**/")
public class IngredientController {
	
	@Autowired
	private IngredientService ingredientService;
	@Autowired
	private IngreSoldoutService ingreSoldoutService;
	@Autowired
	private StoreService storeService; 
	
	@GetMapping("ingredientList")
	public ModelAndView ingredientList(Pager pager,String storeNum,HttpSession session) throws Exception{
		MemberVO memberVO = ((MemberVO)session.getAttribute("member"));
		StoreVO storeVO = storeService.selectStore(memberVO.getId());
		
		ModelAndView mv= new ModelAndView();
		
		List<IngredientVO>ar=ingredientService.ingredientList(pager,storeNum,session);
		for(int i=0;i<ar.size();i++) {
			System.out.println("ar:"+ar);
		}
		mv.addObject("ingredientList", ar);
		mv.addObject("Pager", pager);
		mv.addObject("store", storeVO);
		mv.setViewName("ingredient/ingredientList");
		return mv;
	}
	
	//가맹점 품절 ->OutOfStock
	@GetMapping("ingreOutOfStock")
	@ResponseBody
	public int ingreOutOfStock(String storeNum,IngreSoldoutVO ingreSoldoutVO,  HttpSession session)throws Exception{
		 
		storeNum = ((MemberVO)session.getAttribute("member")).getStoreNum();
		//storeNum="S09";
		System.out.println("storeNum:"+storeNum);
		System.out.println("OutOfStock");
		int result = ingreSoldoutService.soldoutInsert(ingreSoldoutVO, storeNum);
		return result;
	}
	
	//가맹점 품절 해제 ->Selling
	@GetMapping("ingreSelling")
	@ResponseBody
	public int ingreSelling(IngreSoldoutVO ingreSoldoutVO,HttpSession session)throws Exception{
		String storeNum = ((MemberVO)session.getAttribute("member")).getStoreNum();
		System.out.println("ingreSelling");
		int result=ingreSoldoutService.soldoutDelete(ingreSoldoutVO, storeNum);
		if(result>0) {
			System.out.println("Selling성공");
		}else {		
			System.out.println("Selling실패");

		}
		
		return result;
	}
}
