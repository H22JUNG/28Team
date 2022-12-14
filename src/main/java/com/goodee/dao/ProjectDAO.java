package com.goodee.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.goodee.vo.CartVO;
import com.goodee.vo.QnaCommentVO;
import com.goodee.vo.NoticeVO;
import com.goodee.vo.OptionVO;
import com.goodee.vo.PageVO;
import com.goodee.vo.ProductListVO;
import com.goodee.vo.ProductVO;
import com.goodee.vo.QnaVO;
import com.goodee.vo.ReviewCommentVO;
import com.goodee.vo.ReviewVO;
import com.goodee.vo.UserVO;
import com.goodee.vo.WrotebbsVO;
import com.goodee.vo.detailOrderVO;
import com.goodee.vo.orderUser;

@Mapper
public interface ProjectDAO {
	
	//카테고리별 상품 리스트로 이동
	public List<ProductVO> selectCategory(ProductVO vo);
	public List<ProductVO> selectBest(ProductVO vo);	
	
	// 메인페이지 베스트 리뷰
	public List<ReviewVO> selectBestReview();
	
	//product List 출력 - 윤정
	public List<ProductListVO> selectProductList(PageVO vo);
	public int productCount(PageVO vo);
	public List<ProductListVO> serchProductList(PageVO vo);
	//product 수정페이지 리스트 불러오기
	public List<ProductListVO> selectUpdateList(String proNum);
	//product 수정하기
	public void update1(ProductListVO vo);
	public void update2(ProductListVO vo);
	public void update3(ProductListVO vo);
	public void update4(ProductListVO vo);
	//product 지우기
	public void productDelete(String pro_num);
	public void optionNullId();
	//product insert
	public void productInsert(ProductListVO vo);
	public void optionInsert(ProductListVO vo);
	public void categoryIdUpdate();
	public void proNumUpdate();
	
	
	//내가 쓴 글
	public List<WrotebbsVO> getwrote();
	public List<WrotebbsVO> getwrote(UserVO vo);
	public List<WrotebbsVO> getRewrote(UserVO vo);
	public List<WrotebbsVO> getsearch(@Param("category")String category, @Param("id")String id);
	public List<QnaVO> getQnaDetail(int id);
	public QnaVO getRewroteQnaDetail(int id);
	public ReviewVO getReviewDetail(ReviewVO vo);
	public List<ReviewVO> getReviewcomment(ReviewVO vo);	
	public String getProName(int id);
	public void modifyReview(WrotebbsVO vo);
	public void modifyQna(WrotebbsVO vo);
	public void deleteReview(WrotebbsVO vo);
	public int deleteMyPageQna(WrotebbsVO vo);
	
	//관리자페이지 회원조회
	public int usercount(PageVO vo);
	public List<UserVO> userList(PageVO vo);
	public List<UserVO> userListdetail(@Param("id") int id);
	public void adminUserUpdate(UserVO vo);
	public void adminUserDelete(UserVO vo);
	
	//유진 DAO
	public void orderUserInfor(orderUser vo); //입력한 주문자정보 저장
	public void orderItemInfor(CartVO vo); //상품 정보 저장할예정	
	public int selectCartListNum(String userid);
	//리턴값은 jsp에 출력하기위해서 
	// 마이페이지에서 주문별(장바구니)로 출력하기
	public List<orderUser> getOrderList(PageVO vo); 
	public orderUser orderUserResult(String userid); //위에서 저장한 정보 출력
	public UserVO payUserInfor(String userid);
	public List<detailOrderVO> detailOrderInfor(String orderNum);
	public void orderStock(CartVO vo);
	public void orderPoint(orderUser vo);
	public CartVO findCart(CartVO vo);
	public void cartDelete(CartVO vo);
	public List<CartVO> getCartInfor(UserVO uservo);
	public void PayResultChange(orderUser vo); //payResult 값을 변경하기 위함
	public int OrderListCount(PageVO vo);
	//여기서위까지 유진 DAO

	//Review 게시판
	public List<ReviewVO> getReview(PageVO vo);
	public List<ReviewVO> getReviewStar(PageVO vo);
	public List<ReviewVO> getReviewHits(PageVO vo);
	public int getReviewCount(String id);
	public int getStarGradeCount1(String id);
	public int getStarGradeCount2(String id);
	public int getStarGradeCount3(String id);
	public int getStarGradeCount4(String id);
	public int getStarGradeCount5(String id);
	public double getStarGradeAvg(String id);
	public List<ReviewVO> getPic(String id);
	public int getPicCount(String id);
	//리뷰 게시판 댓글
	public List<ReviewCommentVO> getComment(String id);
	public List<ReviewCommentVO> commentCount();
	public void hitsPlus(@Param("id")int id, @Param("hits")int hits);
	public int afterPlus(@Param("id")int id);
	public void putComment(ReviewCommentVO vo);
	//리뷰 모달창
	public ReviewVO getSelectReview(int id);
	//리뷰 작성
	public List<ReviewVO> getAuthority(ReviewVO vo);
	public void writeReview(ReviewVO vo);
	public void writeReviewAfter(ReviewVO vo);
	public void writeReviewPoint1000(ReviewVO vo);
	public void writeReviewPoint(ReviewVO vo);
	
