package com.subway.s1.menu;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.subway.s1.cart.CartService;
import com.subway.s1.cart.CartVO;
import com.subway.s1.ingredient.IngredientService;
import com.subway.s1.ingredient.IngredientVO;
import com.subway.s1.member.MemberVO;
import com.subway.s1.soldout.SoldoutService;


@Controller
@RequestMapping("/menu/**/")
public class MenuController {
	@Autowired
	private MenuService menuService;
	@Autowired
	private IngredientService ingredientService;
	@Autowired
	private SoldoutService soldoutService;
	@Autowired
	private CartService cartService;
	
	@GetMapping("showMenuList")
	public ModelAndView showMenuList(String menuCode) throws Exception{
		ModelAndView mv = new ModelAndView();
		if(menuCode==null) {
			menuCode="SW";
		}
		List<MenuVO> ar = menuService.menuListAll(menuCode);
		mv.addObject("list", ar);
		mv.addObject("menuCode", menuCode);
		return mv;
	}
	
	@GetMapping("showMenuSelect")
	public ModelAndView showMenuSelect(String menuNum) throws Exception{
		ModelAndView mv = new ModelAndView();
		MenuVO menuVO = menuService.menuSelect(menuNum);
		mv.addObject("menu", menuVO);
		return mv;
	}
	

	@GetMapping("menuList")
	public ModelAndView menuList(String menuCode, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView();
	
		if(menuCode==null) {
			menuCode="SW";
		}
		List<MenuVO> ar = menuService.menuList(menuCode);
		
		MemberVO memberVO = (MemberVO)request.getSession().getAttribute("member");
		List<String> menuOut = soldoutService.menuSoldout(memberVO.getStoreNum());
		
		mv.addObject("list", ar);
		mv.addObject("menuCode", menuCode);
		mv.setViewName("menu/menuList");
		mv.addObject("menuOut", menuOut);
		return mv;
	}
	
	
	@PostMapping("menuList")
	public ModelAndView menuList(String menuCode, HttpServletRequest request,@RequestParam(value = "productNum", defaultValue = "0") String[] productNums,
			@RequestParam(value = "productCount", defaultValue = "0") int[] productCounts) throws Exception{		
		ModelAndView mv = new ModelAndView();
		
		// 넘어온 productNum 해당 갯수를 데이터베이스에 update
		if(productNums.length>0) {
			for(int i=0; i<productNums.length;i++) {
				CartVO cartVO = new CartVO();
				cartVO.setProductNum(productNums[i]);
				cartVO.setProductCount(productCounts[i]);
				cartService.cartUpdate(cartVO);	
			}
		}
		
		
		if(menuCode==null) {
			menuCode="SW";
		}
		List<MenuVO> ar = menuService.menuList(menuCode);
		
		MemberVO memberVO = (MemberVO)request.getSession().getAttribute("member");
		List<String> menuOut = soldoutService.menuSoldout(memberVO.getStoreNum());
		
		mv.addObject("list", ar);
		mv.addObject("menuCode", menuCode);
		mv.setViewName("menu/menuList");
		mv.addObject("menuOut", menuOut);
		return mv;
	}
	

	
	@GetMapping("menuSelect")
	public ModelAndView menuSelect(String menuNum, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView();
		MenuVO menuVO = menuService.menuSelect(menuNum);
		String menuCode = menuVO.getMenuCode();
		
		MemberVO memberVO = (MemberVO)request.getSession().getAttribute("member");
		List<String> ingreOut = soldoutService.ingreSoldout(memberVO.getStoreNum());
		List<String> menuOut = soldoutService.menuSoldout(memberVO.getStoreNum());
		
		
		//세트, 커스텀, 샌드위치 구별
		boolean setmenu = false;
		boolean custom = false;
		boolean sw = false;
		if(menuCode.contains("SW")||menuCode.contains("SA")||menuCode.contains("WR")) {
			//1. 세트메뉴 가능
			setmenu = true;
			//세트 구성품(쿠키, 음료)가져오기 
			List<MenuVO> drinks = menuService.menuList("SI1");
			List<MenuVO> cookies = menuService.menuList("SI2");
			//모델에 추가 
			mv.addObject("drinks", drinks);
			mv.addObject("cookies", cookies);
			
			if(menuCode.contains("SW")&&(!menuCode.equals("SW4"))||menuCode.contains("SA")) {
				//2. 커스텀 가능
				custom=true;
				//판매가능한 재료만 가져오기
				List<IngredientVO> ar = ingredientService.ingreList();
				List<IngredientVO> bread = new ArrayList<IngredientVO>();
				List<IngredientVO> cheese = new ArrayList<IngredientVO>();
				List<IngredientVO> vege = new ArrayList<IngredientVO>();
				List<IngredientVO> sauce = new ArrayList<IngredientVO>();
				List<IngredientVO> add = new ArrayList<IngredientVO>();
				//재료 구분하기 
				for(IngredientVO vo : ar) {
					if(vo.getIngreCode().equals("BR")) {
						bread.add(vo);
					} else if (vo.getIngreCode().equals("CZ")){
						cheese.add(vo);
					} else if (vo.getIngreCode().equals("VG")){
						vege.add(vo);
					} else if (vo.getIngreCode().equals("SO")){
						sauce.add(vo);
					} else if (vo.getIngreCode().equals("AD")){
						add.add(vo);
					}
				}
				//모델에 추가
				mv.addObject("bread", bread);
				mv.addObject("cheese", cheese);
				mv.addObject("vege", vege);
				mv.addObject("sauce", sauce);
				mv.addObject("add", add);
				
				//3. 그 중에서도 샌드위치인 경우 
				if(menuCode.contains("SW")) {
					sw=true;
				}
			}
		}
		mv.addObject("menu", menuVO);
		mv.addObject("setmenu", setmenu);
		mv.addObject("custom", custom);
		mv.addObject("sw", sw);
		mv.addObject("ingreOut", ingreOut);
		mv.addObject("menuOut", menuOut);
		
		mv.setViewName("menu/menuSelect");
		return mv;
	}
}
