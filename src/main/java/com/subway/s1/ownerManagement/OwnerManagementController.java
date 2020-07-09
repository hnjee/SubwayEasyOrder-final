package com.subway.s1.ownerManagement;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.subway.s1.member.MemberVO;
import com.subway.s1.util.Pager;

@Controller
@RequestMapping("/ownerManagement/**")
public class OwnerManagementController {
	
	@Autowired
	private OwnerManagementService ownerService;
	
	@GetMapping("ownerJoin")
	public ModelAndView ownerJoin() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.addObject("path", "ownerJoin");
		mv.setViewName("ownerManagement/ownerJoin");
		System.out.println("ownerJoin get");
		return mv;
	}

	@PostMapping("ownerJoin")
	public ModelAndView ownerJoin(OwnerManagementVO ownerVO)throws Exception{
		System.out.println("ownerJoin post");
		ModelAndView mv = new ModelAndView();
		int result = ownerService.ownerJoin(ownerVO);
		if(result>0) {
			System.out.println("성공");
			mv.setViewName("redirect:./ownerList");
		}else {		
			System.out.println("실패");
			mv.setViewName("ownerManagement/ownerJoin");
		}


		return mv;
	}
	
	
	@GetMapping("ownerList")
	public ModelAndView ownerList(Pager pager) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		List<OwnerManagementVO> ar=ownerService.ownerList(pager);
		mv.addObject("ownerList", ar);
		mv.setViewName("ownerManagement/ownerList");
		return mv;
	}
	
}
