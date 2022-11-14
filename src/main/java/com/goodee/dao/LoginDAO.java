package com.goodee.dao;

import org.apache.ibatis.annotations.Mapper;

import com.goodee.vo.UserVO;

@Mapper
public interface LoginDAO {
	
	// 로그인
	public int login(UserVO vo);
	public UserVO getUser(UserVO vo);
	public int isAdmin(UserVO vo);
	
	//회원가입
	public void addUser(UserVO vo);
	public int checkid(UserVO vo);
	
	// 내 정보 수정
	public void updateUser(UserVO vo);
	public void deleteUser(UserVO vo);
}
