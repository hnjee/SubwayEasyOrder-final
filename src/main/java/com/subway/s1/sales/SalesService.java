package com.subway.s1.sales;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.subway.s1.util.Pager;

import com.subway.s1.cart.CartVO;
import com.subway.s1.store.StoreRepository;

@Service
@Transactional(rollbackFor = Exception.class) // 예외처리
public class SalesService {

	@Autowired
	private SalesRepository salesRepository;
	
	//ByProductVO
	public List<ByProductVO> ByProduct(String from, String to, Pager pager,String storeNum)throws Exception{

		//오늘날짜 만들기
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int mon = cal.get(Calendar.MONTH)+1;
		int day = cal.get(Calendar.DAY_OF_MONTH);
		
		String yy = Integer.toString(year);
		String mm = Integer.toString(mon);
		
		if(mm.length() < 2) {
			mm = '0'+mm;
		}
		String dd = Integer.toString(day);
		String dd2 = Integer.toString(day+1);
		
		if(dd.length()<2 || dd2.length()<2) {
			dd = '0'+dd;
			dd2 = '0'+dd2;
		}
		
		String tfrom = yy+"-"+mm+"-"+dd;
		String tto = yy+"-"+mm+"-"+dd2;
		
		System.out.println("today"+tfrom);

		if(from==null && to==null) {
			from = tfrom;
			to = tto;
		}else {
			//to 문자열의 끝에 day만 자르는 작업
			String ddd =  to.substring(8, 10);
			//자른 day를 숫자로 전환
			int ddd2 = Integer.parseInt(ddd);
			//to 문자열에 day빼고 앞부분 가져오기
			String main = to.substring(0, 8);
			//day를 숫자로 변환하여 1 더해주기
			System.out.println("mainnn: "+main);
			String to2 = Integer.toString(ddd2+1);
			//to2의 길이가 2보다 작을경우 앞에 0 붙여주기
			if(to2.length()<2) {
				to2 = '0'+to2;
			}
			//to에 최종날짜 합쳐서 넣기
			to = main+to2;
		}
		
		//Pager
		pager.makeRow();
		long totalCount = salesRepository.getProductTotal(pager, from, to,storeNum);
		System.out.println("from : " + from);
		System.out.println("to : "+ to);
		pager.makePage(totalCount);
		
		List<ByProductVO> ar = salesRepository.getByProduct(from, to, pager,storeNum);

		if(ar != null) {
		
		for(int i=0;i<ar.size();i++) {
			
			String menuNum = ar.get(i).getMenuNum();
			
			ar.get(i).setProductCount(salesRepository.getMenuCount(menuNum,storeNum, from, to));
			
			String menuPrice = salesRepository.getMenuPrice(menuNum,storeNum, from, to);
			
			if(menuPrice==null) {
				menuPrice = "0";
			}
			ar.get(i).setProductPrice(menuPrice);
			
			if(ar.get(i).getMenuCode().equals("SW")) {
				ar.get(i).setMenuCode("샌드위치");
		
			}else if(ar.get(i).getMenuCode().equals("WR")) {
				ar.get(i).setMenuCode("랩");

			}else if(ar.get(i).getMenuCode().equals("SA")) {
				ar.get(i).setMenuCode("샐러드");
		
			}else if(ar.get(i).getMenuCode().equals("GR")) {
				ar.get(i).setMenuCode("단체메뉴");
			
			}else {
				ar.get(i).setMenuCode("사이드");
			
			}
			
		}
			
	}

		return ar;
	}

	
	//ByOrder
	public List<ByOrderVO> ByOrder(String from, String to, Pager pager,String storeNum)throws Exception{

		
//		System.out.println(from==null);
//		System.out.println(from.equals(""));
		
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int mon = cal.get(Calendar.MONTH)+1;
		int day = cal.get(Calendar.DAY_OF_MONTH);
		
		String yy = Integer.toString(year);
		String mm = Integer.toString(mon);
		
		if(mm.length() < 2) {
			mm = '0'+mm;
		}
		
		String dd = Integer.toString(day);
		String dd2 = Integer.toString(day+1);
		
		if(dd.length()<2 || dd2.length()<2) {
			dd = '0'+dd;
			dd2 = '0'+dd2;
		}
		
		String tfrom = yy+"-"+mm+"-"+dd;
		String tto = yy+"-"+mm+"-"+dd2;
		
		System.out.println("dddddddddddd"+tfrom);

		if(from==null && to==null) {
			from = tfrom;
			to = tto;
		}else {
			//to 문자열의 끝에 day만 자르는 작업
			String ddd =  to.substring(8, 10);
			//자른 day를 숫자로 전환
			int ddd2 = Integer.parseInt(ddd);
			//to 문자열에 day빼고 앞부분 가져오기
			String main = to.substring(0, 8);
			//day를 숫자로 변환하여 1 더해주기
			String to2 = Integer.toString(ddd2+1);
			//to2의 길이가 2보다 작을경우 앞에 0 붙여주기
			if(to2.length()<2) {
				to2 = '0'+to2;
			}
			//to에 최종날짜 합쳐서 넣기
			to = main+to2;
		}
		
		//Pager
		pager.makeRow();
		long totalCount = salesRepository.getOrderTotal(pager, from, to,storeNum);
		pager.makePage(totalCount);
		System.out.println("from : " + from);
		System.out.println("to : "+ to);
		List<ByOrderVO> ar = salesRepository.getByOrder(from, to, pager,storeNum);

		return ar;
	}
	
