package com.goodee.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.goodee.dao.ProjectDAO;
import com.goodee.vo.ProductListVO;

@Service
public class AdminProductService {
	
	public ProjectDAO dao;

	public AdminProductService(ProjectDAO dao) {
		this.dao = dao;
	}

	// admin product List 출력 - 윤정
	public void selectProductList(Model model) {
		model.addAttribute("productList", dao.selectProductList());
	}
	
	// 검색기능
	public List<ProductListVO> serchProductList(ProductListVO vo) {
		List<ProductListVO> list = dao.serchProductList(vo);
		for (ProductListVO productListVO : list) {
			System.out.println(productListVO);
		}
		return list;
	}
	
	// admin product Update List 출력
	public void selectUpdateList(String proNum, Model model) {
		model.addAttribute("productUpdateList", dao.selectUpdateList(proNum));
	}
	
	// 상품 수정하기
	public void update(ProductListVO vo) {
		dao.update1(vo);
		dao.update2(vo);
		dao.update3(vo);
		dao.update4(vo);
		//dao.update5(vo);
	}
	
	// 상품 삭제하기
	public void productDelete(String pro_num) {
		dao.productDelete(pro_num);
		dao.optionNullId();
		System.out.println(pro_num);
		System.out.println("삭제하기 서비스타나");
	}
	
	// 상품 insert
	public void productInsert(ProductListVO vo) {
		dao.productInsert(vo);
		dao.optionInsert(vo);
		dao.categoryIdUpdate();
		dao.proNumUpdate();
		System.out.println("product insert 타니?");
	}
	
}
