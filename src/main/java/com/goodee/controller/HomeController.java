package com.goodee.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.goodee.service.ListService;

@Controller
public class HomeController {
	public ListService service;
	
	public HomeController(ListService service) {
		this.service = service;
	}

	@RequestMapping(value="/") 
	public String home(Model model, HttpServletRequest request) {
		service.selectTotalBest(model);
		service.selectBestReview(model);
		try {
			request.setCharacterEncoding("utf-8");
			// 쿠키 정보를 얻기
			Cookie[] cookies = request.getCookies();
			// 쿠키에 값이 있다면
			if(cookies != null) {
				for(int i = 0; i<cookies.length; i++){
					String name = cookies[i].getName(); // 쿠키 이름
					//String value = cookies[i].getValue(); // 쿠키 값
					if(name.equals("popupClose")){
						model.addAttribute("cookie", name);
					}
				}
			}
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "main";
	}
	
	@GetMapping("/makeCookie")
	@ResponseBody
	public void makeCookie(HttpServletResponse response, HttpServletRequest request) {
		try {
			request.setCharacterEncoding("utf-8");
			// 쿠키 지정 name, value
			Cookie cookie = new Cookie("popupClose", "oneDay");
			// 쿠키의 유효시간 설정(하루)
			cookie.setMaxAge(60*60*24);
			// 쿠키 추가
			response.addCookie(cookie);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
