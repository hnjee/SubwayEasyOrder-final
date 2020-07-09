package com.subway.s1.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.subway.s1.interceptor.AdminInterceptor;
import com.subway.s1.interceptor.LoginChkInterceptor;
import com.subway.s1.interceptor.OwnerInterceptor;
import com.subway.s1.interceptor.StaffInterceptor;

@Component
public class InterceptorConfig implements WebMvcConfigurer {
	@Autowired
	LoginChkInterceptor loginChkInterceptor;
	@Autowired
	private AdminInterceptor adminInterceptor; 
	@Autowired
	private OwnerInterceptor ownerInterceptor; 
	@Autowired
	private StaffInterceptor staffInterceptor; 
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(loginChkInterceptor)
		.addPathPatterns("/cart/*")
		.addPathPatterns("/menu/*")
		.addPathPatterns("/payment/*")
		.excludePathPatterns("/cart/howToUse");
		
		registry.addInterceptor(adminInterceptor)
		.addPathPatterns("/headOfficeSales/*")
		.addPathPatterns("/product/headOfficeProductList")
		.addPathPatterns("/product/headOfficeProductRegister");
		
		registry.addInterceptor(ownerInterceptor)
		.addPathPatterns("/sales/*");

		registry.addInterceptor(staffInterceptor)
		.addPathPatterns("/product/productList")
		.addPathPatterns("/ingredient/ingredientList")
		.addPathPatterns("/store/storeOC")
		.addPathPatterns("/payment/orderList");



	}
	
	
}
