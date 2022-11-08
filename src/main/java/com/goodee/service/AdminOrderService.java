package com.goodee.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.goodee.dao.ProjectDAO;
import com.goodee.vo.detailOrderVO;
import com.goodee.vo.orderUser;

@Service
public class AdminOrderService {
	
	public ProjectDAO dao;

	public AdminOrderService(ProjectDAO dao) {
		this.dao = dao;
	}
	
	// 결제 완료 리스트 가져오기
	public void selectAdminOrder(int delivstate, Model model) {
		try {
			if(dao.selectAdminOrder(delivstate).size() != 0) {
				model.addAttribute("orderList",dao.selectAdminOrder(delivstate));
			}
			dao.updateNull();
		} catch (IndexOutOfBoundsException e) {
			e.printStackTrace();
		}
	}
	
	// 모달
	public List<detailOrderVO> selectOrderModal(detailOrderVO dvo) {
		return dao.selectOrderModal(dvo);
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
	
	// 환불처리
	public void orderCancel(orderUser ovo) {
		dao.orderCancel(ovo);
		dao.cancelPointUpdate(ovo);
		dao.cancelCountUpdate(ovo);
	}
	
	// 검색기능
	public List<orderUser> orderSerch(orderUser ovo) {
		List<orderUser> list = dao.orderSerch(ovo);
		return list;
	}
}
