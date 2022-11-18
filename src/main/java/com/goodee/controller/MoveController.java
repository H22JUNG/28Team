package com.goodee.controller;

import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.goodee.service.BbsService;
import com.goodee.service.CartService;
import com.goodee.service.LoginService;
import com.goodee.service.PayService;
import com.goodee.service.ReviewService;
import com.goodee.service.UserService;
import com.goodee.vo.CartVO;
import com.goodee.vo.NoticeVO;
import com.goodee.vo.OptionVO;
import com.goodee.vo.PageVO;
import com.goodee.vo.ProductVO;
import com.goodee.vo.QnaVO;
import com.goodee.vo.UserVO;
import com.goodee.vo.WrotebbsVO;

@Controller
public class MoveController {
	public BbsService bbsservice;
	public UserService userservice;
	public LoginService loginservice; // 유진쓰가 추가
	public PayService payservice; // 이것도 유진쓰가 추가
	public CartService cartservice;
	public ReviewService reviewservice;

	@Value("${file.upload.path}")
	private String Path;

	public MoveController(BbsService bbsservice, UserService userservice, LoginService loginservice,
			PayService payservice, CartService cartservice, ReviewService reviewservice) {
		super();
		this.bbsservice = bbsservice;
		this.userservice = userservice;
		this.loginservice = loginservice;
		this.payservice = payservice;
		this.cartservice = cartservice;
		this.reviewservice = reviewservice;
	}


	@GetMapping("/cart")
	public String cartPage() {
		return "cart";
	}

	@GetMapping("/mypage")
	public String mypage(HttpSession session) {
		if (session.getAttribute("user") != null) {
			return "my_page";
		} else {
			return "login/login";
		}
	}

	@GetMapping("/movemypage/{path}")
	public String movemypage(@PathVariable("path") int path, Model model, HttpSession session,HttpServletRequest request) {
		if (path == 0) {
			return "my_page";
		} else if (path == 1) {
			// 장바구니

			return "redirect:/cart/" + ((UserVO) session.getAttribute("user")).getUserid();
		} else if (path == 2) {
			int page = 1;
			if (request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
			}
			
			payservice.getOrderList(page,model, session);
			return "order_list";
		} else {
			bbsservice.getwrote(model, session);
			return "wrote/wrote";
		}
	}

	// 내가 쓴 글
	@GetMapping("/search") // 카테고리별 검색
	public String search(@RequestParam String category, Model model, HttpSession session) {
		bbsservice.getsearch(model, category, session);
		return "wrote/wrote";
	}

	@GetMapping("/wrotedetail")
	public String wrotedetail(@RequestParam int id, @RequestParam String category, Model model) {
		if (category.equals("Review")) {
			bbsservice.getReviewDetail(id, model);
			return "wrote/reviewDetail";
		} else {
			bbsservice.getQnaDetail(id, model);
			return "wrote/qnaDetail";
		}
	}

	// 답변 글 상세보기
	@GetMapping("/RewroteQnaDetail")
	public String RewroteDetail(@RequestParam int id, @RequestParam String category, Model model) {
		bbsservice.getRewroteQnaDetail(id, model);
		return "wrote/rewroteQnaDetail";
	}

	@GetMapping("/qnaModify/{id}") // 수정하기버튼
	public String modify(@PathVariable("id") int id, @ModelAttribute("qnamodi") QnaVO vo, Model model) {
		bbsservice.Qnamodify(id, model);
		return "wrote/wroteQnaModify";
	}

	@GetMapping("/reviewModify/{id}") // 수정하기버튼
	public String reviewmodify(@PathVariable("id") int id, @ModelAttribute("detail") QnaVO vo, Model model) {
		bbsservice.getReviewDetail(id, model);
		return "wrote/wroteReviewModify";
	}

