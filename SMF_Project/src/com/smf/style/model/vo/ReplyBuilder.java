package com.smf.style.model.vo;

public class ReplyBuilder {
	
	
	
	private int cNo;
	private String cContent;
	private int postNo;
	
	private ReplyBuilder() {
		super();
	}
	
	public static class Builder {
		
		private int cNo; // 필수로 받아야할 정보
		private String cContent; // 선택적으로 받아야할 정보
		private int postNo;// 선택적으로 받아야할 정보
		
		// 필수로 받아야할정보는 생성자로 값을 전달해줌.
		public Builder(int cNo) {
			this.cNo = cNo;
		}
		
		// 선택적으로 받아야하는 빌더클래스의 필드값을 세터함수로 만듬(이때 반환값은 Builder객체로 반환★)
		public Builder setcContent(String cContent) {
			this.cContent = cContent;
			
			return this; // 현재 객체를 반환함으로써 메서드 체이닝을 이용할수 있게함.
		}
		
		public Builder setPostNo(int postNo) {
			this.postNo = postNo;
			
			return this;
		}
		
		public ReplyBuilder build() {
			
			ReplyBuilder rb = new ReplyBuilder();
			rb.cNo = this.cNo;
			rb.cContent = this.cContent;
			rb.postNo = this.postNo;
			
			return rb;
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
