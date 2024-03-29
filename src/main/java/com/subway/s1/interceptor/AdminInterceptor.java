package com.subway.s1.interceptor;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.subway.s1.member.MemberVO;

@Component
public class AdminInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		boolean check = false;
		
		MemberVO memberVO = (MemberVO)request.getSession().getAttribute("member");
		
		if(memberVO != null && memberVO.getId().equals("admin")) {
			check = true;
		}else {
			request.setAttribute("result", "관리자모드 입니다.");
			request.setAttribute("path", "../member/adminIndex");
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/result.jsp"); 
			view.forward(request, response);
		}
		
	
		return check;
	}
	

}


