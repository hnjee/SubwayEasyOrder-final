package com.subway.s1.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.subway.s1.interceptor.AdminInterceptor;
import com.subway.s1.interceptor.LoginChkInterceptor;
import com.subway.s1.interceptor.ManagersInterceptor;
import com.subway.s1.interceptor.MemberLoginAdmin;
import com.subway.s1.interceptor.OwnerInterceptor;
import com.subway.s1.interceptor.StaffInterceptor;
import com.subway.s1.interceptor.SurveyInterceptor;

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
	@Autowired
	private MemberLoginAdmin memberLoginAdmin;
	@Autowired
	private ManagersInterceptor managersInterceptor;
	@Autowired
	private SurveyInterceptor surveyInterceptor;
	
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(loginChkInterceptor)
		.addPathPatterns("/member/*")
		.addPathPatterns("/cart/*")
		.addPathPatterns("/menu/*")
		.addPathPatterns("/payment/*")
		.addPathPatterns("/store/*")

		.excludePathPatterns("/member/memberLogin")
		.excludePathPatterns("/member/memberJoin")
		.excludePathPatterns("/member/memberJoin2")
		.excludePathPatterns("/cart/howToUse")
		.excludePathPatterns("/store/storeSearch")
		.excludePathPatterns("/store/storeSearch2")
		.excludePathPatterns("/store/findStore")
		.excludePathPatterns("/menu/showMenuList")
		.excludePathPatterns("/menu/showMenuSelect")
		
		.excludePathPatterns("/member/memberLoginAdmin")
		.excludePathPatterns("/member/adminIndex");
		
		
		
		
		
		registry.addInterceptor(adminInterceptor)
		.addPathPatterns("/headOfficeSales/*")
		.addPathPatterns("/product/headOfficeProductList")
		.addPathPatterns("/product/headOfficeProductRegister")
		.addPathPatterns("/ingredient/headOfficeIngredientList")
		.addPathPatterns("/ingredient/ingredientRegister")
		.addPathPatterns("/ownerManagement/ownerList");
		
		registry.addInterceptor(ownerInterceptor)
		.addPathPatterns("/sales/*")
		.addPathPatterns("/store/storeManage")
		.excludePathPatterns("/sales/byOrder");
		
		registry.addInterceptor(staffInterceptor)

		.addPathPatterns("/product/productList")
		.addPathPatterns("/ingredient/ingredientList")
		.addPathPatterns("/store/storeOC")
		.addPathPatterns("/payment/orderList")
		.addPathPatterns("/sales/byOrder")
		.excludePathPatterns("/store/storeManage");

		registry.addInterceptor(memberLoginAdmin)
		.addPathPatterns("/member/adminIndex");
		
		registry.addInterceptor(managersInterceptor)
		.addPathPatterns("/store/storeList")
		.addPathPatterns("/menu/menuSelect")
		.addPathPatterns("/cart/cartList")
		.addPathPatterns("payment/paymentOngoing")
		.addPathPatterns("payment/paymentSuccess");
		
		registry.addInterceptor(surveyInterceptor)
		.addPathPatterns("/survey/*");
	}

}
