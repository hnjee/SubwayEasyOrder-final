package com.subway.s1.ownerManagement;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.subway.s1.util.Pager;

@Controller
@RequestMapping("/ownerManagement/**")
public class OwnerManagementController {
	
	@Autowired
	private OwnerManagementService ownerService;
	
	@GetMapping("ownerList")
	public ModelAndView ownerList(Pager pager) throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println("inininin");
		List<OwnerManagementVO> ar=ownerService.ownerList(pager);

		mv.addObject("ownerList", ar);
		mv.setViewName("ownerManagement/ownerList");
		return mv;
	}
	
	@GetMapping("ownerDelete")
	public ModelAndView ownerDelete(OwnerManagementVO ownerVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		int result=ownerService.ownerDelete(ownerVO);
		if(result>0) {
			System.out.println("store 삭제 성공");
		}else {
			System.out.println("store 삭제 실패");
		}
		mv.setViewName("redirect:./ownerList");
		return mv;
	}
	
	// 여러개 삭제
	@GetMapping("ownerDeletes")
	@ResponseBody
	public int ownerDeletes(String[] deletes) throws Exception{
		ModelAndView mv= new ModelAndView();
		List<String> storeNum =Arrays.asList(deletes);
		int result = ownerService.ownerDeletes(storeNum);
		if(result>0) {
			System.out.println("owner여러개 삭제 성공");
		}else{
			System.out.println("owner여러개 삭제 실패");
		}
		return result;
		
	}
	@GetMapping("bestRest")
	public ModelAndView bestRest(OwnerManagementVO ownerVO)throws Exception{
		ModelAndView mv= new ModelAndView();
		int result=ownerService.bestRest(ownerVO);
		if(result>0) {
			System.out.println("reset 성공");
		}else {
			System.out.println("reset 실패");
		}
		mv.setViewName("redirect:./ownerList");
		return mv;
	}
	//베스트매장 여러개 업데이트
	@GetMapping("bestPick")
	@ResponseBody
	public int bestPick(String[] pick)throws Exception{
		List<String> storeNum =Arrays.asList(pick);
		int result = ownerService.bestPick(storeNum);
		if(result>0) {
			System.out.println("best여러개 업데이트 성공");
		}else{
			System.out.println("best여러개 업데이트  실패");
		}
		return result;
	}
	
//	@GetMapping("ownerJoin")
//	public ModelAndView ownerJoin() throws Exception{
//		ModelAndView mv = new ModelAndView();
//		mv.addObject("path", "ownerJoin");
//		mv.setViewName("ownerManagement/ownerJoin");
//		System.out.println("ownerJoin get");
//		return mv;
//	}
//
//	@PostMapping("ownerJoin")
//	public ModelAndView ownerJoin(OwnerManagementVO ownerVO)throws Exception{
//		System.out.println("ownerJoin post");
//		ModelAndView mv = new ModelAndView();
//		int result = ownerService.ownerJoin(ownerVO);
//		if(result>0) {
//			System.out.println("성공");
//			mv.setViewName("redirect:./ownerList");
//		}else {		
//			System.out.println("실패");
//			mv.setViewName("ownerManagement/ownerJoin");
//		}
//
//
//		return mv;
//	}
	
	
	
}
