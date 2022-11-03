package com.goodee.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.goodee.service.PayService;
import com.goodee.vo.CartSession;
import com.goodee.vo.CartVO;
import com.goodee.vo.UserVO;
import com.goodee.vo.orderUser;

@Controller
public class PayController {
	
	private PayService service;

	public PayController(PayService service) {
		super();
		this.service = service;
	}
	
	//주문자정보를 저장하는 로직
	@GetMapping("/InforController")
	public String orderUserInfor(orderUser vo, HttpSession session ,Model model ) {
			
	//session에 있는 id로 찾아서 insert했음
	service.orderInfor(vo,(List<CartVO>)session.getAttribute("cartList"), session, model);
	service.orderStock((List<CartVO>)session.getAttribute("cartList"));
	service.orderPoint(vo);
	
	//결제가 끝난 상품들 cartDB에서 삭제할것임 
	service.getCartInfor((UserVO)session.getAttribute("user"));
	for (int i = 0; i < service.getCartInfor((UserVO)session.getAttribute("user")).size(); i++) {
		List<CartVO> cartlist = (List<CartVO>)session.getAttribute("cartList");
		UserVO user = (UserVO)session.getAttribute("user");
		for (int j = 0; j < cartlist.size(); j++) {
			if (service.getCartInfor(user).get(i).getCartNum() == cartlist.get(j).getCartNum()) {
			service.cartDelete(cartlist.get(j));
			}
		}
	}
	
	// 위에 vo에 저장한것들을 출력
	return "pay_result";
		}
	@GetMapping("/orderNumController/{abc}")
	public String detailOrderInfor(@PathVariable("abc") String orderNum,Model model) {
	service.detailOrderInfor(orderNum, model);
	return"detail_order_pay";
		}
	
	//cart 페이지에서 정보를 받아옴
		@PostMapping("/CartInforController")
		public String findCart(CartSession cartvo,HttpSession session) {

			List<CartVO> cartList = new ArrayList<CartVO>();
			for (CartVO vo : cartvo.getOrders()) {
				if (vo.getCartNum() != 0) {
				CartVO cartItem = new CartVO();
				cartItem = service.findCart(vo);
				cartItem.setPrice(vo.getPrice());
				cartItem.setCount(vo.getCount());
				cartList.add(cartItem);
				}
			}
			session.setAttribute("cartList",cartList);

			return "pay";
		}
		// 바로 구매하기 상품을 누르면 오는 controller
		@PostMapping("/NowBuyController")
		public String NowBuy(CartVO vo,HttpSession session) {
		System.out.println(vo);
		List<CartVO> cartvo = new ArrayList<CartVO>();
		cartvo.add(vo);
		session.setAttribute("cartList",cartvo);
		return"pay";
		}
}