	//수정
	//상품 상세페이지 조회
	public ProductVO selectDetail(String id);
	public List<OptionVO> selectDetailOption(String id);
	public List<OptionVO> selectOptionColor(String id);
	public List<String> selectColorByIdAndSize(OptionVO optionVO);
	public String selectProNumBySizeAndColor(OptionVO optionVO);
				
	//장바구니 담기
	public int addCart(CartVO cartvo);
				
	//Q&A 게시판
	public int selectQnaCount();  
	public int selectQnaAndQnaCommentCount(); //원글+댓글 개수
	public int selectQnaCountWhereCode(); //'상품문의'일때의 원글 개수
	public List<QnaVO> QnaList(PageVO pagevo);
	//Q&A 타이틀 누르면 이동
	public QnaVO selectQna(String id);
	public QnaCommentVO selectQnaComment(String id); //답변글
	//Q&A 수정, 생성, 삭제
	public int updateQna(QnaVO qnavo); //원글수정
	public int insertQna(QnaVO qnavo);
	public int deleteQna(QnaVO qnavo); //원글삭제
	public int deleteQnaComment(QnaCommentVO commentvo); //답변삭제
	public int deleteOnlyQnaComment(QnaCommentVO commentvo); //답변만삭제
	//Q&A 조회수
	public int qnaCount(String id);
	public int selectQnaCommentCount(String id);
				
	//Q&A 답글기능
	public int insertReply(QnaCommentVO commentvo);
				
	//이너 Q&A 댓글기능
	public List<QnaVO> selectBBSList(PageVO pagevo);
	public QnaVO selectBBS(String id);	
	public List<QnaCommentVO> selectCommentList(@Param("root") int root);
	public int insertComment(QnaCommentVO commentvo);
				
	//관리자 정보수정
	public List<UserVO> adminList();
	public UserVO adminListId(String id);
	public int updateAdmin(UserVO uservo);
	public int deleteAdmin(UserVO uservo);
	
	// 공지사항 게시판
	public int countNotice(PageVO vo);
	public List<NoticeVO> selectNotice(PageVO vo);
	public NoticeVO selectDetailNotice(int no);
	public void updateNoticeView(int no);
	public void insertNotice(NoticeVO vo);
	public void updateNotice(NoticeVO vo);
	public void deleteNotice(NoticeVO vo);
	
	// ================ 장바구니 ================
	// 장바구니 삭제 - 지정한 row를 삭제하는 메서드
	public int deleteCart(int cartNum);
	//public void deleteCart(CartVO cvo);
	// 장바구니 선택 삭제
	public void deleteAllCart(int cartNum);
	// 장바구니 수량 수정 - 지정한 row의 수량을 변경하는 메서드(cartNum, count 필요)
	public void modifyCount(CartVO cvo);
	// 장바구니 목록
	public List<CartVO> getCart(String userid);
	// 장바구니 확인 - 회원정보와 상품정보를 넘겨서 해당하는 row가 있는지 확인하기 위해 작성한 메서드(userid, itemid 필요)
	public CartVO checkCart(CartVO cvo);
	// 장바구니 전체 삭제
	public void deleteAll(String userid);
			
	// =============== 관리자페이지 - 주문관리 =====================
	// 결제완료된 리스트 뽑아오기
	public List<orderUser> selectAdminOrder(@Param("delivstate") int delivstate);
	// null 업데이트
	public void updateNull();
	// 모달창
	public List<detailOrderVO> selectOrderModal(detailOrderVO dvo);
	// delivnum Update
	public void delivNumberUpdate(orderUser ovo);
	public void delivstatUpdate2();
	public void delivstatUpdate1();
	// orderState
	public int orderState1();
	public int orderState2();
	public int orderState3();
	// 환불 처리
	public void orderCancel(orderUser ovo);
	public void cancelPointUpdate(orderUser ovo);
	public void cancelCountUpdate(orderUser ovo);
	// 검색기능
	public List<orderUser> orderSerch(orderUser ovo);
	// 송장번호 수정
	public void delivnumUpdate(orderUser ovo);
	// delivstate 배송완료 변경버튼
	public void delivStateUpdate(orderUser ovo);
}
