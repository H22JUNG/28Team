package com.goodee.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.goodee.service.AdminOrderService;
import com.goodee.vo.orderUser;

@Controller
public class AdminOrderController {
	public AdminOrderService service;

	public AdminOrderController(AdminOrderService service) {
		this.service = service;
	}
	
	// 결제 완료 리스트 가져오기
	@GetMapping("/adminOrder")
	public String selectAdminOrder(Model model) {
		service.selectAdminOrder(model);
		
		// orderState
		model.addAttribute("orderState1",service.orderState1());
		model.addAttribute("orderState2",service.orderState2());
		model.addAttribute("orderState3",service.orderState3());
		return "adminOrder/adminOrderList";
	}
	
	// delivnum update
	@PostMapping("/adminorder/delivNumberInsert")
	public String delivNumberUpdate(orderUser ovo) {
		service.delivNumberUpdate(ovo);
		service.delivstatUpdate();
		return "redirect:/adminOrder";
	}
	
	
}
