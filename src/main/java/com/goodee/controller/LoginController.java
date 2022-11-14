package com.goodee.controller;

import java.net.http.HttpRequest;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.goodee.service.LoginService;
import com.goodee.vo.UserVO;

@Controller
public class LoginController {
	public LoginService service;

	public LoginController(LoginService service) {
		this.service = service;
	}
	
	@GetMapping("/lostSession")
	public String lostSession(@RequestParam(required = false, value = "path", defaultValue = "1") int path, HttpServletRequest request) {
		request.setAttribute("path", path);
		return "lost-session";
	}
	
	
	@GetMapping("/loginpage")
	public String loginpage(HttpServletRequest request) {
		
		String uri = request.getHeader("Referer");
		if(uri != null && !uri.contains("/login")) {
			request.getSession().setAttribute("prevPage", uri);
		}
		
		return "login/login";
	}

	@GetMapping("/signuppage")
	public String signuppage() {
		return "login/sign_up";
	}
	
	@PostMapping("/login")
	public String login(UserVO vo, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		if(service.login(vo).get("login").equals("success")) {
			session = request.getSession();
			session.setAttribute("user", service.getUser(vo));
			session.setMaxInactiveInterval(60*60);
			
			if(request.getParameter("saveid") != null) {
				Cookie cookie = new Cookie("loginCookie", vo.getUserid());
				cookie.setMaxAge(60);
				cookie.setPath("/");
				response.addCookie(cookie);
			}else {
				Cookie[] cookies = request.getCookies();
				if(cookies != null && cookies.length > 0) {
					for (int i = 0; i < cookies.length; i++) {
						String cookiesName = cookies[i].getName();
						if(cookiesName.equals("loginCookie")){
							cookies[i].setMaxAge(0);
						}
					}
				}
			}
			if(service.isAdmin(vo) == true) {
				session.setAttribute("admin", "true");
				
			}
			
			if(session.getAttribute("prevPage") != null && session.getAttribute("lost") == null) {
				String uri = (String) session.getAttribute("prevPage");
				session.removeAttribute("prevPage");
				String[]uriArr = uri.split("/");
				uri = "";
				for (int i = 4; i < uriArr.length; i++) {
					uri += uriArr[i];
					uri += "/";
				}
				if(uri.length() > 1) {
				return "redirect:/" + uri.substring(0, uri.length() - 1);
				} else {
					session.removeAttribute("lost");
					return "redirect:/";
				}
			} else {
				return "redirect:/";
			}
		}else {
			session.invalidate();
			return "login/login";
		}
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
// 아이디 찾기
	@GetMapping("/findID")
	public String findID() {
		return "login/find_id";
	}
	
	
	
//	회원가입
	
//	아이디 중복
	@GetMapping("/idcheck")
	public String idcheck() {
		return "login/idcheck";
	}
	@PostMapping("/checkid")
	@ResponseBody
	public Map<String, String> checkid(@RequestBody UserVO vo) {
		return service.checkid(vo);
	}
	
	@PostMapping("/adduser")
	public String adduser(UserVO vo) {
		service.addUser(vo);
		return "login/add_user";
	}
	
//	약관 페이지
	@GetMapping("/terms")
	public String terms() {
		return "login/terms";
	}
	
// 내 정보 조회
	@PostMapping("/inquireInfo")
	public String inquireInfo(UserVO vo, HttpSession session) {
		if(service.inquireInfo(vo, session).get("pwcheck").equals("ok")) {
			return "redirect:/my_page/info";			
		} else {
			return "redirect:/mypage";
		}
	}
	
	@GetMapping("/my_page/info")
	public String inquireInfo2(HttpSession session, Model model) {
		service.inquireInfo2(session, model);
		return "info";
	}
	
	@PostMapping("/updateUser")
	public String updateUser(HttpSession session, UserVO vo) {
		vo.setUserid(((UserVO)session.getAttribute("user")).getUserid());
		service.updateUser(vo);
		vo.setPoint(((UserVO)session.getAttribute("user")).getPoint());
		session.setAttribute("user", vo);
		return "redirect:/my_page/info";
	}
	
	@GetMapping("/deleteUser")
	public String deleteUser(HttpSession session) {
		UserVO vo = new UserVO();
		vo.setUserid(((UserVO)session.getAttribute("user")).getUserid());
		service.deleteUser(vo);
		session.invalidate();
		return "redirect:/";
	}
}
