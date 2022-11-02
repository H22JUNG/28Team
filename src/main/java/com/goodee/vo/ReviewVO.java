package com.goodee.vo;

import java.io.File;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

@Alias("reviewVO")
public class ReviewVO {
	private int id;
	private String category;
	private String title;
	private String content;
	private MultipartFile[] pic1;
	private String pic2;
	private String owner_id;
	private String owner;
	private String createDate;
	private int code;
	private String productName;
	private int stargrade;
	private int hits;
	
	private int commId;
	private int productId;
	private int reviewId;
	private String userid;
	private String username;
	private String commContent;
	
	//상품별 review 총 갯수
	private int reviewCount;
	//별점별 갯수
	private int star1;
	private int star2;
	private int star3;
	private int star4;
	private int star5;
	//별점평균
	private double avg;
	
	
	
	public String getCategory() {
		return category;
	}
	public void setCategory() {
		this.category = "Review";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public MultipartFile[] getPic1() {
		return pic1;
	}
	public void setPic1(MultipartFile[] pic1) {
		this.pic1 = pic1;
	}
	public String getPic2() {
		return pic2;
	}
	public void setPic2(String pic2) {
		this.pic2 = pic2;
	}
	public String getOwner_id() {
		return owner_id;
	}
	public void setOwner_id(String owner_id) {
		this.owner_id = owner_id;
	}
	public String getOwner() {
		return owner;
	}
	public void setOwner(String owner) {
		this.owner = owner;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public int getStargrade() {
		return stargrade;
	}
	public void setStargrade(int stargrade) {
		this.stargrade = stargrade;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	public int getReviewCount() {
		return reviewCount;
	}
	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}
	public int getStar1() {
		return star1;
	}
	public void setStar1(int star1) {
		this.star1 = star1;
	}
	public int getStar2() {
		return star2;
	}
	public void setStar2(int star2) {
		this.star2 = star2;
	}
	public int getStar3() {
		return star3;
	}
	public void setStar3(int star3) {
		this.star3 = star3;
	}
	public int getStar4() {
		return star4;
	}
	public void setStar4(int star4) {
		this.star4 = star4;
	}
	public int getStar5() {
		return star5;
	}
	public void setStar5(int star5) {
		this.star5 = star5;
	}
	public double getAvg() {
		return avg;
	}
	public void setAvg(double avg) {
		this.avg = avg;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getCommId() {
		return commId;
	}
	public void setCommId(int commId) {
		this.commId = commId;
	}

	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public int getReviewId() {
		return reviewId;
	}
	public void setReviewId(int reviewId) {
		this.reviewId = reviewId;
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
	public String getCommContent() {
		return commContent;
	}
	public void setCommContent(String commContent) {
		this.commContent = commContent;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
	
	
	
	
}
