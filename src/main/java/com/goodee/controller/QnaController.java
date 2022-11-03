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

		// 상품리스트P->QNA게시판P
		// Q&A 게시글리스트 및 페이징
		@GetMapping("/qna")
		public String getQna(HttpServletRequest request, Model model, QnaVO qnavo) {
			int page = 1;
			if(request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
			}
			
			bbsservice.getQnaList(page, request, model);
			return "/qna/qna";
		}

		// QNA게시판P -> 제목누르면 content
		@GetMapping("/qna/{id}")
		public String getContent(@PathVariable("id") String id, Model model) {
			//detailservice.qnaCount(id); // 조회수
			bbsservice.getQnaContent(model, id);
			model.addAttribute("qnaHits", bbsservice.qnaCount(id));	//조회수
			return "/qna/content";
		}

		// Q&A qna P -> 글쓰기
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

		// 글쓰기 등록 버튼 눌렀을 때
		@PostMapping("/write/good")
		public String setBBSResult(@SessionAttribute("user") UserVO user, @ModelAttribute("qnaVO") QnaVO qnavo) {
			if (user != null) {
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

		// Q&A 조회P->수정P
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

		// Q&A 수정P 수정완료 버튼 누를 때
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

		// Q&A 조회P -> 삭제하기
		@GetMapping("/remove/{id}")
		public String deleteBBS(@SessionAttribute("user") UserVO user, @ModelAttribute("qnaVO") QnaVO qnavo,
				@PathVariable("id") String id) {
			qnavo.setOwner(user.getUsername());
			qnavo.setOwnerId(user.getId());
			if (bbsservice.deleteQna(qnavo)) {
				return "redirect:/qna";
			} else {
				return "redirect:/qna/" + qnavo.getId();
			}
		}
		
		// 메인 Qna게시판 답글
		
		// Q&A 조회P->답글P
		@GetMapping("/reply")
		public String replyBBS(@SessionAttribute("user") UserVO user, Model model, String id) {
			if (user != null) {
				bbsservice.getQnaContent(model, id);
				return "qna/reply";
			} else {
				return "redirect:/login";
			}
		}

		// Q&A 조회P->답글P 답글등록할 때
		//@GetMapping("/reply/good")
		@RequestMapping("/reply/good")
		public String replyBBSResult(@SessionAttribute("user") UserVO user, QnaCommentVO commentvo, @ModelAttribute QnaVO qnaVO) {
			if (user != null) {
				commentvo.setOwnerId(user.getId());
				commentvo.setOwner(user.getUsername());
				commentvo.setRoot(qnaVO.getId());
				commentvo.setRoot(qnaVO.getRoot());
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
		// 상세페이지 inner - Q&A
		@GetMapping("/detail_qna/{id}")
		public String getBBS(Model model, @PathVariable("id")String id, HttpServletRequest request,
				@ModelAttribute("qnaVO1") QnaVO qnavo) {
			cartservice.getDetailContent(model, id); // 상세페이지 상품 데이터들
			System.out.println("detail id : " + id);
			
			int page = 1;
			if(request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
			}
			
				bbsservice.getBBSList(model);  // 이너Q&A데이터
				//model.addAttribute("move_product_qna", request.getParameter("move_product_qna"));  //qna페이지 이동
				
				return "/qna/detail_qna";
		}
		
		@GetMapping("/inner_qna/{id}")
		public String getBBSItem(@SessionAttribute("user") UserVO user, Model model, @PathVariable("id")String id) {
			if(user != null ) {
				bbsservice.qnaCount(id); // 조회수
				bbsservice.getBBSContent(model, id);
				return "qna/inner_content";
			}else {
				return "login";			
			}
		}
		
		// inner-Q&A 답변
		@GetMapping("/inner_comment/{root}")
		@ResponseBody
		public List<QnaCommentVO> getComments(@PathVariable("root")int root){
			return bbsservice.getCommentList(root);
		}
		
		@PostMapping("/inner_comment")
		@ResponseBody
		public ResponseEntity<Map<String, String>> setComments(@RequestBody QnaCommentVO commentvo, String id){
			ResponseEntity<Map<String,String>> res = null;
			Map<String, String> map = new HashMap<String, String>();
			
			if(bbsservice.setComment(commentvo) > 0) {
				map.put("result", "성공적으로 전송되었습니다");
				res = new ResponseEntity<Map<String,String>>(map, HttpStatus.OK);
			}else {
				map.put("result", "전송되지 못했습니다");
				res = new ResponseEntity<Map<String,String>>(map, HttpStatus.NOT_FOUND);
			}
			
			return res;
		}
		
			// inner - Q&A 조회P->수정P
			@GetMapping("/inner_update/{id}")
			public String setinnerBBS(@SessionAttribute("user") UserVO user, Model model, @PathVariable("id") String id) {
				if (user != null) {
					bbsservice.getQnaContent(model, id);
					String[] categoryList = { "로그인/회원가입문의", "상품문의", "주문/결제문의", "배송문의", "취소/교환/반품문의", "설치/a/s문의", "적립금/이벤트문의" };
					model.addAttribute("categoryList", categoryList);
					return "/qna/inner_modify";
				} else {
					return "redirect:/login";
				}
			}

			// inner - Q&A 수정P 수정완료 버튼 누를 때
			@PostMapping("/inner_update")
			public String setinnerBBS(@SessionAttribute("user") UserVO user, @ModelAttribute("qnaVO") QnaVO qnavo) {
				qnavo.setOwner(user.getUsername());
				qnavo.setOwnerId(user.getId());
				if (bbsservice.updateQna(qnavo)) {
					return "/qna/inner_qna";
				} else {
					return "redirect:/inner_update/" + qnavo.getId();
				}
			}

			// inner - Q&A 조회P -> 삭제하기
			@GetMapping("/inner_remove/{id}")
			public String deleteinnerBBS(@SessionAttribute("user") UserVO user, @ModelAttribute("qnaVO") QnaVO qnavo,
					@PathVariable("id") String id) {
				qnavo.setOwner(user.getUsername());
				qnavo.setOwnerId(user.getId());
				if (bbsservice.deleteQna(qnavo)) {
					return "/qna/inner_qna";
				} else {
					return "redirect:/inner_qna/" + qnavo.getId();
				}
			}
			
			// inner - Q&A qna P -> 글쓰기
			@GetMapping("/inner_write")
			public String setInnerBBS(@SessionAttribute("user") UserVO user, @ModelAttribute("qnaVO") QnaVO qnavo, Model model) {
				if (user != null) {
					String[] categoryList1 = { "상품문의" };
					model.addAttribute("categoryList2", categoryList1);
					return "qna/inner_write";
				} else {
					return "redirect:/login";
				}
			}

			// inner - 글쓰기페이지에서 등록 버튼 눌렀을 때
			@PostMapping("/inner_write/good")
			public String setInnerBBSResult(@SessionAttribute("user") UserVO user, @ModelAttribute QnaVO qnaVO) {
				if (user != null) {
					qnaVO.setOwnerId(user.getId());
					qnaVO.setOwner(user.getUsername());
					System.out.println("inner_write/good code = " + qnaVO.getCode());
					System.out.println("inner_write/good id = " + qnaVO.getId());
					System.out.println("inner_write/good root = " + qnaVO.getRoot());
					qnaVO.setCode(qnaVO.getCode());
					qnaVO.setRoot(qnaVO.getId());

					if (bbsservice.insertQna(qnaVO)) {
						return "redirect:/inner_qna";
					} else {
						return "qna/inner_write";
					}
				} else {
					return "redirect:/login";
				}
			}
			
}
