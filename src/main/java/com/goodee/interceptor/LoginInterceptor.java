package com.goodee.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class LoginInterceptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();
		if(session.getAttribute("user") != null) {
			return true;
		} else {
			session.invalidate();
			response.sendRedirect(request.getContextPath()+"/lostSession");
			return false;
		}
	}
	

}
