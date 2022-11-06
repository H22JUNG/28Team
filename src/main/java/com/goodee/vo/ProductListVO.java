package com.goodee.vo;

public class ProductListVO {
	// product
	public int id;
	public String category1;
	public String category2;
	public String pic1;
	public String pic2;
	public String pic3;
	public String pic4;
	public String name;
	public int price;
	public int discount;
	public int view;
	public String createDate;
	
	// option
	private String proNum;
	private String size;
	private String color;
	private int stock;
	
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
	public String getProNum() {
		return proNum;
	}
	public void setProNum(String proNum) {
		this.proNum = proNum;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	
	@Override
	public String toString() {
		return "ProductListVO [id=" + id + ", category1=" + category1 + ", category2=" + category2 + ", pic1=" + pic1
				+ ", pic2=" + pic2 + ", pic3=" + pic3 + ", pic4=" + pic4 + ", name=" + name + ", price=" + price
				+ ", discount=" + discount + ", view=" + view + ", createDate=" + createDate + ", proNum=" + proNum
				+ ", size=" + size + ", color=" + color + ", stock=" + stock + "]";
	}
	
	

	
}
