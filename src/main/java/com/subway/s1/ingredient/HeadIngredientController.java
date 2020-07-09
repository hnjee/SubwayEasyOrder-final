package com.subway.s1.ingredient;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.subway.s1.ingredient.ingredientFile.IngredientFileVO;
import com.subway.s1.member.MemberVO;
import com.subway.s1.menu.MenuVO;
import com.subway.s1.sales.ByOrderVO;
import com.subway.s1.util.Pager;


@Controller
@RequestMapping("/ingredient/**/")
public class HeadIngredientController {
	
	@Autowired
	private IngredientService ingredientService;
	
//SIHYUN

	@GetMapping("listDeletes")
	@ResponseBody
	public int listDelete(String[] deletes, MultipartFile[] files) throws Exception{
		
		ModelAndView mv= new ModelAndView();
		List<String> ingreNums =Arrays.asList(deletes); //배열을 리스트로 바꾸는 방법
		int result=ingredientService.deletes(ingreNums, files);

		if(result>0) {
			mv.setViewName("ingredient/headOfficeIngredientList");
		}else {
			System.out.println("실패");
			mv.setViewName("redirect:./headOfficeIngredientList");
		}
		return result;
	}
	
	
	@GetMapping("headOfficeIngredientList")
	public ModelAndView headOfficeIngredientList(Pager pager,String storeNum,HttpSession session) throws Exception{
		String storeName = ((MemberVO)session.getAttribute("member")).getName();
		ModelAndView mv= new ModelAndView();
		List<IngredientVO>ar=ingredientService.headOfficeIngredientList(pager);
		mv.addObject("ingredientList", ar);
		mv.addObject("Pager", pager);
		mv.addObject("storeName",storeName);
		mv.setViewName("ingredient/headOfficeIngredientList");
		return mv;
	}
	
	
	@GetMapping("ingredientRegister")
	public ModelAndView ingredientRegister(HttpSession session)throws Exception{
		String storeName = ((MemberVO)session.getAttribute("member")).getName();
		ModelAndView mv = new ModelAndView();
		System.out.println("storeName get :"+storeName);
		mv.addObject("path", "ingredientRegister");
		mv.addObject("storeName",storeName);
		mv.setViewName("ingredient/ingredientRegister");
		return mv;
	}
	
	@PostMapping("ingredientRegister")
	public ModelAndView ingredientRegister(ModelAndView mv,IngredientVO ingredientVO,MultipartFile[] files,HttpSession session)throws Exception{
		String storeName = ((MemberVO)session.getAttribute("member")).getName();
		int result=ingredientService.ingredientRegister(ingredientVO,files);
		if(result>0) {
			System.out.println("성공");
			mv.setViewName("redirect:./headOfficeIngredientList");
		}else {		
			System.out.println("실패");
			mv.setViewName("ingredient/ingredientRegister");
		}
		mv.addObject("storeName",storeName);
		List<IngredientFileVO>ar=ingredientVO.getFileVOs();
		System.out.println("getFileVOs():"+ar);
		return mv;
	}
	
	@GetMapping("ingredientSoldOut")
	@ResponseBody
	public int ingredientSoldOut(IngredientVO ingredientVO)throws Exception{
		ModelAndView mv= new ModelAndView();
		ingredientVO=ingredientService.ingredientSelectOne(ingredientVO);
		int result=ingredientService.ingredientSoldOut(ingredientVO);
		if(result>0) {
			System.out.println("성공");	
		}else {		
			System.out.println("실패");
		}
		
		return result;
	}
	
	@GetMapping("ingredientUnsold")
	@ResponseBody
	public int ingredientUnsold(IngredientVO ingredientVO)throws Exception{
		ModelAndView mv= new ModelAndView();
		System.out.println("ingredientUnsold");
		int result=ingredientService.ingredientUnsold(ingredientVO);
		if(result>0) {
			System.out.println("성공");
		}else {		
			System.out.println("실패");
		}
		return result;
	}
	
	@GetMapping("ingredientUpdate")
	public ModelAndView ingredientUpdate(IngredientVO ingredientVO,HttpSession session) throws Exception{
		String storeName = ((MemberVO)session.getAttribute("member")).getName();
		ModelAndView mv = new ModelAndView();
		ingredientVO=ingredientService.ingredientSelectOne(ingredientVO);
		mv.addObject("ingredientVO", ingredientVO);
		mv.addObject("path", "ingredientUpdate");
		mv.addObject("storeName",storeName);
		mv.setViewName("ingredient/ingredientRegister");
		return mv;
	}
	
	@PostMapping("ingredientUpdate")
	public ModelAndView ingredientUpdate(ModelAndView mv,IngredientVO ingredientVO,HttpSession session) throws Exception{
		String storeName = ((MemberVO)session.getAttribute("member")).getName();
		int result=ingredientService.ingredientUpdate(ingredientVO);
		if(result>0) {
			System.out.println("성공");
			mv.setViewName("redirect:./headOfficeIngredientList");
		}else {		
			System.out.println("실패");
			mv.setViewName("ingredient/ingredientRegister");
		}
		mv.addObject("ingredientVO", ingredientVO);
		mv.addObject("path", "ingredientUpdate");
		mv.addObject("storeName",storeName);
		return mv;
	}
	
	@GetMapping("ingredientDelete")
	public ModelAndView ingredientDelete(IngredientVO ingredientVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		int result =ingredientService.ingredientDelete(ingredientVO);
		if(result>0) {
			System.out.println("성공");
			mv.setViewName("redirect:./headOfficeIngredientList");
		}else {	
			System.out.println("실패");
			mv.addObject("result", "삭제실패");
			mv.setViewName("redirect:./headOfficeIngredientListt");
		}
		
		return mv;
	}
	
	public void fileSelectOne(IngredientFileVO ingredientFileVO)throws Exception{
		ingredientFileVO=ingredientService.fileSelectOne(ingredientFileVO.getIngreNum());
	}


	
	
}
