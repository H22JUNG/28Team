package com.goodee.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.goodee.dao.ProjectDAO;
import com.goodee.vo.PageVO;
import com.goodee.vo.ProductListVO;

@Service
public class AdminProductService {
	
	public ProjectDAO dao;

	public AdminProductService(ProjectDAO dao) {
		this.dao = dao;
	}

	// admin product List 출력 - 윤정
	/*
	public void selectProductList(Model model, int page) {
		PageVO vo = new PageVO();
		vo.setTotal(dao.OrderListCount(vo));
		vo.setNowPage(page);
		vo.setCntPerPage(10);
		vo.setStart((page-1)*vo.getCntPerPage());
		vo.setEnd(page*vo.getCntPerPage());
		
		vo.setCntPerBlock(5);
		//전체페이지
		int totalPage = vo.getTotal()/vo.getCntPerPage();
		totalPage = (vo.getTotal() % vo.getCntPerPage() == 0)? totalPage : totalPage + 1;
		vo.setTotalPage(totalPage);
		//페이지 설정
		int initPage = (vo.getNowPage()-1) / vo.getCntPerBlock() * vo.getCntPerBlock();
		//시작 페이지
		int startPage = initPage + 1;
		vo.setStartPage(startPage);
		// 끝 페이지
		int endPage = initPage + vo.getCntPerBlock();
		if (endPage > vo.getTotalPage()) {
			endPage = vo.getTotalPage();
		}
		vo.setEndPage(endPage);
		model.addAttribute("productPage", vo);
		model.addAttribute("productList", dao.selectProductList(vo));
	}
	*/
	
	// 검색기능
	public List<ProductListVO> serchProductList(Model model, PageVO vo, int page, String order, String content) {
		/*
		if(order.equals("category1")) {
			vo.setCategory1(order);
			vo.setContent(content);
		}else if (order.equals("category2")) {
			vo.setCategory2(order);
			vo.setContent(content);
		}else if (order.equals("name")) {
			vo.setName(order);
			vo.setContent(content);
		}else if (order.equals("proNum")) {
			vo.setProNum(order);
			vo.setContent(content);
		}
		*/
		
		if(order.equals("category1")) {
			vo.setCategory1(content);
			//vo.setContent(content);
		}else if (order.equals("category2")) {
			vo.setCategory2(content);
			//vo.setContent(content);
		}else if (order.equals("name")) {
			vo.setName(content);
			//vo.setContent(content);
		}else if (order.equals("proNum")) {
			vo.setProNum(content);
			//vo.setContent(content);
		}
		
		// 페이징
		vo.setTotal(dao.productCount(vo));
		vo.setNowPage(page);
		vo.setCntPerPage(10);
		vo.setStart((page - 1) * vo.getCntPerPage());
		vo.setEndPage(page * vo.getCntPerPage());

		vo.setCntPerBlock(10);
		int totalPage = vo.getTotal() / vo.getCntPerPage();
		totalPage = (vo.getTotal() % vo.getCntPerPage() == 0) ? totalPage : totalPage + 1;
		vo.setTotalPage(totalPage);

		int initPage = (vo.getNowPage() - 1) / vo.getCntPerBlock() * vo.getCntPerBlock();
		int startPage = initPage + 1;
		vo.setStartPage(startPage);

		int endPage = initPage + vo.getCntPerBlock();
		if (endPage > vo.getTotalPage()) {
			endPage = vo.getTotalPage();
		}
		vo.setEndPage(endPage);
		
		if(dao.serchProductList(vo).size() == 0) {
			model.addAttribute("nothing","검색 결과가 없습니다.");
		}else {
			model.addAttribute("list",dao.serchProductList(vo));
		}
		model.addAttribute("page",vo);
		return dao.serchProductList(vo);
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
