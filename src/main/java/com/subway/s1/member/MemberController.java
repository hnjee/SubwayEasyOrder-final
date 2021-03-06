package com.subway.s1.member;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.subway.s1.ingredient.IngredientService;
import com.subway.s1.ingredient.IngredientVO;
import com.subway.s1.menu.MenuService;
import com.subway.s1.menu.MenuVO;
import com.subway.s1.mymenu.MyMenuVO;
import com.subway.s1.orderInfo.OrderInfoVO;
import com.subway.s1.payment.PaymentVO;
import com.subway.s1.point.PointService;
import com.subway.s1.point.PointVO;
import com.subway.s1.store.StoreService;
import com.subway.s1.store.StoreVO;
import com.subway.s1.survey.SurveyService;
import com.subway.s1.survey.SurveyVO;
import com.subway.s1.util.Pager;

@Controller
@RequestMapping("/member/**")
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MenuService menuService;
	@Autowired
	private IngredientService ingredientService;
	@Autowired
	private PointService pointService;
	@Autowired
	private SurveyService surveyService;
	@Autowired
	private StoreService storeService;
	
	
	@GetMapping("memberSecession")
	public ModelAndView memberSecession(HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		mv.setViewName("common/result");
		mv.addObject("result", "회원탈퇴 완료");
		mv.addObject("path", "../");
		memberService.memberSecession(memberVO);
		session.invalidate();
		return mv;
	}
	
	@PostMapping("memberInfo")
	public ModelAndView memberInfo(MemberVO memberVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberVO check= memberService.memberLogin(memberVO);
		if(check==null) {
			mv.addObject("result", "비밀번호를 정확히 입력하세요.");
			mv.addObject("path", "./memberInfo");
			mv.setViewName("common/result");
		} else {
			mv.addObject("check", "pass");
			mv.setViewName("member/memberInfo2");
		}
		
		return mv;
	}
	@PostMapping("memberInfo2")
	public ModelAndView memberInfo2(MemberVO memberVO,HttpSession session)throws Exception{
		memberService.memberUpdate(memberVO);
		ModelAndView mv = new ModelAndView();
		mv.addObject("result", "수정완료되었습니다.");
		mv.addObject("path", "./memberPage");
		mv.setViewName("common/result");
		memberVO = memberService.idCheck(memberVO);
		session.setAttribute("member", memberVO);
		return mv;
		
	}
	
	@PostMapping("pwCheck")
	@ResponseBody
	public boolean pwCheck(String now_pw,HttpSession session)throws Exception{
		boolean result = true;
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		if(memberVO.getPw().equals(now_pw)) {
			result= true;
		} else {
			result=false;
		}
		
		return result;
	}
	@PostMapping("pwUpdate")
	public ModelAndView pwUpdate(MemberVO memberVO,HttpSession session)throws Exception{
		memberService.pwUpdate(memberVO);
		memberVO = memberService.memberLogin(memberVO);
		ModelAndView mv = new ModelAndView();
		mv.addObject("result", "비밀번호 변경 완료");
		mv.addObject("path", "./memberPage");
		mv.setViewName("common/result");
		session.setAttribute("member", memberVO);
		return mv;
	}
	
	@GetMapping("memberInfo")
	public void memberInfo()throws Exception{
		
	}
	@PostMapping("surveyInsert")
	@ResponseBody
	public void surveyInsert(SurveyVO surveyVO,HttpSession session)throws Exception{
		memberService.surveyInsert(surveyVO);
		memberService.surveyUpdate(surveyVO);
		SurveyVO grade = new SurveyVO();
		Date date = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String payDate = simpleDateFormat.format(date);
		Date to = simpleDateFormat.parse(payDate);
		PaymentVO paymentVO = new PaymentVO();
		paymentVO.setStoreNum(surveyVO.getStoreNum());
		paymentVO.setPayDate(to);
		grade=surveyService.surveyMonthAVG(paymentVO);
		float total =grade.getHygiene()+grade.getTaste()+grade.getKindness()+surveyVO.getKindness()+surveyVO.getHygiene()+surveyVO.getTaste();
		total = total/(grade.getCount()+1)/3;
		int storeScore = Math.round(total);
		StoreVO storeVO = new StoreVO();
		storeVO.setStoreNum(surveyVO.getStoreNum());
		storeVO.setStoreScore(storeScore);
		storeService.scoreUpdate(storeVO);
		
		
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		PointVO pointVO = new PointVO();
		
		int curPoint = 100;
		pointVO.setId(memberVO.getId());
		pointVO.setPayNum(surveyVO.getPayNum());
		pointVO.setCurPoint(curPoint);
		pointVO.setOriPoint(memberVO.getOriPoint());
		pointVO.setTotalPoint(pointVO.getCurPoint()+pointVO.getOriPoint());
		pointVO.setPointStat(4);
		pointService.pointInsert(pointVO);
		memberVO.setOriPoint(pointVO.getTotalPoint());
		memberService.memberPointUpdate(memberVO);		//결제 후 멤버 테이블 업데이트
		session.setAttribute("member", memberVO);
	}
	
	@GetMapping("pointViewMore")
	public ModelAndView pointViewMore(MemberVO memberVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		List<PointVO> point = memberService.memberPoint(memberVO);
		mv.addObject("point", point);
		mv.setViewName("member/pointViewMore");
		return mv;
	}
	
	
	@GetMapping("memberPoint")
	public ModelAndView memberPoint(HttpSession session)throws Exception{
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		ModelAndView mv = new ModelAndView();
		memberVO.setStartNum(0);
		List<PointVO> point = memberService.memberPoint(memberVO);
		mv.addObject("point", point);
		mv.setViewName("member/memberPoint");
		return mv;
	}
	
	@GetMapping("oftenStoreDel")
	public ModelAndView oftenStoreDel(MemberVO memberVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		memberService.oftenStoreDel(memberVO);
		mv.addObject("result", "자주찾는 매장에서 삭제되었습니다.");
		mv.addObject("path", "./memberPage");
		mv.setViewName("common/result");
		return mv;
	}
	
	@GetMapping("memberMenuOrder")
	public ModelAndView memberMenuOrder(String id_index,String menuNum,String storeNum,HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		memberVO.setStoreNum(storeNum);
		MenuVO menuVO = menuService.menuSelect(menuNum);
		MyMenuVO myMenuVO = memberService.myMenuOrder(id_index);
		memberService.memberStoreUpdate(memberVO);
		List<String> ingreOut = memberService.ingreOutCheck(storeNum);
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
			
			//세트 구성품(쿠키, 음료)가져오기 
			List<MenuVO> drinks = menuService.menuList("SI1");
			List<MenuVO> cookies = menuService.menuList("SI2");
			
			//모델에 추가 
			mv.addObject("drinks", drinks);
			mv.addObject("cookies", cookies);
			mv.addObject("bread", bread);
			mv.addObject("cheese", cheese);
			mv.addObject("vege", vege);
			mv.addObject("sauce", sauce);
			mv.addObject("add", add);
			
			
		boolean custom = true;
		boolean sw = true;
		mv.addObject("menu", menuVO);
		mv.addObject("myMenu", myMenuVO);
		mv.addObject("custom", custom);
		mv.addObject("sw", sw);
		mv.addObject("ingreOut", ingreOut);
		mv.setViewName("member/memberMenuOrder");
		return mv;
	}
	
	
	@GetMapping("myMenuDelete")
	@ResponseBody
	public void myMenuDelete(MyMenuVO myMenuVO)throws Exception{
		System.out.println(myMenuVO.getId_index());
		memberService.myMenuDel(myMenuVO);
		System.out.println("성공");
	}
	
	@GetMapping("myMenuCustom")
	public ModelAndView myMenuRefresh(HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		List<MyMenuVO> myMenu = memberService.myMenuList(memberVO);
		List<MenuVO> list = memberService.swSelect();
		List<IngredientVO> ingre = memberService.ingreList();
		List<MenuVO> setSide = memberService.setSide();
		mv.addObject("myMenu", myMenu);
		mv.addObject("ingre", ingre);
		mv.addObject("list", list);
		mv.addObject("setSide", setSide);
		mv.setViewName("member/myMenuCustom");
		return mv;
		
	}
	
	@PostMapping("memberMenu")
	public ModelAndView memberMenu(String[] ingreNum,MyMenuVO myMenuVO,HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		myMenuVO.setId(memberVO.getId());
		MyMenuVO custom = new MyMenuVO();
		String id_index = memberVO.getId()+"_"+myMenuVO.getIndex_num();
		custom.setId_index(id_index);
		custom.setId(memberVO.getId());
		memberService.myMenuDel(custom);
		memberService.myMenuUpdate(myMenuVO);
		for(String num : ingreNum) {
			custom.setIngreNum(num);
			memberService.mcInsert(custom);
			System.out.println(num);
		}
		
		return mv;
	}
	@GetMapping("memberMenuReload")
	public ModelAndView memberMenuReload()throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.addObject("result", "저장 됐습니다.");
		mv.addObject("path","./memberMenu");
		mv.setViewName("common/result2");
		return mv;
	}
	
	
	@GetMapping("memberMenu")
	public ModelAndView memberMenu(HttpSession session)throws Exception{
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		List<MenuVO> setSide = memberService.setSide();
		List<MyMenuVO> myMenu = memberService.myMenuList(memberVO);
		List<MyMenuVO> mmList = memberService.mmList(memberVO);
		List<StoreVO> lastStore = memberService.lastStore(memberVO);
		List<StoreVO> allStore = memberService.allStore();
			
		ModelAndView mv = new ModelAndView();
		List<MenuVO> list = memberService.swSelect();
		List<IngredientVO> ingre = memberService.ingreList();
		mv.addObject("mmList", mmList);
		mv.addObject("myMenu", myMenu);
		mv.addObject("ingre", ingre);
		mv.addObject("list", list);
		mv.addObject("setSide", setSide);
		mv.addObject("lastStore", lastStore);
		mv.addObject("allStore", allStore);
		mv.setViewName("member/memberMenu");
		
		List<List<MyMenuVO>> menuOut = new ArrayList<>();
		for(MyMenuVO myMenuVO : myMenu) {
			System.out.println("==================================================================================");
			System.out.println(myMenuVO.getMenuNum());
			menuOut.add(memberService.menuOutCheck(myMenuVO));
		}
		mv.addObject("menuOut", menuOut);
		return mv;
		
	}
	
	@GetMapping("memberPage")
	public ModelAndView memberPage(HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		List<StoreVO> storeList = memberService.oftenStore(memberVO);
		List<OrderInfoVO> findNum = memberService.findSLNum(memberVO);
		int storeCount = storeList.size();
		int orderCount = memberService.orderCount(memberVO);
		mv.addObject("orderCount", orderCount);
		mv.addObject("store", storeList);
		mv.addObject("storeCount", storeCount);
		mv.addObject("findNum", findNum);
		mv.setViewName("member/memberPage");
		return mv;
	}
	
	@GetMapping("orderDetail")
	public ModelAndView orderDetail(OrderInfoVO orderInfoVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		List<OrderInfoVO> list = memberService.selectList(orderInfoVO);
		ArrayList<List<OrderInfoVO>> ingre = new ArrayList<>();
		for(OrderInfoVO vo : list) {
			String num = vo.getProductNum();
			System.out.println(num);
			ingre.add(memberService.detailIngre(vo));
		}
		
		mv.addObject("ingre", ingre);
		
		mv.addObject("select", list);
		mv.addObject("select2", list);
		mv.setViewName("member/orderDetail");
		return mv;
	}
	
	@GetMapping("memberOrderInfo")
	public ModelAndView memberOrderInfo(HttpSession session,int startNum,int lastNum)throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		memberVO.setLastNum(lastNum);
		memberVO.setStartNum(startNum);
		List<OrderInfoVO> findNum = memberService.findSLNum(memberVO);
		if(memberVO!=null) {
			
			List<OrderInfoVO> list = memberService.orderInfoList(memberVO);
			mv.addObject("findNum", findNum);
			mv.addObject("list", list);
			System.out.println(list);
		}
		mv.setViewName("member/memberOrderInfo");
		return mv;
		
	}
	@GetMapping("orderInfoMore")
	public ModelAndView orderInfoMore(MemberVO memberVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		List<OrderInfoVO> list = memberService.orderInfoList(memberVO);
		mv.addObject("list", list);
		mv.setViewName("member/orderInfoMore");
		return mv;
	}
	

	@GetMapping("memberLogout")
	public ModelAndView memberLogout(HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		session.invalidate();
		mv.setViewName("redirect:../");
		return mv;
	}
	
	@GetMapping("memberLogin")
	public void memberLogin()throws Exception{
		
	}

	@PostMapping("memberLogin")
	public ModelAndView memberLogin(MemberVO memberVO,HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		memberVO = memberService.memberLogin(memberVO);
		if(memberVO==null) {
			mv.addObject("result", "Login Fail");
			mv.addObject("path", "./memberLogin");
			mv.setViewName("common/result");
		} else {
			if(memberVO.getStatus()==1) {
				mv.addObject("result", "탈퇴한 아이디입니다.");
				mv.addObject("path", "./memberLogin");
				mv.setViewName("common/result");
				
			} else {
				session.setAttribute("member", memberVO);
				mv.setViewName("redirect:../");
				
			}
		}
		return mv;
	}
	
	
	@GetMapping("memberJoin")
	public void memberJoin()throws Exception{
		
	}
	@GetMapping("memberJoin2")
	public void memberJoin2()throws Exception{
		
	}
	
	@PostMapping("memberJoin2")
	public ModelAndView memberJoin2(MemberVO memberVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		String phone = memberVO.getPhone();
		phone = phone.replaceAll("-", "");
		memberVO.setPhone(phone);
		for(int i=1;i<7;i++) {
			MyMenuVO myMenuVO = new MyMenuVO();
			myMenuVO.setId(memberVO.getId());
			myMenuVO.setId_index(memberVO.getId()+"_"+i);
			myMenuVO.setIndex_num(i);
			memberService.myMenuIndex(myMenuVO);
			
		}
		memberService.memberJoin(memberVO);
		mv.addObject("result", "회원가입 완료");
		mv.addObject("path", "/");
		mv.setViewName("common/result");
		return mv;
		
	}
	
	@PostMapping("idCheck")
	public ModelAndView idCheck(MemberVO memberVO)throws Exception{
		
		Pattern p = Pattern.compile("(?=.*[a-z])^[a-z0-9]{4,12}$");
		Matcher m = p.matcher(memberVO.getId());
		
		boolean check = m.find();
		ModelAndView mv = new ModelAndView();
		MemberVO id = new MemberVO();
		id = memberService.idCheck(memberVO);
		if(id==null && !memberVO.getId().equals("") && check) {
			mv.addObject("check", "success");
			mv.addObject("msg", "사용 가능한 아이디입니다!");
			
		} else if(id!=null){
			mv.addObject("check", "fail");
			mv.addObject("msg", "중복된 아이디입니다.");
		} else if(memberVO.getId().equals("")) {
			mv.addObject("check", "fail");
			mv.addObject("msg", "사용할 아이디를 입력해 주세요.");
			
		} else if(!check) {
			mv.addObject("check", "fail");
			mv.addObject("msg", "4~12자의 영문 소문자, 숫자가능 (숫자만 X,대문자 X,공백 X)");
			
		}
		mv.setViewName("member/idCheck");
		return mv;
	}
	

	@GetMapping("memberLoginAdmin")
	public void memberLoginAdmin()throws Exception{
		
	}
	
	@PostMapping("memberLoginAdmin")
	public ModelAndView memberLoginAdmin(MemberVO memberVO,HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		memberVO = memberService.memberLogin(memberVO);
		if(memberVO==null) {
			mv.addObject("result", "Login Fail");
			mv.addObject("path", "./memberLoginAdmin");
			mv.setViewName("common/result");
		} else {
			session.setAttribute("member", memberVO);
			mv.setViewName("redirect:../member/adminIndex");
		}
		return mv;
	}
	
	@GetMapping("adminLogout")
	public ModelAndView adminLogout(HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		session.invalidate();
		mv.setViewName("redirect:../member/memberLoginAdmin");
		return mv;
	}
	
	
	@GetMapping("adminIndex")
	public void adminIndex(HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberVO memberVO = (MemberVO)session.getAttribute("member");

		mv.addObject("member", memberVO);
		mv.setViewName("member/adminIndex");
	}
	

}
