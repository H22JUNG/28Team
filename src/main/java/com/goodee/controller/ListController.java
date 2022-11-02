package com.goodee.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.goodee.service.ListService;
import com.goodee.vo.ProductVO;

@Controller
public class ListController {

	public ListService service;

	public ListController(ListService service) {
		this.service = service;
	}
	

	// 카테고리별 상품 리스트 이동
	@GetMapping("/category/{category1}")
	public String movecategory(@PathVariable("category1") String category1, @RequestParam(value="order", required = false, defaultValue="0") int order, Model model) {
		ProductVO vo = new ProductVO();
		vo.setCategory1(category1);
		vo.setOrder(order);
		service.selectBest(vo, model);
		service.selectCategory(vo, model);
		return "product_list";
	}
	@GetMapping("/category2/{category2}")
	public String category2(@PathVariable("category2") String category2, @RequestParam(value="order", required = false, defaultValue="0") int order, Model model) {
		ProductVO vo = new ProductVO();
		vo.setCategory2(category2);
		vo.setOrder(order);
		service.selectBest(vo, model);
		service.selectCategory(vo, model);
		return "product_list";
	}
	
	@GetMapping("/searchProduct")
	public String searchProduct(ProductVO vo, Model model) {
		service.selectCategory(vo, model);
		return "product_list";
	}
}
