package com.goodee.controller;

import java.net.http.HttpRequest;
import java.security.Provider.Service;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.goodee.service.CartService;
import com.goodee.service.ReviewService;
import com.goodee.vo.PageVO;
import com.goodee.vo.ProductVO;
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
	//리뷰쓰기 창에서 상품명, 작성자 불러오기
	@GetMapping("/writeReview/{id}")
	public String moveWriteReview(Model model, @PathVariable("id")int id,
								@ModelAttribute("proVO") ProductVO vo,
								HttpSession session) {
		ReviewVO revo = new ReviewVO();
		model.addAttribute("revo", revo);
		reviewservice.getProductName(model, id);
		reviewservice.getSession(session);
		return "review/writeReview";
	}
	
	//리뷰쓰고 전송 눌렀을 때
	@PostMapping("/writeReviewDone/{id}")
	public String moveWriteReviewDone(@PathVariable("id")int id,
									@ModelAttribute("reviewVO") ReviewVO vo,
									Model model, HttpSession session) {
		reviewservice.writeReview(id, vo, model, session);
		return "redirect:/moveReview/"+id;
	}
	
}