	public ByProductVO allMenu(String from, String to,String storeNum)throws Exception{
		//오늘날짜 만들기
				Calendar cal = Calendar.getInstance();
				int year = cal.get(Calendar.YEAR);
				int mon = cal.get(Calendar.MONTH)+1;
				int day = cal.get(Calendar.DAY_OF_MONTH);
				
				String yy = Integer.toString(year);
				String mm = Integer.toString(mon);
				
				if(mm.length() < 2) {
					mm = '0'+mm;
				}
				String dd = Integer.toString(day);
				String dd2 = Integer.toString(day+1);
				
				if(dd.length()<2 || dd2.length()<2) {
					dd = '0'+dd;
					dd2 = '0'+dd2;
				}
				
				String tfrom = yy+"-"+mm+"-"+dd;
				String tto = yy+"-"+mm+"-"+dd2;
				
				System.out.println("today"+tfrom);

				if(from==null && to==null) {
					from = tfrom;
					to = tto;
				}else {
					//to 문자열의 끝에 day만 자르는 작업
					String ddd =  to.substring(8, 10);
					//자른 day를 숫자로 전환
					int ddd2 = Integer.parseInt(ddd);
					//to 문자열에 day빼고 앞부분 가져오기
					String main = to.substring(0, 7);
					//day를 숫자로 변환하여 1 더해주기
					String to2 = "-"+Integer.toString(ddd2+1);
					//to에 최종날짜 합쳐서 넣기
					to = main+to2;
				}
				
		ByProductVO byProductVO = new ByProductVO();
		
		//메뉴 총 수량
		byProductVO.setAllMenuCount(salesRepository.getAllMenuCount(storeNum, from, to));
		//메뉴 총 합계금액
		byProductVO.setAllMenuPrice(salesRepository.getAllMenuPrice(storeNum, from, to));
		
		return byProductVO;
	}
	
	
	//환불
	public int byRefund(String payNum,String storeNum)throws Exception{
		return salesRepository.byRefund(payNum,storeNum);
	}
	
	public int oriPoint(String id)throws Exception{
		return salesRepository.oriPoint(id);
	}
	
	
	public ByOrderVO modal(String payNum, String storeNum)throws Exception{
		ByOrderVO byOrderVO = new ByOrderVO();
		byOrderVO = salesRepository.getModal(payNum,storeNum);

		return byOrderVO;
	}


	//-------------sihyun--------------------------------------------//
	public List<ByPeriodVO> byDay(String from, String to,String storeNum) throws Exception{
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int mon = cal.get(Calendar.MONTH)+1;
		int day = cal.get(Calendar.DAY_OF_MONTH);
		
		String yy = Integer.toString(year);
		String mm = Integer.toString(mon);
		
		if(mm.length() < 2) {
			mm = '0'+mm;
		}
		
		String dd = Integer.toString(day);
		String dd2 = Integer.toString(day+1);
		
		if(dd.length()<2 || dd2.length()<2) {
			dd = '0'+dd;
			dd2 = '0'+dd2;
		}
		
		String tfrom = yy+"-"+mm+"-"+dd;
		String tto = yy+"-"+mm+"-"+dd2;
		
		System.out.println("dddddddddddd"+tfrom);

		if(from==null && to==null) {
			from = tfrom;
			to = tto;
		}else {
			//to 문자열의 끝에 day만 자르는 작업
			String ddd =  to.substring(8, 10);
			//자른 day를 숫자로 전환
			int ddd2 = Integer.parseInt(ddd);
			//to 문자열에 day빼고 앞부분 가져오기
			String main = to.substring(0, 7);
			//day를 숫자로 변환하여 1 더해주기
			String to2 = "-"+Integer.toString(ddd2+1);
			//to에 최종날짜 합쳐서 넣기
			to = main+to2;
		}
		List<ByPeriodVO>ar2 = new ArrayList<>(7);
		List<ByPeriodVO>ar =salesRepository.byDay(from, to,storeNum);

		
		return salesRepository.byDay(from, to,storeNum);
	}

