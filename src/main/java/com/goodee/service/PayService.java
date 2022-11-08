package com.goodee.service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.goodee.dao.ProjectDAO;
import com.goodee.vo.CartVO;
import com.goodee.vo.UserVO;
import com.goodee.vo.orderUser;

@Service
public class PayService {
	
	public ProjectDAO dao;

	public PayService(ProjectDAO dao) {
		super();
		this.dao = dao;
	}
	
	
	
	
	public void orderInfor(orderUser vo, List<CartVO> volist, HttpSession session,Model model) {
		int cartListNum = dao.selectCartListNum(((UserVO)session.getAttribute("user")).getUserid());
		vo.setUserid(((UserVO)session.getAttribute("user")).getUserid());
		vo.setCartListNum(cartListNum);
		
		LocalDateTime now = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
		String formatedNow = now.format(formatter);
		
		String orderNum = formatedNow + "-";
		for (int i = 0; i < 6; i++) {
			int math = (int)Math.floor(Math.random()*10);
			orderNum+=math;
		}
		vo.setOrderNum(orderNum);
		
		
		formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		formatedNow = now.format(formatter);
		vo.setOrderDate(formatedNow);
		int TotalPrice = 0;

		for (int i = 0; i < volist.size(); i++) {
			TotalPrice+=volist.get(i).getPrice()*volist.get(i).getCount();
			
			volist.get(i).setId(((UserVO)session.getAttribute("user")).getId());
			volist.get(i).setUserid(((UserVO)session.getAttribute("user")).getUserid());
			volist.get(i).setCartListNum(cartListNum);
		}
		TotalPrice= TotalPrice+2500-vo.getPoint();
		vo.setTotalPrice(TotalPrice);
		dao.orderUserInfor(vo);
		for (int i = 0; i < volist.size(); i++) {
			dao.orderItemInfor(volist.get(i));
		}
		model.addAttribute("orderUser",vo); //주문자정보
		model.addAttribute("orderItem",(List<CartVO>)session.getAttribute("cartList"));
		
//		session.removeAttribute("cartList"); 결제후 세션 초기화 
	}

	//저장한 내용 출력
	public void getOrderList(Model model, HttpSession session) {
		model.addAttribute("orderList", dao.getOrderList((UserVO)session.getAttribute("user")));
	}
	
	public void orderUserResult(String userid,Model model) {
		model.addAttribute("orderUsermodel",dao.orderUserResult(userid));	
	}
	
	public void payUserInfor(HttpSession session,Model model) {
		model.addAttribute("payInfor",dao.payUserInfor(((UserVO)session.getAttribute("user")).getUserid()));
		
	}
	
	//주문조회 상세페이지 내용 출력
	public void detailOrderInfor(String orderNum,Model model){
		model.addAttribute("detailOrderInfor",dao.detailOrderInfor(orderNum));
		
	}
	public void orderStock(List<CartVO> cartvo) {
		for (int i = 0; i < cartvo.size(); i++) {
			dao.orderStock(cartvo.get(i));			
		}
	}
	public void orderPoint(orderUser vo) {
		dao.orderPoint(vo);
	}
	//카트에서 선택한 상품의 정보를 가져오기위한 서비스
	public CartVO findCart(CartVO cartvo){
			return dao.findCart(cartvo);
	}
	//카트에서 결제한 상품들 cartDB에서 삭제
	public void cartDelete(CartVO vo) {
			dao.cartDelete(vo);
	}
	
		//카트 리스트
	public List<CartVO> getCartInfor(UserVO vo){
			return dao.getCartInfor(vo);
	}
	//pay Result 값을 변경하기위함
	public void PayResultChange(orderUser vo) {
			dao.PayResultChange(vo);
		}
}
