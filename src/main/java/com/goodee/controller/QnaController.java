package com.goodee.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.goodee.service.BbsService;
import com.goodee.service.CartService;
import com.goodee.service.ReviewService;
import com.goodee.service.UserService;
import com.goodee.vo.PageVO;
import com.goodee.vo.ProductVO;
import com.goodee.vo.QnaCommentVO;
import com.goodee.vo.QnaVO;
import com.goodee.vo.UserVO;

@Controller
public class QnaController {

	public BbsService bbsservice;
	public UserService userservice;
	public CartService cartservice;
	public ReviewService reviewservice;

	// 메인 Qna게시판

	public QnaController(BbsService bbsservice, UserService userservice, CartService cartservice,
			ReviewService reviewservice) {
		super();
		this.bbsservice = bbsservice;
		this.userservice = userservice;
		this.cartservice = cartservice;
		this.reviewservice = reviewservice;
	}

	// Q&A게시판
	// Q&A 게시글리스트 및 페이징
	@GetMapping("/qna")
	public String getQna(HttpServletRequest request, Model model, QnaVO qnavo) {
		int page = 1;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		bbsservice.getQnaList(page, request, model);
		return "/qna/qna";
	}

	// QNA content로 이동
	@GetMapping("/qna/{id}")
	public String getContent(@PathVariable("id") String id, Model model) {
		
		bbsservice.getQnaContent(model, id);
		return "/qna/content";
	}

	// Q&A 글쓰기로 이동
	@GetMapping("/write")
	public String setBBS(@SessionAttribute("user") UserVO user, @ModelAttribute("qnaVO") QnaVO qnavo, Model model) {
		if (user != null) {
			String[] categoryList = { "로그인/회원가입문의", "상품문의", "주문/결제문의", "배송문의", "취소/교환/반품문의", "설치/a/s문의", "적립금/이벤트문의" };
			model.addAttribute("categoryList", categoryList);
			return "qna/write";
		} else {
			return "redirect:/login";
		}
	}

	// Q&A 글쓰기에서 등록버튼
	@PostMapping("/write/good")
	public String setBBSResult(@SessionAttribute("user") UserVO user, @ModelAttribute("qnaVO") QnaVO qnavo) {
		if (user != null) {
			System.out.println(qnavo.getId());
			qnavo.setOwnerId(user.getId());
			qnavo.setOwner(user.getUsername());
			qnavo.setRoot(qnavo.getId());
			if (bbsservice.insertQna(qnavo)) {
				return "redirect:/qna";
			} else {
				return "qna/write";
			}
		} else {
			return "redirect:/login";
		}
	}

	// Q&A 수정하기로 이동
	@GetMapping("/update/{id}")
	public String setBBS(@SessionAttribute("user") UserVO user, Model model, @PathVariable("id") String id) {
		if (user != null) {
			bbsservice.getQnaContent(model, id);
			String[] categoryList = { "로그인/회원가입문의", "상품문의", "주문/결제문의", "배송문의", "취소/교환/반품문의", "설치/a/s문의", "적립금/이벤트문의" };
			model.addAttribute("categoryList", categoryList);
			return "/qna/modify";
		} else {
			return "redirect:/login";
		}
	}

	// Q&A 수정페이지 수정완료버튼
	@PostMapping("/update")
	public String setBBS(@SessionAttribute("user") UserVO user, @ModelAttribute("qnaVO") QnaVO qnavo) {
		qnavo.setOwner(user.getUsername());
		qnavo.setOwnerId(user.getId());
		if (bbsservice.updateQna(qnavo)) {
			return "redirect:/qna";
		} else {
			return "redirect:/update/" + qnavo.getId();
		}
	}

	// Q&A content에서 삭제버튼
	@RequestMapping("/remove/{id}")
	public String deleteBBS(@SessionAttribute("user") UserVO user, @ModelAttribute("qnaVO") QnaVO qnavo,
			@PathVariable("id") String id, QnaCommentVO commentvo) {
		qnavo.setOwner(user.getUsername());
		qnavo.setOwnerId(user.getId());
		bbsservice.deleteQna(qnavo, commentvo);
		return "redirect:/qna";
		
	}

	// Q&A 답변페이지로
	@GetMapping("/reply")
	public String replyBBS(@SessionAttribute("user") UserVO user, Model model, String id) {
		if (user != null) {
			bbsservice.getQnaContent(model, id);
			return "qna/reply";
		} else {
			return "redirect:/login";
		}
	}

	// Q&A 답변 등록버튼
	@RequestMapping("/reply/good")
	public String replyBBSResult(@SessionAttribute("user") UserVO user, QnaCommentVO commentvo,
			@ModelAttribute("qnaVO") QnaVO qnaVO) {
		if (user != null) {
			commentvo.setOwnerId(user.getId());
			commentvo.setOwner(user.getUsername());
			commentvo.setRoot(qnaVO.getId());
			commentvo.setRoot(qnaVO.getRoot());
			commentvo.setQnaCategory(qnaVO.getQnaCategory());
			if (bbsservice.insertReply(commentvo)) {
				return "redirect:/qna";
			} else {
				return "qna/reply";
			}
		} else {
			return "redirect:/login";
		}
	}

