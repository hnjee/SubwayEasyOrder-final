package com.subway.s1.member;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.subway.s1.franchise.FranchiseVO;

//import com.subway.s1.ingredient.IngredientVO;
//import com.subway.s1.menu.MenuVO;
//import com.subway.s1.mymenu.MyMenuVO;
//import com.subway.s1.orderInfo.OrderInfoVO;
//import com.subway.s1.point.PointVO;
//import com.subway.s1.store.StoreVO;
//import com.subway.s1.util.Pager;


@Repository
@Mapper
public interface MemberRepository {
	public int memberStoreUpdate(MemberVO memberVO) throws Exception;
	public MemberVO idCheck(MemberVO memberVO)throws Exception;
	public MemberVO memberLogin(MemberVO memberVO)throws Exception;


	
	public void memberJoin(MemberVO memberVO)throws Exception;
	
//	public List<OrderInfoVO> selectList(OrderInfoVO orderInfoVO)throws Exception;
//	
//	
//	public List<OrderInfoVO> orderInfoList(MemberVO memberVO)throws Exception;
//	
//	public List<OrderInfoVO> detailIngre(OrderInfoVO orderInfoVO)throws Exception;
//	
//	public List<MenuVO> swSelect()throws Exception;
//	
//	public List<IngredientVO> ingreList()throws Exception;
//	
//	public void myMenuUpdate(MyMenuVO myMenuVO)throws Exception;
//	
//	public List<MyMenuVO> myMenuList(MemberVO memberVO)throws Exception;
//	
//	public void mcInsert(MyMenuVO myMenuVO)throws Exception;
//	public List<MyMenuVO> mmList(MemberVO memberVO)throws Exception;
//	public void myMenuIndex(MyMenuVO myMenuVO)throws Exception;
//	public void myMenuDel(MyMenuVO myMenuVO)throws Exception;
//	public void myMenuDel2(MyMenuVO myMenuVO)throws Exception;
//
//
	public int memberPointUpdate(MemberVO memberVO) throws Exception;
//	public int orderCount(MemberVO memberVO)throws Exception;
//	public MyMenuVO myMenuOrder(String id_index)throws Exception;
//	public List<MenuVO> setSide()throws Exception;
//	public List<StoreVO> oftenStore(MemberVO memberVO)throws Exception;
//	public void oftenStoreDel(MemberVO memberVO)throws Exception;
//	public List<StoreVO> lastStore(MemberVO memberVO)throws Exception;
//	public List<StoreVO> allStore()throws Exception;
//	public List<PointVO> memberPoint(MemberVO memberVO)throws Exception;
	
	public int ownerInsert(FranchiseVO franchiseVO) throws Exception;
}

