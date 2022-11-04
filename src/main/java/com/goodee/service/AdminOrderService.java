package com.goodee.service;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.goodee.dao.ProjectDAO;
import com.goodee.vo.orderUser;

@Service
public class AdminOrderService {
	
	public ProjectDAO dao;

	public AdminOrderService(ProjectDAO dao) {
		this.dao = dao;
	}
	
	// 결제 완료 리스트 가져오기
	public void selectAdminOrder(Model model) {
		model.addAttribute("orderList",dao.selectAdminOrder());
	}
	
	// delivnum update
	public void delivNumberUpdate(orderUser ovo) {
		dao.delivNumberUpdate(ovo);
	}
	public void delivstatUpdate() {
		dao.delivstatUpdate2();
		dao.delivstatUpdate1();
	}
	
	
	public int orderState1() {
		int i = dao.orderState1();
		return i;
	}
	public int orderState2() {
		int i = dao.orderState2();
		return i;
	}
	public int orderState3() {
		int i = dao.orderState3();
		return i;
	}
}