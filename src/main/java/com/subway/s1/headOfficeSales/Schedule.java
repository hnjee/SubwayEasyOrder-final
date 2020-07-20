package com.subway.s1.headOfficeSales;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.subway.s1.product.ProductService;

@Component
public class Schedule {
	
	@Autowired
	private ProductService productService; 
	
	@Scheduled(cron = "0 0 9 * * *")
	public void BreakfastOpen()throws Exception{
		productService.sw4Update(1);
		System.out.println("아침메뉴 open 성공");
	}
	@Scheduled(cron = "0 0 11 * * *")
	public void BreakfastClose()throws Exception{
		productService.sw4Update(0);
		System.out.println("아침메뉴 close 성공");
	}

}
