package com.subway.s1.product;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.subway.s1.member.MemberVO;
import com.subway.s1.menu.menuFile.MenuFileVO;
import com.subway.s1.menuSoldout.MenuSoldoutService;
import com.subway.s1.menuSoldout.MenuSoldoutVO;
import com.subway.s1.store.StoreService;
import com.subway.s1.store.StoreVO;
import com.subway.s1.util.Pager;

@Controller
@RequestMapping("/product/**/")
public class ProductController {
	
	@Autowired
	private ProductService productService;
	@Autowired
	private MenuSoldoutService menuSoldoutService;
	@Autowired
	private StoreService storeService; 
	
	//-------------------------본사-----------------------------------------------
	//상품관리 리스트
	@GetMapping("headOfficeProductList")
	public ModelAndView headOfficeproductList(Pager pager)throws Exception{
		ModelAndView mv = new ModelAndView();
		List<ProductVO> ar = productService.HOproductList(pager);
		mv.addObject("product", ar);
		mv.addObject("Pager", pager);
		mv.setViewName("product/headOfficeProductList");
		return mv;
		
	}
	
	//상품관리-insert(추가)
	@GetMapping("productInsert")
	public ModelAndView productInsert()throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.addObject("path", "Insert");
		mv.setViewName("product/headOfficeProductRegister");
		return mv;
	}
	
	@PostMapping("productInsert")
	public ModelAndView productInsert(ProductVO productVO, MultipartFile[] files)throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = productService.productInsert(productVO,files);
		if(result > 0) {
			mv.addObject("result", "상품 등록이 완료되었습니다.");
			mv.addObject("path", "/product/headOfficeProductList");
		}else {
			mv.addObject("result", "상품 등록이 실패하였습니다.");
			mv.addObject("path", "./");
		}
		mv.setViewName("common/result");
		List<MenuFileVO> ar = productVO.getFileVOs();
		System.out.println("getFileVOs : "+ ar);
		return mv;
	}

	//상품관리 - Update(수정)
	@GetMapping("productUpdate")
	public ModelAndView productUpdate(String menuNum)throws Exception{
		ModelAndView mv = new ModelAndView();
		ProductVO productVO = productService.getMenu(menuNum);
		mv.addObject("productVO", productVO);
		mv.addObject("path", "Update");
		mv.setViewName("product/headOfficeProductRegister");
		return mv;
	}
	
	@PostMapping("productUpdate")
	public ModelAndView productUpdate(ProductVO productVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = productService.productUpdate(productVO);
		if(result > 0) {
			mv.addObject("result", "상품 수정이 완료되었습니다.");
			mv.addObject("path", "/product/headOfficeProductList");
		}else {
			mv.addObject("result", "상품 수정이 실패하였습니다.");
			mv.addObject("path", "./");
		}
		mv.setViewName("common/result");
		return mv;
	}
	
	//상품관리 - Delete(삭제)
	@GetMapping("productDelete")
	public ModelAndView productDel(ProductVO productVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = productService.productDelete(productVO);
		if(result > 0) {
			mv.addObject("result", "상품 삭제가 완료되었습니다.");
			mv.addObject("path", "/product/headOfficeProductList");
		}else {
			mv.addObject("result", "상품 삭제가 실패하였습니다.");
			mv.addObject("path", "./");
		}
		mv.setViewName("common/result");
		return mv;
	}
	
	@GetMapping("productDeletes")
	@ResponseBody
	public int productDeletes(String [] deletes, MultipartFile[] files)throws Exception{
		List<String> menuNums = Arrays.asList(deletes);
		int result = productService.deletes(menuNums,files);

		return result;
	}
	
	//상품관리 - 품절/품절해제
	@GetMapping("modal")
	@ResponseBody
	public int sales1Update(ProductVO productVO)throws Exception{
		System.out.println(productVO.getSale());
		int result = productService.salesUpdate(productVO);
		return result;
	}
	
	
	
	//----------------------------가맹점-----------------------------------------
		//메뉴 리스트
		@GetMapping("productList")
		public ModelAndView productList(Pager pager,HttpSession session)throws Exception{
			ModelAndView mv = new ModelAndView();
			MemberVO memberVO = ((MemberVO)session.getAttribute("member"));
			StoreVO storeVO = storeService.selectStore(memberVO.getId());
			List<ProductVO> ar = productService.productList2(pager,memberVO.getStoreNum());
			
			mv.addObject("product", ar);
			mv.addObject("Pager", pager);
			mv.addObject("store", storeVO);
			mv.setViewName("product/productList");
			return mv;
		}
		
		//메뉴 품절
		@GetMapping("menuSoldout0")
		@ResponseBody
		public int menuSoldout0(MenuSoldoutVO menuSoldoutVO,HttpSession session)throws Exception{
			String storeNum = ((MemberVO)session.getAttribute("member")).getStoreNum();
			int result = menuSoldoutService.soldoutInsert(menuSoldoutVO,storeNum);
			return result;
		}
		
		//품절해제
		@GetMapping("menuSoldout1")
		@ResponseBody
		public int menuSoldout1(MenuSoldoutVO menuSoldoutVO, HttpSession session)throws Exception{
			String storeNum = ((MemberVO)session.getAttribute("member")).getStoreNum();
			int result = menuSoldoutService.soldoutDelete(menuSoldoutVO,storeNum);
			return result;
		}
	
}
