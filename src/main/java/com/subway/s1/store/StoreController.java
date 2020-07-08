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

import com.subway.s1.member.MemberService;
import com.subway.s1.member.MemberVO;


@Controller
@RequestMapping("/store/**")
public class StoreController {
	@Autowired
	private StoreService storeService;
	
}
