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
	public void selectInnerCategory(ProductVO vo, Model model) {
		model.addAttribute("list" , dao.selectInnerCategory(vo));
	}
	
	
	// admin product List 출력 - 윤정
		public void selectProductList(Model model) {
			List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
			list = dao.selectProductList();
			// 키 이름이 틀려서 출력이 안된거였음........
//			for (int i = 0; i < list.size(); i++) {
//				System.out.println(list.get(i).keySet()); 
//			}
			model.addAttribute("productList", list);
		}
		
		// admin product Update List 출력
		public void selectUpdateList(String pro_num, Model model) {
			List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
			list = dao.selectUpdateList(pro_num);
			model.addAttribute("productUpdateList", list);
		}
		
		// 상품 수정하기
		public void update(ProductListVO vo) {
			dao.update1(vo);
			dao.update2(vo);
			dao.update3(vo);
			dao.update4(vo);
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
