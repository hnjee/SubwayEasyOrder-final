package com.subway.s1.headOfficeSales;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.subway.s1.product.ProductVO;
import com.subway.s1.sales.ByOrderVO;
import com.subway.s1.sales.ByPeriodVO;
import com.subway.s1.sales.ByProductVO;
import com.subway.s1.util.Pager;



@Service
@Transactional(rollbackFor = Exception.class) // 예외처리
public class HeadOfficeSalesService {

	@Autowired
	private HeadOfficeSalesRepository headOfficeSalesRepository;


	//ByProductVO
	public List<ByProductVO> ByProduct(String from, String to, Pager pager)throws Exception{

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
		
		//Pager
		pager.makeRow();
		long totalCount = headOfficeSalesRepository.getProductTotal(pager, from, to);
		pager.makePage(totalCount);

		List<ByProductVO> ar = headOfficeSalesRepository.getByProduct(from, to, pager);

		if(ar != null) {
		for(int i=0;i<ar.size();i++) {
			
			String menuNum = ar.get(i).getMenuNum();
			//메뉴별 수량
			ar.get(i).setProductCount(headOfficeSalesRepository.getMenuCount(menuNum, from, to));	
			//메뉴별 총금액
			String menuPrice = headOfficeSalesRepository.getMenuPrice(menuNum, from, to);

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

	public ByProductVO allMenu(String from, String to)throws Exception{
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
		byProductVO.setAllMenuCount(headOfficeSalesRepository.getAllMenuCount(from, to));
		//메뉴 총 합계금액
		byProductVO.setAllMenuPrice(headOfficeSalesRepository.getAllMenuPrice(from, to));
		
		return byProductVO;
	}
	
	
	//ByOrder
	public List<ByOrderVO> ByOrder(String from, String to, Pager pager)throws Exception{

		
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
			String main = to.substring(0, 7);
			//day를 숫자로 변환하여 1 더해주기
			String to2 = "-"+Integer.toString(ddd2+1);
			//to에 최종날짜 합쳐서 넣기
			to = main+to2;
		}
		
		//Pager
		pager.makeRow();
		long totalCount = headOfficeSalesRepository.getOrderTotal(pager, from, to);
		pager.makePage(totalCount);
		
		List<ByOrderVO> ar = headOfficeSalesRepository.getByOrder(from, to, pager);

		return ar;
	}
	
	public ByOrderVO modal(String payNum)throws Exception{
		ByOrderVO byOrderVO = new ByOrderVO();
		byOrderVO = headOfficeSalesRepository.getModal(payNum);

		return byOrderVO;
	}


	//-------------sihyun---------------//
	public List<ByPeriodVO> byDay(String from, String to) throws Exception{
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
		List<ByPeriodVO>ar =headOfficeSalesRepository.byDay(from, to);

		
		return headOfficeSalesRepository.byDay(from, to);
	}

	public List<ByPeriodVO> byPeriod(String from, String to, Pager pager) throws Exception{
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
		long totalCount=headOfficeSalesRepository.byPeriodCount(from, to,pager);
		pager.makePage(totalCount);
		System.out.println("pagerStartRow:"+pager.getStartRow());

		return headOfficeSalesRepository.byPeriod(from, to,pager);

	}
	
	public List<ByPeriodVO> byTime(String from, String to, Pager pager) throws Exception{
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
				long totalCount=headOfficeSalesRepository.byTimeCount(from,to,pager);
				pager.makePage(totalCount);
				System.out.println("pagerStartRow:"+pager.getStartRow());

		return headOfficeSalesRepository.byTime(from, to,pager);
	}
}//END CLASS
