package com.goodee.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.goodee.service.AdminOrderService;
import com.goodee.vo.detailOrderVO;
import com.goodee.vo.orderUser;

@Controller
public class AdminOrderController {
	public AdminOrderService service;

	public AdminOrderController(AdminOrderService service) {
		this.service = service;
	}
	
	// 결제 완료 리스트 가져오기
	// redirect를 하기 위해서 defaultValue를 1로 설정해주었다.
	@GetMapping("/adminOrder")
	public String selectAdminOrder(@RequestParam(value="delivstate", defaultValue = "1") int delivstate, Model model) {
			service.selectAdminOrder(delivstate, model);
		
		// orderState
		model.addAttribute("orderState1",service.orderState1());
		model.addAttribute("orderState2",service.orderState2());
		model.addAttribute("orderState3",service.orderState3());
		return "adminOrder/adminOrderList";
	}
	
	// delivnum insert
	@PostMapping("/adminorder/delivNumberInsert")
	public String delivNumberUpdate(orderUser ovo) {
		service.delivNumberUpdate(ovo);
		service.delivstatUpdate();
		return "redirect:/adminOrder";
	}
	
	// 주문취소
	@PostMapping("/orderCancel")
	public String orderCancel(int orderNum) {
		return "";
	}
	
	// 모달
	@PostMapping("/modal")
	@ResponseBody
	public List<detailOrderVO> selectOrderModal(@RequestBody detailOrderVO dvo){
		return service.selectOrderModal(dvo);
	}
	
	
}
