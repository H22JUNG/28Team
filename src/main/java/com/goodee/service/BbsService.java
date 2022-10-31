package com.goodee.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import com.goodee.dao.ProjectDAO;
import com.goodee.vo.CartVO;
import com.goodee.vo.CommentVO;
import com.goodee.vo.QnaVO;
import com.goodee.vo.ReviewCommentVO;
import com.goodee.vo.UserVO;
import com.goodee.vo.WrotebbsVO;

@Service
public class BbsService {
	public ProjectDAO dao;

	public BbsService(ProjectDAO dao) {
		super();
		this.dao = dao;
	}

	//내가 쓴 글
	UserVO uservo = new UserVO();
	
	public List<WrotebbsVO> getwrote(Model model, HttpSession session) {
		UserVO uservo = (UserVO)session.getAttribute("user");
		model.addAttribute("list", dao.getwrote(uservo));
		//관리자계정일 경우 모두 보이게
		if(session.getAttribute("admin")!=null) {
			model.addAttribute("allList", dao.getwrote());
		}
		return dao.getwrote(uservo);
	}
	
	/*
	 * public List<WrotebbsVO> getRewrote(Model model) {
	 * model.addAttribute("Relist", dao.getRewrote()); return dao.getRewrote(); }
	 */
	
	public List<WrotebbsVO> getsearch(Model model, String category, HttpSession session) {
		UserVO vo = (UserVO)session.getAttribute("user");
		String id = Integer.toString(vo.getId());
		model.addAttribute("list", dao.getsearch(category, id));
		return dao.getsearch(category, id);
	}
	
	public WrotebbsVO getdetail(@RequestParam int id, String category, Model model) {
		WrotebbsVO vo = new WrotebbsVO();
		vo.setId(id);
		vo.setCategory(category);
		model.addAttribute("detail", dao.getdetail(vo));
		return dao.getdetail(vo);
	}
	
	public void modify(WrotebbsVO vo) {
		dao.modifyReview(vo);
		dao.modifyQna(vo);
	}
	public void getdelete(WrotebbsVO vo) {
		dao.deleteReview(vo);
		dao.deleteMyPageQna(vo);
	}
		
	// 상세페이지 -> 장바구니에 데이터 보내기
		// 장바구니에 담기, 구매하기에 담기
		public void addCart(CartVO cartvo) {
			dao.addCart(cartvo);
		}
		
		//QnA
		//QnA 페이지에 리스트출력
		public void getQnaList(Model model) {
			model.addAttribute("category", "Q&A");
			model.addAttribute("list",dao.QnaList());
		}
		
		//content페이지에 데이터 보내기
		public void getQnaContent(Model model, String id) {
			model.addAttribute("qnaVO", dao.selectQna(id));
		}
		
		//QnA 수정, 생성, 삭제
		public boolean updateQna(QnaVO qnavo) {
			return (dao.updateQna(qnavo)>0)?true:false;
		}
		
		public boolean insertQna(QnaVO qnavo) {
			return (dao.insertQna(qnavo)>0)?true:false;
		}
		
		public boolean deleteQna(QnaVO qnavo) {
			return (dao.deleteQna(qnavo)>0)?true:false;
		}
		
		//조회수
		public int qnaCount(String id) {
			return dao.qnaCount(id);
		}
		
		//QnA 답글기능
		public boolean insertReply(CommentVO commentvo) {
			return (dao.insertReply(commentvo)>0)?true:false;
		}
		
		//이너 QnA 댓글기능
		public void getBBSList(Model model) {
			model.addAttribute("qnaVO1", dao.selectBBSList());
		}
		
		public void getBBSContent(Model model, String id) {
			model.addAttribute("qnaVO", dao.selectBBS(id));
		}
		
		public List<CommentVO> getCommentList(int root) {
			return dao.selectCommentList(root);
		}
		
		public int setComment(CommentVO commentvo) {
			return dao.insertComment(commentvo);
		}
		//이너 QnA 댓글수
		public void updateReplyCount(String id) {
			dao.updateReplyCount(id);
		}
		
		//관리자 정보수정
		public void adminList(Model model) {
			model.addAttribute("list",dao.adminList());
		}

		public void adminListId(Model model, String id) {
			model.addAttribute("uservo", dao.adminListId(id));
		}
		
		public boolean updateAdmin(UserVO uservo) throws Exception {
			return (dao.updateAdmin(uservo)>0)?true:false;
		}
		
		public boolean deleteAdmin(UserVO uservo) {
			return (dao.deleteAdmin(uservo)>0)?true:false;
		}
		
		// 공지사항
		public void selectNotice(Model model) {
			 model.addAttribute("impnotice",dao.selectNotice(1));
			 model.addAttribute("notice",dao.selectNotice(0));
		}
				
		public void selectDetailNotice(Model model, int id) {
			model.addAttribute("notice", dao.selectDetailNotice(id));
			model.addAttribute("prevnotice",dao.selectDetailNotice(id-1));
			model.addAttribute("nextnotice",dao.selectDetailNotice(id+1));
		}
	
}
