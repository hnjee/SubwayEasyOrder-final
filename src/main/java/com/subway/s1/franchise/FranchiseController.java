package com.subway.s1.franchise;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.subway.s1.member.MemberService;
import com.subway.s1.store.StoreService;

@Controller
@RequestMapping("/franchise/**")
public class FranchiseController {

	@Autowired
	private FranchiseService franchiseService;
	@Autowired
	private StoreService storeService;
	@Autowired
	private MemberService memberService;
	
	
	@GetMapping("franchiseRequest")
	public void franchiseRequest() throws Exception{
		
	}
	
	@PostMapping("franchiseRequest")
	public ModelAndView franchiseRequest(FranchiseVO franchiseVO, ModelAndView mv) throws Exception{
		int res = franchiseService.franchiseInsert(franchiseVO);
		if(res>0) {
			mv.addObject("result", "성공적으로 등록되었습니다.");
			mv.addObject("path", "../");
		} else {
			mv.addObject("result", "등록에 실패했습니다.");
			mv.setViewName("franschise/franchiseRequest");
		}
		mv.setViewName("template/result");
		return mv;
	}
	
	// 가맹점 관리
	@GetMapping("franchiseManage")
	public ModelAndView franchiseManage() throws Exception{
		ModelAndView mv = new ModelAndView();
		List<FranchiseVO> ar = franchiseService.franchiseList();
		
		mv.addObject("list", ar);
		mv.setViewName("franchise/franchiseManage");
		return mv;		
	}	
	
	@PostMapping("franchiseManage")
	public ModelAndView franchiseManage(int requestNum,ModelAndView mv) throws Exception{
		int res = franchiseService.franchiseUpdate(requestNum);
		if(res>0) {
			FranchiseVO franchiseVO = franchiseService.franchiseSelect(requestNum);
			int storeRes = storeService.storeInsert(franchiseVO);
			storeRes = memberService.ownerInsert(franchiseVO);
			// 메일 주소로 생성된 아이디랑 비번 보내주기
			
			
			
			
			mv.addObject("result", "가맹점 허가되었습니다.");
		} else {
			mv.addObject("result", "허가 실패했습니다.");
		}
		mv.addObject("path", "./franchiseManage");
		mv.setViewName("template/result");
		return mv;
	}
	
}
