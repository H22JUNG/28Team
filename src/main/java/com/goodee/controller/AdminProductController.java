package com.goodee.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.goodee.service.AdminProductService;
import com.goodee.service.ListService;
import com.goodee.vo.OptionVO;
import com.goodee.vo.ProductListVO;
import com.goodee.vo.ProductVO;

@Controller
public class AdminProductController {
	public AdminProductService service;

	public AdminProductController(AdminProductService service) {
		super();
		this.service = service;
	}

	// 상품 리스트 페이지
	@GetMapping("/admin_product_list")
	public String selectProductList(ProductListVO vo,Model model) {
		service.selectProductList(model);
		return "adminProduct/product_list";
	}
	
	// 검색기능
	@PostMapping("/serch")
	public String serchProductList(@RequestParam("order") String order,@RequestParam("content") String content, ProductListVO vo, Model model) {
			
			System.out.println(order);
			System.out.println(content);
			System.out.println(vo.toString());
			
		System.out.println();
		if(order.equals("category1")) {
			vo.setCategory1(content);
		}else if(order.equals("category2")) {
			vo.setCategory2(content);
		}else if(order.equals("name")) {
			vo.setName(content);
		}else if(order.equals("proNum")) {
			vo.setProNum(content);
		}
		
		model.addAttribute("productList",service.serchProductList(vo));
		
		
		return "adminProduct/product_list";
	}
	
	// 상품 수정 페이지
	@GetMapping("/admin/productUpdate/{pro_num}")
	public String updateProduct(@PathVariable("pro_num") String proNum, Model model) {
		service.selectUpdateList(proNum, model);
		// product 리스트로 다시 돌아가게 설정
		return "adminProduct/product_update";
	}
	
	// 상품 수정하기
	@PostMapping("/admin/updateInfo/{pro_num}")
	public String updateInfo(@PathVariable("pro_num") String pro_num, ProductListVO vo) {
		vo.setProNum(pro_num);
		service.update(vo);
		return "redirect:/admin_product_list";
	}
	
	// 상품 삭제하기
	@GetMapping("/admin/deleteInfo/{pro_num}")
	public String productDelete(@PathVariable("pro_num") String pro_num) {
		service.productDelete(pro_num);
		System.out.println(pro_num);
		return "redirect:/admin_product_list";
	}
	
	// 상품 등록하기
	@PostMapping("/admin/insertInfo")
	public String productInsert(ProductListVO vo) {
		service.productInsert(vo);
		return "redirect:/admin_product_list";
	}
	
}
