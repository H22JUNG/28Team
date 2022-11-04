package com.goodee.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import com.goodee.dao.ProjectDAO;
import com.goodee.vo.PageVO;
import com.goodee.vo.QnaCommentVO;
import com.goodee.vo.QnaVO;
import com.goodee.vo.ReviewCommentVO;
import com.goodee.vo.ReviewVO;
import com.goodee.vo.UserVO;
import com.goodee.vo.WrotebbsVO;

@Service
public class BbsService {
	public ProjectDAO dao;

	public BbsService(ProjectDAO dao) {
		super();
		this.dao = dao;
	}

	// 내가 쓴 글
	UserVO uservo = new UserVO();

	public List<WrotebbsVO> getwrote(Model model, HttpSession session) {
		UserVO uservo = (UserVO) session.getAttribute("user");
		model.addAttribute("list", dao.getwrote(uservo));
		model.addAttribute("list2", dao.getRewrote(uservo));
		return dao.getwrote(uservo);
	}

	public List<WrotebbsVO> getsearch(Model model, String category, HttpSession session) {
		UserVO uservo = (UserVO) session.getAttribute("user");
		String id = Integer.toString(uservo.getId());
		model.addAttribute("list", dao.getsearch(category, id));
		model.addAttribute("list2", dao.getRewrote(uservo));
		return dao.getsearch(category, id);
	}

	public void getReviewDetail(@RequestParam int id, Model model) {
		ReviewVO vo = new ReviewVO();
		vo.setId(id);
		vo.setCategory();
		model.addAttribute("proName", dao.getProName(id));
		model.addAttribute("detail", dao.getReviewDetail(vo));
		model.addAttribute("comment", dao.getReviewcomment(vo));
	}

	public void getQnaDetail(@RequestParam int id, Model model) {
		model.addAttribute("proName", dao.getProName(id));
		model.addAttribute("detail", dao.getQnaDetail(id));
	}

	public void getRewroteQnaDetail(int id, Model model) {
		model.addAttribute("proName", dao.getProName(id));
		model.addAttribute("detail", dao.getRewroteQnaDetail(id));
	}

	public void Qnamodify(int id, Model model) {
		model.addAttribute("proName", dao.getProName(id));
		model.addAttribute("qnamodi", dao.getQnaDetail(id).get(0));
	}

	public void modify(WrotebbsVO vo) {
		if(vo.getCategory().equals("Review")) {
			dao.modifyReview(vo);			
		} else {
			dao.modifyQna(vo);
		}
	}

	public void getdelete(WrotebbsVO vo) {
		dao.deleteReview(vo);
		if (dao.deleteMyPageQna(vo) > 0) {
			dao.isdelete(vo);
		}
		;
	}

	// QnA - 수정
	// QnA 리스트출력 및 페이징
	public void getQnaList(int page, HttpServletRequest request, Model model) {
		PageVO pagevo = new PageVO();
		pagevo.setTotal(dao.selectQnaCount());
		pagevo.setNowPage(page);
		pagevo.setCntPerPage(10);
		pagevo.setStart((page - 1) * pagevo.getCntPerPage());
		pagevo.setEnd(page * pagevo.getCntPerPage());

		pagevo.setCntPerBlock(5);
		// 전체페이지
		int totalPage = pagevo.getTotal() / pagevo.getCntPerPage();
		totalPage = (pagevo.getTotal() % pagevo.getCntPerPage() == 0) ? totalPage : totalPage + 1;
		pagevo.setTotalPage(totalPage);
		// 페이지 설정
		int initPage = (pagevo.getNowPage() - 1) / pagevo.getCntPerBlock() * pagevo.getCntPerBlock();
		// 시작페이지
		int startPage = initPage + 1;
		pagevo.setStartPage(startPage);
		// 끝 페이지
		int endPage = initPage + pagevo.getCntPerBlock();
		if (endPage > pagevo.getTotalPage()) {
			endPage = pagevo.getTotalPage();
		}
		pagevo.setEndPage(endPage);
		model.addAttribute("list", dao.QnaList(pagevo));
		model.addAttribute("page", pagevo);
		model.addAttribute("category", "Q&A");
	}

