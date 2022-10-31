package com.goodee.vo;

import org.apache.ibatis.type.Alias;

@Alias("userVO")
public class UserVO {

	private int id;
	private String userid;
	private String password;
	private String username;
	private String tel;
	private String address;
	private String email;
	private int point;
	private int usercount;
	private int admin;

	public int getAdmin() {
		return admin;
	}
	public void setAdmin(int admin) {
		this.admin = admin;
	}
	public UserVO() {
		// TODO Auto-generated constructor stub
	}
	public UserVO(String key, String value) {
		// options 설정
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getUsercount() {
		return usercount;
	}
	public void setUsercount(int usercount) {
		this.usercount = usercount;
	}
	
	
}
