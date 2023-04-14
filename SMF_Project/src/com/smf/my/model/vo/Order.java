package com.smf.my.model.vo;

import java.sql.Date;

public class Order { // 빌더 패턴 사용. 학습 동영상 AJAX3 - 5:50:00초 참고
	private int orderNo;       // 주문번호
    private String userId;     // 회원아이디
    private Date orderDate;    // 주문일
    private int totalAmount;   // 총 금액
    private int orderPno;      // 주문 상품번호
    private int stockNo;       // 재고 상품번호
    private int orderCount;    // 주문 수량

    public static class Builder{
        private int orderNo;       // 주문번호
        private String userId;     // 회원아이디
        private Date orderDate;    // 주문일
        private int totalAmount;   // 총 금액
        private int orderPno;      // 주문 상품번호
        private int stockNo;       // 재고 상품번호
        private int orderCount;    // 주문 수량


        // 필수적
        public Builder(int orderNo){
            this.orderNo = orderNo;
        }
        public Builder(String userId){
            this.userId = userId;
        }

        // 선택적
        public Builder setOrderDate(Date orderDate){
            this.orderDate = orderDate;

            return this;
        }

        public Order build(){
            Order o = new Order();
            o.orderNo = this.orderNo;
            o.userId = this.userId;
            o.orderDate = this.orderDate;
            o.totalAmount = this.totalAmount;
            o.orderPno = this.orderPno;
            o.stockNo = this.stockNo;
            o.orderCount = this.orderCount;

            return o;
        }
    }

}
