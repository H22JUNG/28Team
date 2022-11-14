package com.goodee.service;

import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.goodee.dao.ProjectDAO;
import com.goodee.vo.PageVO;
import com.goodee.vo.ProductVO;
import com.goodee.vo.ReviewCommentVO;
import com.goodee.vo.ReviewVO;
import com.goodee.vo.UserVO;
import com.goodee.vo.detailOrderVO;

@Service
public class ReviewService {

	public ProjectDAO dao;
	
	@Value("${file.upload.path}")
	private String Path;

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
	//상품명, 세션의 아이디 담아서 리뷰쓰기 권한 설정
	public void getAuthority(Model model, int id, HttpSession session) {
		ReviewVO vo = new ReviewVO();
		this.getProductName(model, id);
		ProductVO provo = (ProductVO) model.getAttribute("proVO");
		String itemName = provo.getName();
		vo.setItemName(itemName);
		
		this.getSession(session);
		UserVO uservo = (UserVO) session.getAttribute("user");
		if(uservo != null) {
			String userId = uservo.getUserid();
			vo.setOwner_id(userId);
		} else {
			vo.setOwner_id("");
		}
		//리뷰 쓸 수 있는 주문내역 있는지 없는지 확인(List)
		model.addAttribute("authority", dao.getAuthority(vo));
		
		//-- 쓸 수 있는 리뷰 여러 개 일 떄--
		if(dao.getAuthority(vo).size() > 1) {
			//리뷰 쓰러 이동할 떄 상품 id 함께 전송
			model.addAttribute("id", id);
			//여러 개 리뷰 중 선택할 수 있도록 정보 제공
			List<ReviewVO> revivo = dao.getAuthority(vo);	//리뷰 작성가능한 주문번호 불러오기
			//작성할 수 있는 주문번호들에 대한 상세정보 불러오기
			List<detailOrderVO> detailvo = new ArrayList<detailOrderVO>();
			String orderNum;
			for(int i=0; i<revivo.size(); i++ ) {
				orderNum = revivo.get(i).getOrderNum();
				detailvo.add((detailOrderVO) dao.detailOrderInfor(orderNum).get(0));
			}
			if(detailvo != null) {
				model.addAttribute("detail", detailvo);
			}
		}
	}
	
	//리뷰 DB로 전송
	public void writeReview(MultipartFile pic1File, MultipartFile pic2File,
							int id, ReviewVO vo, Model model, HttpSession session) {
		
		if(!pic1File.getOriginalFilename().isEmpty()) {	//파일이름이 있으면
			Path path1 = Paths.get(Path+pic1File.getOriginalFilename());
			try {
				pic1File.transferTo(path1);
				vo.setPic1(pic1File.getOriginalFilename());
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		if(!pic2File.getOriginalFilename().isEmpty()) {	//파일이름이 있으면
			Path path2 = Paths.get(Path +pic2File.getOriginalFilename());
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
		//카테고리
		vo.setCategory();
		UserVO uservo = (UserVO)session.getAttribute("user");
		//작성자id
		vo.setOwner_id(Integer.toString(uservo.getId()));
		//작성자이름
		vo.setOwner(uservo.getUsername());
		//상품코드
		String id1 = Integer.toString(id);
		ProductVO provo = dao.selectDetail(id1);
		vo.setCode(provo.getId());
		dao.writeReview(vo);
		dao.writeReviewAfter(vo); //리뷰 작성 후 권한 삭제
		dao.writeReviewPoint(vo); //리뷰 작성 후 포인트 적립
	}
}
