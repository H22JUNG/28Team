package com.goodee.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.goodee.dao.ProjectDAO;
import com.goodee.vo.OptionVO;
import com.goodee.vo.ProductListVO;
import com.goodee.vo.ProductVO;

@Service
public class ListService {
	
	public ProjectDAO dao;

	public ListService(ProjectDAO dao) {
		this.dao = dao;
	}

	public void selectCategory(ProductVO vo, Model model) {
		model.addAttribute("list" , dao.selectCategory(vo));
	}
	public void selectBest(ProductVO vo, Model model) {
		model.addAttribute("best", dao.selectBest(vo));
	}
	
}
