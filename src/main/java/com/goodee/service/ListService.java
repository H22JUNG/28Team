package com.goodee.service;


import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.goodee.dao.ProjectDAO;
import com.goodee.vo.ProductVO;

@Service
public class ListService {
	
	public ProjectDAO dao;

	public ListService(ProjectDAO dao) {
		this.dao = dao;
	}

	public void selectTotalBest(Model model) {
		ProductVO vo = new ProductVO();
		model.addAttribute("best", dao.selectBest(vo));
	}
	public void selectCategory(ProductVO vo, Model model) {
		model.addAttribute("list" , dao.selectCategory(vo));
	}
	public void selectBest(ProductVO vo, Model model) {
		model.addAttribute("best", dao.selectBest(vo));
	}
	// 메인페이지 베스트 리뷰
	public void selectBestReview(Model model) {
		model.addAttribute("bestReview", dao.selectBestReview());
	}
	
}
