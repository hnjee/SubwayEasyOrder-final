package com.subway.s1.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.subway.s1.ingredient.IngredientVO;
import com.subway.s1.menu.MenuVO;
import com.subway.s1.mymenu.MyMenuVO;
import com.subway.s1.orderInfo.OrderInfoVO;
import com.subway.s1.point.PointVO;
import com.subway.s1.store.StoreVO;
import com.subway.s1.util.Pager;

@Service
public class MemberService {
	@Autowired
	private MemberRepository memberRepository;
	
	public MemberVO idCheck(MemberVO memberVO)throws Exception{
		return memberRepository.idCheck(memberVO);
	}
	
	public MemberVO memberLogin(MemberVO memberVO)throws Exception{
		return memberRepository.memberLogin(memberVO);
	}

	public void memberJoin(MemberVO memberVO)throws Exception{
		memberRepository.memberJoin(memberVO);
	}
	
	public List<OrderInfoVO> orderInfoList(MemberVO memberVO)throws Exception{
		return memberRepository.orderInfoList(memberVO);
	}
	
	public List<OrderInfoVO> selectList(OrderInfoVO orderInfoVO)throws Exception{
		return memberRepository.selectList(orderInfoVO);
	}
	public List<OrderInfoVO> detailIngre(OrderInfoVO orderInfoVO)throws Exception{
		return memberRepository.detailIngre(orderInfoVO);
	}

	public int memberStoreUpdate(MemberVO memberVO) throws Exception{
		return memberRepository.memberStoreUpdate(memberVO);
	}

	public List<MenuVO> swSelect()throws Exception{
		return memberRepository.swSelect();
	}
	
	public List<IngredientVO> ingreList()throws Exception{
		return memberRepository.ingreList();
	}
	public void myMenuUpdate(MyMenuVO myMenuVO)throws Exception{
		memberRepository.myMenuUpdate(myMenuVO);
	}
	
	public List<MyMenuVO> myMenuList(MemberVO memberVO)throws Exception{
		return memberRepository.myMenuList(memberVO);
	}
	public void mcInsert(MyMenuVO myMenuVO) throws Exception{
		memberRepository.mcInsert(myMenuVO);
	}
	public List<MyMenuVO> mmList(MemberVO memberVO)throws Exception{
		return memberRepository.mmList(memberVO);
	}
	public void myMenuIndex(MyMenuVO myMenuVO)throws Exception{
		memberRepository.myMenuIndex(myMenuVO);
	}
	
	public void myMenuDel(MyMenuVO myMenuVO)throws Exception{
		memberRepository.myMenuDel(myMenuVO);
		memberRepository.myMenuDel2(myMenuVO);
	}
	public int memberPointUpdate(MemberVO memberVO) throws Exception{
		return memberRepository.memberPointUpdate(memberVO);

	}
	public int orderCount(MemberVO memberVO)throws Exception{
		return memberRepository.orderCount(memberVO);
	}
	public MyMenuVO myMenuOrder(String id_index)throws Exception{
		return memberRepository.myMenuOrder(id_index);
	}
	public List<MenuVO> setSide()throws Exception{
		return memberRepository.setSide();
	}
	public List<StoreVO> oftenStore(MemberVO memberVO)throws Exception{
		return memberRepository.oftenStore(memberVO);
	}
	public void oftenStoreDel(MemberVO memberVO)throws Exception{
		 memberRepository.oftenStoreDel(memberVO);
	}
	public List<StoreVO> lastStore(MemberVO memberVO)throws Exception{
		return memberRepository.lastStore(memberVO);
	}
	public List<StoreVO> allStore()throws Exception{
		return memberRepository.allStore();
	}
	public List<PointVO> memberPoint(MemberVO memberVO)throws Exception{
		return memberRepository.memberPoint(memberVO);
	}
	public List<MyMenuVO> menuOutCheck(MyMenuVO myMenuVO)throws Exception{
		return memberRepository.menuOutCheck(myMenuVO);
	}
	public List<String> ingreOutCheck(String storeNum)throws Exception{
		return memberRepository.ingreOutCheck(storeNum);
	}
}
