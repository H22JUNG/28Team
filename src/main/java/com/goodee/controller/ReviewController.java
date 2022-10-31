package com.goodee.controller;

import java.net.http.HttpRequest;
import java.security.Provider.Service;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.goodee.service.CartService;
import com.goodee.service.ReviewService;
import com.goodee.vo.PageVO;
import com.goodee.vo.ReviewCommentVO;
import com.goodee.vo.ReviewVO;

@Controller
public class ReviewController {
	
	public ReviewService reviewservice;
	public CartService cartservice;
	
	public ReviewController(ReviewService reviewservice, CartService cartservice) {
		super();
		this.reviewservice = reviewservice;
		this.cartservice = cartservice;
	}
	
	@GetMapping("/moveReview/{id}")
	public String moveReview(Model model, @PathVariable("id")String id, HttpServletRequest request) {
		cartservice.getDetailContent(model, id);
		int page =1;
		if(request.getParameter("page") != null ) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		String desc = request.getParameter("desc");
		if(desc==null) {
			desc = "recent";
		}
		if(desc.equals("star")) {
			reviewservice.getReview(model, id, page, desc);
			reviewservice.getComment(model, id);
			return "review/reviewStarDESC";
		} else if(desc.equals("hits")) {
			reviewservice.getReview(model, id, page, desc);
			reviewservice.getComment(model, id);
			return "review/reviewHitsDESC";
		} else {
			reviewservice.getReview(model, id, page, desc);
			reviewservice.getComment(model, id);
			return "review/review";
		}
	}
	
	//사진 전체보기에서 사진 선택했을 때 해당 리뷰만 보이게 함
	@GetMapping("/photoSelect/{id}")
	@ResponseBody
	public ReviewVO photoSelect(@PathVariable("id")int id) {
		return reviewservice.photoSelect(id);
	}
	
	@GetMapping("/hitsPlus")
	@ResponseBody
	public int hitsPlus(@RequestParam int id, @RequestParam int hits) {
		reviewservice.hitsPlus(id, hits);
		return hits;
	}
	@PutMapping("/commentInsert")
	@ResponseBody
	public ReviewCommentVO commnetInsert(@RequestBody ReviewCommentVO vo) {
		reviewservice.commnetInsert(vo);
		return vo;
	}
	@GetMapping("/writeReview")
	public String moveWriteReview() {
		return "review/writeReview";
	}
	
}
