package com.goodee.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.goodee.service.CartService;
import com.goodee.vo.CartVO;
import com.goodee.vo.OptionVO;
import com.goodee.vo.QnaVO;
import com.goodee.vo.UserVO;

@Controller
public class CartController {

	public CartService service;

	public CartController(CartService service) {
		this.service = service;
	}

	// cart 리스트 가져오기
	@GetMapping("/cart/{userid}")
	public String getCart(@PathVariable("userid") String userid, Model model) {
		model.addAttribute("cartInfo", service.getCart(userid));

		return "cart";
	}

	// 장바구니 수량 변경
	@PostMapping("/cart/update")
	public String updateCart(CartVO cvo) {
		service.modifyCount(cvo);
		return "redirect:/cart/" + cvo.getUserid();
	}

	// 카트 삭제
	@PostMapping("/cart/delete")
	public String deleteCart(CartVO cvo) {
		service.deleteCart(cvo.getCartNum());
		System.out.println("카트넘" + cvo.getCartNum());
		return "redirect:/cart/" + cvo.getUserid();
	}

	// 카트 전체 삭제
	@PostMapping("/cart/deleteAll")
	@ResponseBody
	public int deleteAllCart(@RequestParam(value = "chbox[]", required = false) List<Integer> chArr, CartVO cvo) {
		int result = 0;

		for (Integer i : chArr) {
			service.deleteAllCart(i);
			result = 1;
		}
		return result;
//		return "redirect:/cart/" + cvo.getUserid();
	}

	// 수정
	// 상세페이지->장바구니 담기
	@ResponseBody
	@PostMapping("/detailcart")
	public int addCart(CartVO cartvo, HttpSession session) {
		int result = 0;
		UserVO user = (UserVO) session.getAttribute("user");
		if (user != null) {
			cartvo.setUserid(user.getUserid());
			cartvo.setUserName(user.getUsername());
			service.addCart(cartvo);
			result = 1;
		}
		return result;
	}

	// 상세페이지 사이즈
	@ResponseBody
	@PostMapping("/colorbyidandsize")
	public List<String> colorbyidandsize(OptionVO optionVO, HttpSession session) {
		return service.selectColorByIdAndSize(optionVO);
	}
	
	// 상세페이지 색상
	@ResponseBody
	@PostMapping("/pronumbysizeandcolor")
	public String pronumbysizeandcolor(OptionVO optionVO, HttpSession session) {
		return service.selectProNumBySizeAndColor(optionVO);
	}
}
