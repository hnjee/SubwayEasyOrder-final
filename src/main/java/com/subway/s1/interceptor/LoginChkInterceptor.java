package com.subway.s1.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.subway.s1.member.MemberVO;

@Component
public class LoginChkInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		boolean check = false;
		MemberVO memberVO = (MemberVO)request.getSession().getAttribute("member");
		if(memberVO!=null) {
			check=true;
		} else {
			response.sendRedirect("../member/memberLogin");
		}
		
		return check;
	}
}
