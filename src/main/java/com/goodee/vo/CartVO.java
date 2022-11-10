package com.goodee.vo;

import org.apache.ibatis.type.Alias;

@Alias("CartVO")
public class CartVO {
	// cart
	private int cartNum;  //장바구니번호
	private int cartListNum; //유진추가 결제내역 페이지에서 사용할것
	private String userid;	// 이용자 아이디
	private String userName;	// user 이름
	private int count; //구매 수량
	
	// product
	private int id;  // 상품 번호
	private String itemName; //상품이름
	private int price; //상품 원가
	private int discount;	// 할인율 
	private String pic1;	// 1번사진
	
	// option
	private String proNum; // 상품코드
	private String color; //옵션 색상
	private String size;  // 옵션 사이즈
	
	// 추가(계산)
	private int salePrice;	// 판매 가격
	// count, price, discount가 있다면 구할 수 있음!
	private int resultPrice;	// 총 가격 = 판매가격 * 수량
	
	// 상품 하나당 포인트
	private int point;
	// 전체 포인트 = 각 포인트 * 수량
	private int totalPoint;
	
	
	// 변경될 때마다 초기화 해주기 위한 메서드
	
	
	public int getCartNum() {
		return cartNum;
	}


	public int getCartListNum() {
		return cartListNum;
	}


	public void setCartListNum(int cartListNum) {
		this.cartListNum = cartListNum;
	}


	public void setSalePrice(int salePrice) {
		this.salePrice = salePrice;
	}


	public void setResultPrice(int resultPrice) {
		this.resultPrice = resultPrice;
	}


	public void setPoint(int point) {
		this.point = point;
	}


	public void setTotalPoint(int totalPoint) {
		this.totalPoint = totalPoint;
	}


	public void setCartNum(int cartNum) {
		this.cartNum = cartNum;
	}


	public String getUserid() {
		return userid;
	}


	public void setUserid(String userid) {
		this.userid = userid;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public int getCount() {
		return count;
	}


	public void setCount(int count) {
		this.count = count;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getItemName() {
		return itemName;
	}


	public void setItemName(String itemName) {
		this.itemName = itemName;
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


	public String getPic1() {
		return pic1;
	}


	public void setPic1(String pic1) {
		this.pic1 = pic1;
	}


	public String getProNum() {
		return proNum;
	}


	public void setProNum(String proNum) {
		this.proNum = proNum;
	}


	public String getColor() {
		return color;
	}


	public void setColor(String color) {
		this.color = color;
	}


	public String getSize() {
		return size;
	}


	public void setSize(String size) {
		this.size = size;
	}

	// getter만
	public int getSalePrice() {
		return salePrice;
	}
	

	public int getResultPrice() {
		return resultPrice;
	}


	public int getPoint() {
		return point;
	}


	public int getTotalPoint() {
		return totalPoint;
	}


	// 금액이 변경될때 쓰는 메서드
	public void initSaleTotal() {
		if((double)this.discount/(double)100 == (double)0) {
			this.salePrice = this.price;
		}else {
			//this.salePrice = Math.round((int)((double)this.price * ((double)1-(double)this.discount/(double)100)));
			
			// d를 반올림 시키고 -> String으로 변환한 다음 -> Integer로 변환
			double d = (double)this.price * ((double)1-(double)this.discount/(double)100);
			this.salePrice = Integer.parseInt(String.valueOf(Math.round(d)));
		}
		this.resultPrice = this.salePrice*count;
		//this.point = (int)(Math.floor(this.salePrice*0.05));
		//this.totalPoint = this.point * this.count;
	}


		// toString
		@Override
		public String toString() {
			return "CartVO [cartNum=" + cartNum + ", userid=" + userid + ", userName=" + userName + ", count=" + count
					+ ", id=" + id + ", itemName=" + itemName + ", price=" + price + ", discount=" + discount
					+ ", pic1=" + pic1 + ", proNum=" + proNum + ", color=" + color + ", size=" + size + ", salePrice="
					+ salePrice + ", resultPrice=" + resultPrice + ", point=" + point + ", totalPoint=" + totalPoint
					+ "]";
		}



}
