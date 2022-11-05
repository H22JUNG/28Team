package com.goodee.controller;

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
import org.springframework.web.multipart.MultipartFile;

import com.goodee.service.CartService;
import com.goodee.service.ReviewService;
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
	public String moveReview(Model model, @PathVariable("id")String id, HttpServletRequest request, HttpSession session) {
		cartservice.getDetailContent(model, id);
		int page =1;
		if(request.getParameter("page") != null ) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		//상품명, 세션의 아이디 담아서 리뷰쓰기 권한 설정
		int id1 = Integer.parseInt(id);
		reviewservice.getAuthority(model, id1, session);
		
		String desc = request.getParameter("desc");
		if(desc==null) {
			desc = "recent";
		}
		if(desc.equals("star")) {	//별점순
			reviewservice.getReview(model, id, page, desc);
			reviewservice.getComment(model, id);
			return "review/reviewStarDESC";
		} else if(desc.equals("hits")) {	//추천순
			reviewservice.getReview(model, id, page, desc);
			reviewservice.getComment(model, id);
			return "review/reviewHitsDESC";
		} else {	//최신순
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
									@RequestParam("pic1File") MultipartFile pic1File,
									@RequestParam("pic2File") MultipartFile pic2File,
									Model model, HttpSession session) {
		
		reviewservice.writeReview(pic1File, pic2File, id, vo, model, session);
		
		return "redirect:/moveReview/"+id;
	}
	
}
