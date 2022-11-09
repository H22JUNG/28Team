package com.goodee.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.goodee.service.AdminProductService;
import com.goodee.service.ListService;
import com.goodee.vo.OptionVO;
import com.goodee.vo.PageVO;
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
	/*
	@GetMapping("/admin_product_list")
	public String selectProductList(ProductListVO vo, Model model, HttpServletRequest request) {
		int page = 1;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		service.selectProductList(model, page);
		return "adminProduct/product_list";
	}
	*/
	
	// 검색기능
	@GetMapping("/admin_product_list/{page}")
	public String serchProductList(@RequestParam String order,@RequestParam String content,
									PageVO vo, @PathVariable("page") int page, Model model) {
			
		if(page == 0) {
			vo.setNowPage(1);
		}
		vo.setNowPage(page);

		service.serchProductList(model, vo, page, order, content);
		model.addAttribute("order", order);
		model.addAttribute("content", content);
		
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
		return "redirect:/admin_product_list/1?order=&content=";
	}
	
	// 상품 삭제하기
	@GetMapping("/admin/deleteInfo/{pro_num}")
	public String productDelete(@PathVariable("pro_num") String pro_num) {
		service.productDelete(pro_num);
		System.out.println(pro_num);
		return "redirect:/admin_product_list/1?order=&content=";
	}
	
	// 상품 등록하기
	@PostMapping("/admin/insertInfo")
	public String productInsert(ProductListVO vo) {
		System.out.println(vo.getSize());
		System.out.println(vo.getColor());
		service.productInsert(vo);
		return "redirect:/admin_product_list/1?order=&content=";
	}
	
	
}