	public List<ByPeriodVO> byPeriod(String from, String to, Pager pager,String storeNum) throws Exception{
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int mon = cal.get(Calendar.MONTH)+1;
		int day = cal.get(Calendar.DAY_OF_MONTH);
		
		String yy = Integer.toString(year);
		String mm = Integer.toString(mon);
		
		if(mm.length() < 2) {
			mm = '0'+mm;
		}
		
		String dd = Integer.toString(day);
		String dd2 = Integer.toString(day+1);
		
		if(dd.length()<2 || dd2.length()<2) {
			dd = '0'+dd;
			dd2 = '0'+dd2;
		}
		
		String tfrom = yy+"-"+mm+"-"+dd;
		String tto = yy+"-"+mm+"-"+dd2;
		
		System.out.println("dddddddddddd"+tfrom);

		if(from==null && to==null) {
			from = tfrom;
			to = tto;
		}else {
			//to 문자열의 끝에 day만 자르는 작업
			String ddd =  to.substring(8, 10);
			//자른 day를 숫자로 전환
			int ddd2 = Integer.parseInt(ddd);
			//to 문자열에 day빼고 앞부분 가져오기
			String main = to.substring(0, 8);
			System.out.println("main:"+main);
			//day를 숫자로 변환하여 1 더해주기

			String to2 = Integer.toString(ddd2+1);

			if(to2.length()<2) {
				to2='0'+to2;
			}

			//to에 최종날짜 합쳐서 넣기
			to = main+to2;
			
		}
		
		//pager
		pager.makeRow();
		long totalCount=salesRepository.byPeriodCount(from, to,pager,storeNum);
		pager.makePage(totalCount);
		System.out.println("pagerStartRow:"+pager.getStartRow());

		return salesRepository.byPeriod(from, to,pager,storeNum);

	}
	
	public List<ByPeriodVO> byTime(String from, String to, Pager pager,String storeNum) throws Exception{
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int mon = cal.get(Calendar.MONTH)+1;
		int day = cal.get(Calendar.DAY_OF_MONTH);
		
		String yy = Integer.toString(year);
		String mm = Integer.toString(mon);
		
		if(mm.length() < 2) {
			mm = '0'+mm;
		}
		
		String dd = Integer.toString(day);
		String dd2 = Integer.toString(day+1);
		
		if(dd.length()<2 || dd2.length()<2) {
			dd = '0'+dd;
			dd2 = '0'+dd2;
		}
		
		String tfrom = yy+"-"+mm+"-"+dd;
		String tto = yy+"-"+mm+"-"+dd2;
		
		System.out.println("dddddddddddd"+tfrom);

		if(from==null && to==null) {
			from = tfrom;
			to = tto;
		}else {
			//to 문자열의 끝에 day만 자르는 작업
			String ddd =  to.substring(8, 10);
			//자른 day를 숫자로 전환
			int ddd2 = Integer.parseInt(ddd);
			//to 문자열에 day빼고 앞부분 가져오기
			String main = to.substring(0, 7);
			//day를 숫자로 변환하여 1 더해주기
			String to2 = "-"+Integer.toString(ddd2+1);
			//to에 최종날짜 합쳐서 넣기
			to = main+to2;
		}
		//pager
				pager.makeRow();
				long totalCount=salesRepository.byTimeCount(from,to,pager,storeNum);
				pager.makePage(totalCount);
				System.out.println("pagerStartRow:"+pager.getStartRow());

		return salesRepository.byTime(from, to,pager,storeNum);
	}
	
	public int salesInsert(CartVO cartVO) throws Exception{
		return salesRepository.salesInsert(cartVO);
	}
	
}//END CLASS