	// content페이지에 데이터 보내기
	public void getQnaContent(Model model, String id) {
		model.addAttribute("qnaVO", dao.selectQna(id));
	}

	// QnA 수정, 생성, 삭제
	public boolean updateQna(QnaVO qnavo) {
		return (dao.updateQna(qnavo) > 0) ? true : false;
	}

	public boolean insertQna(QnaVO qnavo) {
		return (dao.insertQna(qnavo) > 0) ? true : false;
	}

	public boolean deleteQna(QnaVO qnavo) {
		return (dao.deleteQna(qnavo) > 0) ? true : false;
	}

	// 조회수
	public int qnaCount(String id) {
		return dao.qnaCount(id);
	}

	// QnA 답변기능
	public boolean insertReply(QnaCommentVO commentvo) {
		return (dao.insertReply(commentvo) > 0) ? true : false;
	}

	// 상세페이지 QnA 댓글기능
	// 이너Q&A 조회
	public void getBBSList(int page, HttpServletRequest request, Model model) {
		PageVO pagevo = new PageVO();
		pagevo.setTotal(dao.selectQnaCount());
		pagevo.setNowPage(page);
		pagevo.setCntPerPage(10);
		pagevo.setStart((page - 1) * pagevo.getCntPerPage());
		pagevo.setEnd(page * pagevo.getCntPerPage());

		pagevo.setCntPerBlock(5);
		// 전체페이지
		int totalPage = pagevo.getTotal() / pagevo.getCntPerPage();
		totalPage = (pagevo.getTotal() % pagevo.getCntPerPage() == 0) ? totalPage : totalPage + 1;
		pagevo.setTotalPage(totalPage);
		// 페이지 설정
		int initPage = (pagevo.getNowPage() - 1) / pagevo.getCntPerBlock() * pagevo.getCntPerBlock();
		// 시작페이지
		int startPage = initPage + 1;
		pagevo.setStartPage(startPage);
		// 끝 페이지
		int endPage = initPage + pagevo.getCntPerBlock();
		if (endPage > pagevo.getTotalPage()) {
			endPage = pagevo.getTotalPage();
		}
		pagevo.setEndPage(endPage);

		model.addAttribute("page", pagevo);
		model.addAttribute("qnaVO1", dao.selectBBSList(pagevo));
	}

	// 이너Q&A 타이틀클릭
	public void getBBSContent(Model model, String id) {
		model.addAttribute("qnaVO", dao.selectBBS(id));
	}

	public List<QnaCommentVO> getCommentList(int root) {
		return dao.selectCommentList(root);
	}

	public int setComment(QnaCommentVO commentvo) {
		return dao.insertComment(commentvo);
	}

	// 관리자 정보수정 - 수정
	public void adminList(Model model) {
		model.addAttribute("list", dao.adminList());
	}

	public void adminListId(Model model, String id) {
		model.addAttribute("uservo", dao.adminListId(id));
	}

	public boolean updateAdmin(UserVO uservo) throws Exception {
		return (dao.updateAdmin(uservo) > 0) ? true : false;
	}

	public boolean deleteAdmin(UserVO uservo) {
		return (dao.deleteAdmin(uservo) > 0) ? true : false;
	}

	// 공지사항
	public void selectNotice(Model model) {
		model.addAttribute("impnotice", dao.selectNotice(1));
		model.addAttribute("notice", dao.selectNotice(0));
	}

	public void selectDetailNotice(Model model, int id) {
		model.addAttribute("notice", dao.selectDetailNotice(id));
		model.addAttribute("prevnotice", dao.selectDetailNotice(id - 1));
		model.addAttribute("nextnotice", dao.selectDetailNotice(id + 1));
	}

}
