package com.goodee.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.goodee.dao.ProjectDAO;
import com.goodee.vo.PageVO;
import com.goodee.vo.ProductVO;
import com.goodee.vo.ReviewCommentVO;
import com.goodee.vo.ReviewVO;
import com.goodee.vo.UserVO;

@Service
public class ReviewService {

	public ProjectDAO dao;

	public ReviewService(ProjectDAO dao) {
		super();
		this.dao = dao;
	}
	
	//Review
	public void getReview(Model model, String id, int page, String desc) {
		// 페이징
		PageVO vo = new PageVO();
		
		vo.setId(id);
		vo.setTotal(dao.getReviewCount(vo.getId()));
		vo.setNowPage(page);
		vo.setCntPerPage(4);
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
		model.addAttribute("page", vo);
		
		//정렬
		if(desc.equals("star")) {
			model.addAttribute("review", dao.getReviewStar(vo));
		} else if(desc.equals("hits")) {
			model.addAttribute("review", dao.getReviewHits(vo));
		} else {
		model.addAttribute("review", dao.getReview(vo));
		}
		model.addAttribute("reviewCount", dao.getReviewCount(id));
		int[] num = {dao.getStarGradeCount1(id),
					dao.getStarGradeCount2(id),
					dao.getStarGradeCount3(id),
					dao.getStarGradeCount4(id),
					dao.getStarGradeCount5(id)};
		model.addAttribute("starGradeCount", num);
		model.addAttribute("starGradeAvg", dao.getStarGradeAvg(id));
		model.addAttribute("pic", dao.getPic(id));
		model.addAttribute("picCount", dao.getPicCount(id));
		model.addAttribute("commentCount", dao.commentCount());
	}
	
	public void getComment(Model model, String id) {
		//상품id 보내서 댓글들 가져온다음에 프론트에서 댓글id랑 review_id랑 일치하면 가져오기
		model.addAttribute("comment", dao.getComment(id));
	}
	
	public ReviewVO photoSelect(int id) {
		return dao.getSelectReview(id);
	}
	public void hitsPlus(int id, int hits) {
		dao.hitsPlus(id, hits);
	}
	public int afterPlus(int id) {
		return dao.afterPlus(id);
	}
	public void commnetInsert(ReviewCommentVO vo) {
		dao.putComment(vo);
	}
	//리뷰쓰기 창에서 상품명 불러오기
	public void getProductName(Model model, int id) {
		String id1 = Integer.toString(id);
		model.addAttribute("proVO", dao.selectDetail(id1));
	}
	//리뷰쓰기 창에서 작성자 불러오기
	public void getSession(HttpSession session) {
		session.getAttribute("user");
	}
	
	//리뷰 DB로 전송
	public void writeReview(@RequestParam("pic1") MultipartFile[] pic1,
							@RequestParam("pic2") MultipartFile[] pic2,
							int id, ReviewVO vo, Model model, HttpSession session) {
		//카테고리
		vo.setCategory();
		System.out.println("세션");
		UserVO uservo = (UserVO)session.getAttribute("user");
		System.out.println("tptus");
		//작성자id
		vo.setOwner_id(Integer.toString(uservo.getId()));
		//작성자이름
		vo.setOwner(uservo.getUsername());
		//상품코드
		String id1 = Integer.toString(id);
		ProductVO provo = dao.selectDetail(id1);
		vo.setCode(provo.getId());
		
		for(MultipartFile file : pic1) {
			if(!file.getOriginalFilename().isEmpty()) {
				//file.transferTo(vo.setPic1(file.getOriginalFilename()));
			}
		}
		
		dao.writeReview(vo);
	}
}
