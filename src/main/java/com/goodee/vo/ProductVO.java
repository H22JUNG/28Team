package com.goodee.vo;

import org.apache.ibatis.type.Alias;

@Alias("productVO")
public class ProductVO {
	public int id;
	public String category1;
	public String category2;
	public String category;
	public String pic1;
	public String pic2;
	public String pic3;
	public String pic4;
	public String name;
	public int price;
	public int discount;
	public int view;
	public String createDate;
	public int totalStock;
	public int stargrade;
	public int reviewCount;
	public int order;
	public String viewPrice;
	public String search;
	public String salePrice;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCategory1() {
		return category1;
	}
	public void setCategory1(String category1) {
		this.category1 = category1;
	}
	public String getCategory2() {
		return category2;
	}
	public void setCategory2(String category2) {
		this.category2 = category2;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
		if(this.category.equals("furniture")) {
			this.category = "가구";
		}else if(this.category.equals("bed")) {
			this.category = "침대";
		}else if(this.category.equals("sofa")) {
			this.category = "소파";
		}else if(this.category.equals("mirror")) {
			this.category = "거울";
		}else if(this.category.equals("chair")) {
			this.category = "의자";
		}else if(this.category.equals("fabric")) {
			this.category = "패브릭";
		}else if(this.category.equals("curtain")) {
			this.category = "커튼";
		}else if(this.category.equals("bedding")) {
			this.category = "침구";
		}else if(this.category.equals("rug")) {
			this.category = "러그";
		}else if(this.category.equals("storage")) {
			this.category = "수납용품";
		}else if(this.category.equals("storage store")) {
			this.category = "수납장";
		}else if(this.category.equals("organization")) {
			this.category = "옷걸이";
		}else if(this.category.equals("supplies")) {
			this.category = "생활용품";
		}
		
	}
	public String getPic1() {
		return pic1;
	}
	public void setPic1(String pic1) {
		this.pic1 = pic1;
	}
	public String getPic2() {
		return pic2;
	}
	public void setPic2(String pic2) {
		this.pic2 = pic2;
	}
	public String getPic3() {
		return pic3;
	}
	public void setPic3(String pic3) {
		this.pic3 = pic3;
	}
	public String getPic4() {
		return pic4;
	}
	public void setPic4(String pic4) {
		this.pic4 = pic4;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public int getView() {
		return view;
	}
	public void setView(int view) {
		this.view = view;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public int getTotalStock() {
		return totalStock;
	}
	public void setTotalStock(int totalStock) {
		this.totalStock = totalStock;
	}
	public int getStargrade() {
		return stargrade;
	}
	public void setStargrade(int stargrade) {
		this.stargrade = stargrade;
	}
	public int getReviewCount() {
		return reviewCount;
	}
	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}
	public int getOrder() {
		return order;
	}
	public void setOrder(int order) {
		this.order = order;
	}
	public String getViewPrice() {
		return viewPrice;
	}
	public void setViewPrice(String viewPrice) {
		this.viewPrice = viewPrice;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	
	public String getSalePrice() {
		return salePrice;
	}
	public void setSalePrice(String salePrice) {
		this.salePrice = salePrice;
	}
	
	
	
}