	// 상세페이지 내 Qna게시판
	// inner Q&A 리스트
	@GetMapping("/detail_qna/{id}")
	public String getBBS(Model model, @PathVariable("id")String id, HttpServletRequest request, 
			@ModelAttribute("qnaVO1") QnaVO qnavo) {
		cartservice.getDetailContent(model, id); // 상세페이지 상품 데이터들
		int page = 1;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		model.addAttribute("code", id);
		bbsservice.getBBSList(page, request, model);  // 이너Q&A데이터
		return "/qna/detail_qna";
	}

	@GetMapping("/detail_qna/{id}/{detailid}")
	public String getBBSItem(@SessionAttribute("user") UserVO user, Model model, @PathVariable("id") String id
			, @PathVariable("detailid")String detailid) {
		if (user != null) {
			cartservice.getDetailContent(model, detailid); // 상세페이지 상품 데이터들
			bbsservice.qnaCount(id); // 조회수
			bbsservice.getBBSContent(model, id);
			return "qna/detail_content";
		} else {
			return "login";
		}
	}

	// innerQ&A 댓글
	@GetMapping("/inner_comment/{root}")
	@ResponseBody
	public List<QnaCommentVO> getComments(@PathVariable("root") int root) {
		return bbsservice.getCommentList(root);
	}

	@PostMapping("/inner_comment")
	@ResponseBody
	public ResponseEntity<Map<String, String>> setComments(@RequestBody QnaCommentVO commentvo, String id) {
		ResponseEntity<Map<String, String>> res = null;
		Map<String, String> map = new HashMap<String, String>();

		if (bbsservice.setComment(commentvo) > 0) {
			map.put("result", "성공적으로 전송되었습니다");
			res = new ResponseEntity<Map<String, String>>(map, HttpStatus.OK);
		} else {
			map.put("result", "전송되지 못했습니다");
			res = new ResponseEntity<Map<String, String>>(map, HttpStatus.NOT_FOUND);
		}

		return res;
	}

	// inner Q&A 수정페이지로 이동
	@GetMapping("/detail_update/{id}/{detailid}")
	public String setinnerBBS(@SessionAttribute("user") UserVO user, Model model, @PathVariable("id") String id
			, @PathVariable("detailid")String detailid) {
		if (user != null) {
			cartservice.getDetailContent(model, detailid); // 상세페이지 상품 데이터들
			bbsservice.getQnaContent(model, id);
			String[] categoryList = { "로그인/회원가입문의", "상품문의", "주문/결제문의", "배송문의", "취소/교환/반품문의", "설치/a/s문의", "적립금/이벤트문의" };
			model.addAttribute("categoryList", categoryList);
			return "/qna/detail_modify";
		} else {
			return "redirect:/login";
		}
	}

	// inner Q&A 수정완료 버튼
	@PostMapping("/detail_update/{detailid}")
	public String setinnerBBS(@SessionAttribute("user") UserVO user, @ModelAttribute("qnaVO") QnaVO qnavo
			, Model model, @PathVariable("detailid")String detailid) {
		cartservice.getDetailContent(model, detailid); // 상세페이지 상품 데이터들
		qnavo.setOwner(user.getUsername());
		qnavo.setOwnerId(user.getId());
		if (bbsservice.updateQna(qnavo)) {
			return "redirect:/detail_qna/" + detailid;
		} else {
			return "redirect:/detail_qna/" + detailid;
		}
	}

	// inner Q&A 삭제버튼
	@GetMapping("/detail_remove/{id}/{detailid}")
	public String deleteinnerBBS(@SessionAttribute("user") UserVO user, @ModelAttribute("qnaVO") QnaVO qnavo,
			@PathVariable("id") String id, Model model, @PathVariable("detailid")String detailid, QnaCommentVO commentvo) {
		cartservice.getDetailContent(model, detailid); // 상세페이지 상품 데이터들
		qnavo.setOwner(user.getUsername());
		qnavo.setOwnerId(user.getId());
		if (bbsservice.deleteQna(qnavo, commentvo)) {
			return "redirect:/detail_qna/" + detailid;
		} else {
			return "redirect:/detail_qna/" + detailid;
		}
	}

	// inner Q&A 글쓰기페이지로
	@GetMapping("/detail_write/{detailid}")
	public String setInnerBBS(@SessionAttribute("user") UserVO user, @ModelAttribute("qnaVO") QnaVO qnavo, Model model,
			@PathVariable("detailid")String detailid) {
		if (user != null) {
			cartservice.getDetailContent(model, detailid); // 상세페이지 상품 데이터들
			String[] categoryList1 = { "상품문의" };
			model.addAttribute("categoryList2", categoryList1);
			return "qna/detail_write";
		} else {
			return "redirect:/login";
		}
	}

	// inner Q&A 글쓰기페이지 등록버튼
	@PostMapping("/detail_write/good/{detailid}")
	public String setInnerBBSResult(@SessionAttribute("user") UserVO user, @ModelAttribute QnaVO qnaVO
			, Model model, @PathVariable("detailid")String detailid, ProductVO productvo) {
		if (user != null) {
			cartservice.getDetailContent(model, detailid); // 상세페이지 상품 데이터들
			qnaVO.setOwnerId(user.getId());
			qnaVO.setOwner(user.getUsername());
			qnaVO.setCode(qnaVO.getCode());

			if (bbsservice.insertQna(qnaVO)) {
				return "redirect:/detail_qna/"+ detailid;
			} else {
				return "redirect:/detail_write/"+ detailid;
			}
		} else {
			return "redirect:/login";
		}
	}

}
