package com.goodee.vo;

import org.apache.ibatis.type.Alias;

@Alias("pageVO")
public class PageVO {
	//현재페이지
	private int nowPage;
	//시작페이지
	private int startPage;
	//종료페이지
	private int endPage;
	//전체페이지
	private int totalPage;
	//총 row 개수
	private int total;
	//블럭당 row 개수 (12)
	private int cntPerPage;
	//처음 row
	private int start;
	// 끝 row
	private int end;
	//현재 블록
	private int nowBlock;
	//블록 당 페이지
	private int cntPerBlock;
	//총 블록 개수
	private int totalBlock;

	// 검색 변수
	private String userInfo;
	private String userid;
	private String username;
	private String tel;
	private String address;
	private String email;
	
	//리뷰 카테고리
	private String id;
	
	//큐앤에이 코드
	private Integer code;
	
	//공지사항 게시판
	private int important;
	private String option;
	private String search;
	private int page;
	
	// 상품관리 리스트
	private String content;
	public String category1;
	public String category2;
	public String category;
	private String proNum;
	private String name;
	
	
	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(String userInfo) {
		this.userInfo = userInfo;
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getCntPerPage() {
		return cntPerPage;
	}

	public void setCntPerPage(int cntPerPage) {
		this.cntPerPage = cntPerPage;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getNowBlock() {
		return nowBlock;
	}

	public void setNowBlock(int nowBlock) {
		this.nowBlock = nowBlock;
	}

	public int getCntPerBlock() {
		return cntPerBlock;
	}

	public void setCntPerBlock(int cntPerBlock) {
		this.cntPerBlock = cntPerBlock;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getTotalBlock() {
		return totalBlock;
	}

	public void setTotalBlock(int totalBlock) {
		this.totalBlock = totalBlock;
	}

	public int getImportant() {
		return important;
	}

	public void setImportant(int important) {
		this.important = important;
	}

	public String getOption() {
		return option;
	}

	public void setOption(String option) {
		this.option = option;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;		
		/*
		this.setCategory(content);
		System.out.println(content);
		*/
	}


	public String getCategory1() {
		return category1;
	}

	public void setCategory1(String category1) {
		this.category1 = category1;
		this.setCategory(category1);
	}

	public String getCategory2() {
		return category2;
	}

	public void setCategory2(String category2) {
		this.category2 = category2;
		this.setCategory(category2);
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		/*
		if(category.equals("가구")) {
			this.content = "furniture";
		}else if(category.equals("침대")) {
			this.content = "bed";
		}else if(category.equals("소파")) {
			this.content = "sofa";
		}else if(category.equals("거울")) {
			this.content = "mirror";
		}else if(category.equals("의자")) {
			this.content = "chair";
		}else if(category.equals("패브릭")) {
			this.content = "fabric";
		}else if(category.equals("커튼")) {
			this.content = "curtain";
		}else if(category.equals("침구")) {
			this.content = "bedding";
		}else if(category.equals("러그")) {
			this.content = "rug";
		}else if(category.equals("수납용품")) {
			this.content = "storage";
		}else if(category.equals("수납장")) {
			this.content = "storage store";
		}else if(category.equals("옷걸이")) {
			this.content = "organization";
		}else if(category.equals("생활용품")) {
			this.content = "supplies";
			this.content = "supplies";
		}
		 */
		if(category.equals("가구")) {
			this.category1 = "furniture";
		}else if(category.equals("침대")) {
			this.category2 = "bed";
		}else if(category.equals("소파")) {
			this.category2 = "sofa";
		}else if(category.equals("거울")) {
			this.category2 = "mirror";
		}else if(category.equals("의자")) {
			this.category2 = "chair";
		}else if(category.equals("패브릭")) {
			this.category1 = "fabric";
		}else if(category.equals("커튼")) {
			this.category2 = "curtain";
		}else if(category.equals("침구")) {
			this.category2 = "bedding";
		}else if(category.equals("러그")) {
			this.category2 = "rug";
		}else if(category.equals("수납용품")) {
			this.category1 = "storage";
		}else if(category.equals("수납장")) {
			this.category2 = "storage store";
		}else if(category.equals("옷걸이")) {
			this.category2 = "organization";
		}else if(category.equals("생활용품")) {
			this.category1 = "supplies";
			this.category2 = "supplies";
		}
	}

	public String getProNum() {
		return proNum;
	}

	public void setProNum(String proNum) {
		this.proNum = proNum;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
}
