package com.smf.my.model.vo;

import java.sql.Date;

public class OrderBuilder { // 빌더 패턴 사용. 학습 동영상 AJAX3 - 5:50:00초 참고
	private int orderNo;       // 주문번호
    private String userId;     // 회원아이디
    private int addrNo;		   // 배송지 번호
    private Date orderDate;    // 주문일
    private int totalAmount;   // 총 금액
    private int orderPno;      // 주문 상품번호
    private int stockNo;       // 재고 상품번호
    private int orderCount;    // 주문 수량
    private int point;		   // 포인트

    private OrderBuilder() {
    	super();
    }
    
    
    public int getOrderNo() {
		return orderNo;
	}

	public String getUserId() {
		return userId;
	}
	
	public int getAddrNo() {
		return addrNo;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public int getTotalAmount() {
		return totalAmount;
	}

	public int getOrderPno() {
		return orderPno;
	}

	public int getStockNo() {
		return stockNo;
	}

	public int getOrderCount() {
		return orderCount;
	}
	public int getPoint() {
		return point;
	}


	public static class Builder{
        private int orderNo;       // 주문번호
        private String userId;     // 회원아이디
        private int addrNo;		   // 배송지 번호
        private Date orderDate;    // 주문일
        private int totalAmount;   // 총 금액
        private int orderPno;      // 주문 상품번호
        private int stockNo;       // 재고 상품번호
        private int orderCount;    // 주문 수량
        private int point;		   // 포인트

        // 필수적
        public Builder(int orderNo){
            this.orderNo = orderNo;
        }
        public Builder(String userId){
            this.userId = userId;
        }
        public Builder(int stockNo, int orderCount){
            this.stockNo = stockNo;
            this.orderCount = orderCount;
        }
        // 선택적
        public Builder setOrderNo(int orderNo) {
        	this.orderNo = orderNo;
        	return this;
        }
        public Builder setUserId(String userId) {
        	this.userId = userId;
        	return this;
        }
        public Builder setAddrNo(int addrNo) {
        	this.addrNo = addrNo;
        	return this;
        }
        public Builder setOrderDate(Date orderDate){
            this.orderDate = orderDate;
            return this;
        }
        public Builder setTotalAmount(int totalAmount) {
        	this.totalAmount = totalAmount;
        	return this;
        }
        public Builder setOrderPno(int orderPno) {
        	this.orderPno = orderPno;
        	return this;
        }
        public Builder setStockNo(int stockNo) {
        	this.stockNo = stockNo;
        	return this;
        }
        public Builder setOrderCount(int orderCount) {
        	this.orderCount = orderCount;
        	return this;
        }
        public Builder setPoint(int point) {
        	this.point = point;
        	return this;
        }

        public OrderBuilder build(){
            OrderBuilder o = new OrderBuilder();
            o.orderNo = this.orderNo;
            o.userId = this.userId;
            o.addrNo = this.addrNo;
            o.orderDate = this.orderDate;
            o.totalAmount = this.totalAmount;
            o.orderPno = this.orderPno;
            o.stockNo = this.stockNo;
            o.orderCount = this.orderCount;
            o.point = this.point;

            return o;
        }
    }

}
