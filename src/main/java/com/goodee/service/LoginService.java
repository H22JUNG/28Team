package com.goodee.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.goodee.dao.LoginDAO;
import com.goodee.vo.UserVO;

@Service
public class LoginService {
	
	public LoginDAO dao;
	
	public LoginService(LoginDAO dao) {
		this.dao = dao;
	}

	
// 로그인
	public Map<String, String> login(UserVO vo) {
		Map<String,String> map = new HashMap<String, String>();
		if(dao.login(vo)==1) {
			map.put("login", "success");
		}else {
			map.put("login", "false");
		}
		return map;
	}
	
	public UserVO getUser(UserVO vo) {
		return dao.getUser(vo);
	}
	
	public Boolean isAdmin(UserVO vo) {
		if(dao.isAdmin(vo)==1) {
			return true;
		} else {
			return false;
		}
	}
	
//	회원가입
	public void addUser(UserVO vo) {
		dao.addUser(vo);
	}
	public Map<String, String> checkid(UserVO vo) {
		Map<String, String> map = new HashMap<String, String>();
		if(dao.checkid(vo) > 0) {
			map.put("state", "fail");
		} else {
			map.put("state", "success");
		}
		return map;
	}
}
