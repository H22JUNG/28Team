package com.goodee.vo;

import org.apache.ibatis.type.Alias;
//유진 VO
// DB에 주문자 정보 추가하는 vo

@Alias("orderUser")
public class orderUser {
	
	private String userid;
	private int cartListNum;
	private String orderName;
	private String orderDate;
	private String pay;
	private String address;
	private String detailAddress;
	private String extraAddress;
	private String orderTel;
	private String orderNum;
	private int totalPrice;
	private String payResult;
	private int point;
	
	private int delivstate;
	private String delivnum;
	
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getCartListNum() {
		return cartListNum;
	}
	public void setCartListNum(int cartListNum) {
		this.cartListNum = cartListNum;
	}
	public String getOrderName() {
		return orderName;
	}
	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public String getPay() {
		return pay;
	}
	public void setPay(String pay) {
		this.pay = pay;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDetailAddress() {
		return detailAddress;
	}
	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}
	public String getExtraAddress() {
		return extraAddress;
	}
	public void setExtraAddress(String extraAddress) {
		this.extraAddress = extraAddress;
	}
	public String getOrderTel() {
		return orderTel;
	}
	public void setOrderTel(String orderTel) {
		this.orderTel = orderTel;
	}
	public String getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getPayResult() {
		return payResult;
	}
	public void setPayResult(String payResult) {
		this.payResult = payResult;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getDelivstate() {
		return delivstate;
	}
	public void setDelivstate(int delivstate) {
		this.delivstate = delivstate;
	}
	public String getDelivnum() {
		return delivnum;
	}
	public void setDelivnum(String delivnum) {
		this.delivnum = delivnum;
	}
	
	
}
