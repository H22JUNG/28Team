package com.goodee.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import com.goodee.dao.ProjectDAO;
import com.goodee.vo.NoticeVO;
import com.goodee.vo.PageVO;
import com.goodee.vo.QnaCommentVO;
import com.goodee.vo.QnaVO;
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
		dao.deleteMyPageQna(vo);
	}

	// QnA - 수정
	// QnA 리스트출력 및 페이징
	public void getQnaList(int page, HttpServletRequest request, Model model) {
		PageVO pagevo = new PageVO();
		pagevo.setTotal(dao.selectQnaAndQnaCommentCount());
		pagevo.setNowPage(page);
		pagevo.setCntPerPage(10);
		pagevo.setStart((page - 1)*pagevo.getCntPerPage());
		pagevo.setEnd(page*pagevo.getCntPerPage());
		//블록당 페이지
		pagevo.setCntPerBlock(5);
		// 전체페이지
		int totalPage = pagevo.getTotal()/pagevo.getCntPerPage();
		totalPage = (pagevo.getTotal()%pagevo.getCntPerPage() == 0)?totalPage:totalPage+1;
		pagevo.setTotalPage(totalPage);
		// 페이지 설정
		int initPage = (pagevo.getNowPage()-1)/pagevo.getCntPerBlock()*pagevo.getCntPerBlock();
		// 시작페이지
		int startPage = initPage+1;
		pagevo.setStartPage(startPage);
		// 마지막 페이지
		int endPage = initPage+pagevo.getCntPerBlock();
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
		dao.qnaCount(id);
		dao.selectQnaCommentCount(id);
		model.addAttribute("qnaVO", dao.selectQna(id));
		model.addAttribute("qnacommentVO", dao.selectQnaComment(id));
		
	}

	// QnA 수정, 생성, 삭제
	public boolean updateQna(QnaVO qnavo) {
		return (dao.updateQna(qnavo) > 0) ? true : false;
	}

	public boolean insertQna(QnaVO qnavo) {
		return (dao.insertQna(qnavo) > 0) ? true : false;
	}

	public boolean deleteQna(QnaVO qnavo, QnaCommentVO commentvo) {
		dao.deleteQna(qnavo);
		commentvo.setRoot(qnavo.getId());
		dao.deleteQnaComment(commentvo);
		return true;
	}
	
	// QnA 답변만 삭제
	public boolean deleteQnaComment(QnaCommentVO commentvo) {
		dao.deleteOnlyQnaComment(commentvo);
		return true;
	}

	// 조회수
	public int qnaCount(String id) {
		return dao.qnaCount(id);
	}
	
	public int selectQnaCommentCount(String id) {
		return dao.selectQnaCommentCount(id);
	}

	// QnA 답변기능
	public boolean insertReply(QnaCommentVO commentvo) {
		return (dao.insertReply(commentvo) > 0) ? true : false;
	}

	// 상세페이지 QnA 댓글기능
	// 이너Q&A 조회
	public void getBBSList(int page, HttpServletRequest request, Model model) {
		PageVO pagevo = new PageVO();
		pagevo.setTotal(dao.selectQnaCountWhereCode());
		pagevo.setNowPage(page);
		pagevo.setCntPerPage(10);
		pagevo.setStart((page - 1) * pagevo.getCntPerPage());
		pagevo.setEnd(page * pagevo.getCntPerPage());

		pagevo.setCntPerBlock(1);
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
		if ( model.getAttribute("code") != null ) {
			int code = Integer.parseInt( (String)model.getAttribute("code") );
			pagevo.setCode(code);
		}
		
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
				public void selectNotice(Model model, PageVO vo) {
					
					// 중요 공지
					vo.setImportant(1);
					model.addAttribute("impnotice", dao.selectNotice(vo));
					
					// 일반 공지
					vo.setImportant(0);
					vo.setTotal(dao.countNotice(vo));
					vo.setNowPage(vo.getPage());
					vo.setCntPerPage(15);
					vo.setCntPerBlock(5);
					
					
					int totalPage = vo.getTotal() / vo.getCntPerPage();
					totalPage = (vo.getTotal() % vo.getCntPerBlock() == 0)? totalPage : totalPage + 1;
					vo.setTotalPage(totalPage);
					
					vo.setStart((vo.getPage() - 1) * vo.getCntPerPage());
					vo.setEnd(vo.getPage() * vo.getCntPerPage());
					
					int initPage = (vo.getNowPage() - 1) / vo.getCntPerBlock() * vo.getCntPerBlock();
					int startPage = initPage + 1;
					vo.setStartPage(startPage);
					
					int endPage = initPage + vo.getCntPerBlock();
					if (endPage > vo.getTotalPage()) {
						endPage = vo.getTotalPage();
					}
					vo.setEndPage(endPage);
					
					int nowBlock = (vo.getNowPage() / vo.getCntPerBlock());
					nowBlock = (vo.getNowPage() % vo.getCntPerBlock() == 0)? nowBlock : nowBlock + 1;  
					vo.setNowBlock(nowBlock);
					
					int totalBlock = vo.getTotalPage()/vo.getCntPerBlock();
					totalBlock = (vo.getTotalPage() % vo.getCntPerBlock() == 0)? totalBlock : totalBlock + 1;
					vo.setTotalBlock(totalBlock);
					
					model.addAttribute("page", vo);
					model.addAttribute("notice", dao.selectNotice(vo));
				}

				public void selectDetailNotice(Model model, int no) {
					dao.updateNoticeView(no);
					model.addAttribute("notice", dao.selectDetailNotice(no));
					model.addAttribute("prevnotice", dao.selectDetailNotice(no - 1));
					model.addAttribute("nextnotice", dao.selectDetailNotice(no + 1));
				}
				
				public void insertNotice(NoticeVO vo) {
					dao.insertNotice(vo);
				}
				public void updateNotice(NoticeVO vo) {
					dao.updateNotice(vo);
				}
				public void deleteNotice(int id) {
					NoticeVO vo = new NoticeVO();
					vo.setId(id);
					dao.deleteNotice(vo);
				}


}