	@PostMapping("/modifyQnA") // 수정완료버튼
	public String modifydone(@ModelAttribute("detail") WrotebbsVO vo, @RequestParam("category") String category,
			@RequestParam("id") int id) {

		vo.setId(id);
		vo.setCategory(category);
		bbsservice.modify(vo);
		return "redirect:/wrotedetail?id=" + vo.getId() + "&category=" + vo.getCategory();
	}
	@PostMapping("/modify") // 수정완료버튼
	public String modifydone(@ModelAttribute("detail") WrotebbsVO vo, @RequestParam("category") String category,
			@RequestParam("id") int id, @RequestParam("pic1File") MultipartFile pic1File,
			@RequestParam("pic2File") MultipartFile pic2File) {
		
		if (!pic1File.getOriginalFilename().isEmpty()) { // 파일이름이 있으면
			Path path1 = Paths.get(Path + pic1File.getOriginalFilename());
			try {
				pic1File.transferTo(path1);
				// vo.setPic1(Path + pic1File.getOriginalFilename());
				vo.setPic1(pic1File.getOriginalFilename());
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if (!pic2File.getOriginalFilename().isEmpty()) { // 파일이름이 있으면
			Path path2 = Paths.get(Path + pic2File.getOriginalFilename());
			try {
				pic2File.transferTo(path2);
				vo.setPic2(pic2File.getOriginalFilename());
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		vo.setId(id);
		vo.setCategory(category);
		bbsservice.modify(vo);
		return "redirect:/wrotedetail?id=" + vo.getId() + "&category=" + vo.getCategory();
	}

	@GetMapping("/delete/{id}")
	public String delete(@PathVariable("id") int id, @RequestParam("category") String category) {
		WrotebbsVO vo = new WrotebbsVO();
		vo.setId(id);
		vo.setCategory(category);
		bbsservice.getdelete(vo);
		return "redirect:/movemypage/3";
	}

	@PostMapping("/list")
	public String list() {
		// 상세보기->목록으로 돌아가기
		return "redirect:/movemypage/3";
	}

	// 관리자페이지 -회원관리
	// 관리자페이지 - 회원조회
	@GetMapping("/adminpage/{page}")
	public String adiminpage(Model model, @PathVariable("page") int page, @RequestParam String searchUser,
			@RequestParam String userInfo, PageVO vo) {
		if (page == 0) {
			vo.setNowPage(1);
		}
		vo.setNowPage(page);

		if ((searchUser.equals("") || searchUser == null) && (userInfo.equals("") || userInfo == null)) {
			userservice.userlist(model, vo, page, "", "");
		} else if ((!searchUser.equals("") || searchUser != null) && (userInfo.equals("") || userInfo == null)) {
			userservice.userlist(model, vo, page, searchUser, "");
		} else if ((searchUser.equals("") || searchUser == null) && (!userInfo.equals("") || userInfo != null)) {
			userservice.userlist(model, vo, page, "", userInfo);
		} else {
			userservice.userlist(model, vo, page, searchUser, userInfo);
			model.addAttribute("searchUser", searchUser);
			model.addAttribute("userInfo", userInfo);
		}
		;
		return "adminUser/adminUser";
	}

	// 회원정보 수정
	@GetMapping("/adminpagemodi/{page}")
	public String adiminpagemodi(Model model, @PathVariable("page") int page, @RequestParam String searchUser,
			@RequestParam String userInfo, PageVO vo) {
		if (page == 0) {
			vo.setNowPage(1);
		}
		vo.setNowPage(page);

		if ((searchUser.equals("") || searchUser == null) && (userInfo.equals("") || userInfo == null)) {
			userservice.userlist(model, vo, page, "", "");
		} else if ((!searchUser.equals("") || searchUser != null) && (userInfo.equals("") || userInfo == null)) {
			userservice.userlist(model, vo, page, searchUser, "");
		} else if ((searchUser.equals("") || searchUser == null) && (!userInfo.equals("") || userInfo != null)) {
			userservice.userlist(model, vo, page, "", userInfo);
		} else {
			userservice.userlist(model, vo, page, searchUser, userInfo);
			model.addAttribute("searchUser", searchUser);
			model.addAttribute("userInfo", userInfo);
		}
		;
		return "adminUser/adminUserModify";
	}

	@GetMapping("/adminuserpopup")
	public String adminuserpopup(int id, Model model) {
		userservice.userlistmodi(model, id);
		return "adminUser/adminUserPopup";
	}

	@PatchMapping("/adminUserModify")
	@ResponseBody
	public UserVO adminUserModify(@RequestBody UserVO vo) {
		userservice.adminUserUpdate(vo);
		return vo;
	}

	// 회원정보 삭제
	@GetMapping("/adminpagedel/{page}")
	public String adiminpagedel(Model model, @PathVariable("page") int page, @RequestParam String searchUser,
			@RequestParam String userInfo, PageVO vo) {
		if (page == 0) {
			vo.setNowPage(1);
		}
		vo.setNowPage(page);

		if ((searchUser.equals("") || searchUser == null) && (userInfo.equals("") || userInfo == null)) {
			userservice.userlist(model, vo, page, "", "");
		} else if ((!searchUser.equals("") || searchUser != null) && (userInfo.equals("") || userInfo == null)) {
			userservice.userlist(model, vo, page, searchUser, "");
		} else if ((searchUser.equals("") || searchUser == null) && (!userInfo.equals("") || userInfo != null)) {
			userservice.userlist(model, vo, page, "", userInfo);
		} else {
			userservice.userlist(model, vo, page, searchUser, userInfo);
			model.addAttribute("searchUser", searchUser);
			model.addAttribute("userInfo", userInfo);
		}
		;
		return "adminUser/adminUserDelete";
	}

	@DeleteMapping("/adminUserDelete")
	@ResponseBody
	public UserVO adminUserDelete(@RequestBody UserVO vo) {
		userservice.adminUserDelete(vo);
		return vo;
	}

	// 관리자 페이지 - 상품정보
//	@GetMapping("/admin_product_list")
//	public String adminProductList() {
//		return "adminProduct/product_list";
//	}

	// 관리자 페이지 - 상품등록
	@GetMapping("/admin_product_insert")
	public String adminProductInsert() {
		return "adminProduct/product_insert";
	}

	// 관리자 페이지 - 상품수정
	@GetMapping("/admin_product_update")
	public String adminProductUpdate() {
		return "adminProduct/product_update";
	}

	// 관리자 페이지 - 상품삭제
	@GetMapping("/admin_product_delete")
	public String adminProductDelete() {
		return "adminProduct/product_delete";
	}

	// 상세페이지
	// 메인페이지 -> 상품상세페이지(id)
	@GetMapping("/detail/{id}")
	public String productId(@PathVariable("id") String id, Model model) {
		cartservice.getDetailContent(model, id); // 상세페이지 상품 데이터들
		return "detail";
	}

	// 관리자의 관리자정보수정
	// 관리자정보수정으로 이동
	@GetMapping("admin-admin-list")
	public String adminList(@SessionAttribute("user") UserVO user, Model model, String id) {
		if (user != null) {
			bbsservice.adminList(model);
			return "/admin-admin";
		} else {
			return "redirect:/login";
		}
	}

	// 관리자정보수정 수정버튼
	@GetMapping("/admin_modify/{id}")
	public String adminListId(@PathVariable("id") String id, Model model, @SessionAttribute("user") UserVO user) {
		if (user != null) {
			bbsservice.adminListId(model, id);
			return "/admin-admin-modify";
		} else {
			return "redirect:/login";
		}

	}

	// 관리자정보수정 수정완료버튼
	@PostMapping("/modifyBtn")
	public String updateAdmin(@SessionAttribute("user") UserVO user, @ModelAttribute("userVO") UserVO uservo) {
		String returnUrl = "";
		try {
			uservo.setUsername(user.getUsername());
			uservo.setUserid(user.getUserid());
			boolean result = bbsservice.updateAdmin(uservo);
			if (result == true) {
				returnUrl = "redirect:/admin-admin-list";
			} else {
				returnUrl = "redirect:/admin_modify/" + uservo.getId();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return returnUrl;
	}

	// 관리자정보수정 관리자삭제
	@GetMapping("/admin_delete/{id}")
	public String deleteAdmin(@SessionAttribute("user") UserVO user, UserVO uservo, @PathVariable("id") String id) {
		bbsservice.deleteAdmin(uservo);
		return "redirect:/admin-admin-list";
	}

	// 관리자 로그아웃
	@GetMapping("/admin-logout")
	public String adminlogout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	// 공지사항
	@GetMapping("/notice")
	public String moveNotice(Model model, PageVO vo) {
		if(vo.getPage() == 0) {
			vo.setPage(1);
		}
		bbsservice.selectNotice(model, vo);
		return "notice/notice";
	}

	@GetMapping("/notice/{no}")
	public String moveDetailNotice(@PathVariable("no") int no, Model model) {
		bbsservice.selectDetailNotice(model, no);
		return "notice/notice_detail";
	}
	
	@GetMapping("/updateNotice/{no}")
	public String updateNotice(@PathVariable("no") int no, Model model) {
		bbsservice.selectDetailNotice(model, no);
		return "notice/updateNotice";
	}
	@PostMapping("/setNotice/{no}")
	public String setNotice(@PathVariable("no") int no, NoticeVO vo) {
		vo.setNo(no);
		bbsservice.updateNotice(vo);
		return "redirect:/notice/"+no;
	}
	@GetMapping("/writeNotice")
	public String writeNotice(NoticeVO vo) {
		return "notice/writenotice";
	}
	
	@PostMapping("/insertNotice")
	public String insertNotice(NoticeVO vo) {
		bbsservice.insertNotice(vo);
		return "redirect:/notice";
	}
	
	@GetMapping("/deleteNotice")
	public String deleteNotice(@RequestParam("id") int[] ids) {
		for (int id : ids) {
			bbsservice.deleteNotice(id);
		}
		return "redirect:/notice";
	}
}
