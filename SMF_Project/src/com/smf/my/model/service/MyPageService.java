package com.smf.my.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static com.smf.common.JDBCTemplate.*;

import com.smf.member.model.vo.Member;
import com.smf.my.model.dao.MyPageDao;
import com.smf.my.model.vo.Account;
import com.smf.my.model.vo.Address;
import com.smf.my.model.vo.BuySellHistory;
import com.smf.my.model.vo.Card;
import com.smf.my.model.vo.OrderBuilder;
import com.smf.my.model.vo.ShoppingCart;
import com.smf.my.model.vo.WishList;
import com.smf.shop.model.vo.ProductAll;

public class MyPageService {
	
	// 내 프로필 정보
	public Member myInfoUpdate(String column, String value, String userId) {
		 
		Connection conn = getConnection();
		Member m = null;
		
		int result = new MyPageDao().myInfoUpdate(conn, column, value, userId);
		
		if(result>0) {
			commit(conn);
			m = new MyPageDao().myInfoUpdateLoginUser(conn,userId);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return m;
	}
	
	public int myinfoDelete(String userId) {
		
		Connection conn = getConnection();
		
		int result = new MyPageDao().myinfoDelete(conn, userId);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	// 주소록
	public Address addressDefault(String userId) {
		
		Connection conn = getConnection();
		
		Address addr = new MyPageDao().addressDefault(conn, userId);
		
		close(conn);
		
		return addr;
	}
	
	public ArrayList<Address> addressList(String userId){
		
		Connection conn = getConnection();
		
		ArrayList<Address> addrList = new MyPageDao().addressList(conn, userId); 
		
		close(conn);
		
		return addrList;
	}
	
	public int insertAddress(Address addr) {
		
		Connection conn = getConnection();
		
		int result = new MyPageDao().insertAddress(conn, addr);
		
		if( result>0 ) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}
	
	public int addressDefaultUpdate(int addrNo, String userId) {
		
		 Connection conn = getConnection();
		 
		 int result1 = new MyPageDao().addressDefaultUpdateN(conn, userId);
		 int result2 = new MyPageDao().addressDefaultUpdateY(conn, addrNo, userId);
		 System.out.println(result1);
		 System.out.println(result2);
		 if( result1+result2>0 ) {
			 commit(conn);
		 }else {
			 rollback(conn);
		 }
		 
		 close(conn);
		 
		 return result1+result2;
	}
	
	public int addressUpdate(Address addr) {
		
		Connection conn = getConnection();
		
		int result = new MyPageDao().addressUpdate(conn, addr);
		
		if( result>0 ) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	public int addressDelete(int addrNo, String userId) {
		Connection conn = getConnection();
		
		int result = new MyPageDao().addressDelete(conn, addrNo, userId);
		
		if( result>0 ) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	// 계좌 및 카드 관리
	
	public Account accountSelect(String userId){
		Connection conn = getConnection();
		
		Account account = new MyPageDao().accountSelect(conn, userId);
		
		close(conn);
		
		return account;
	}
	
	public Card cardSelect(String userId) {
		Connection conn = getConnection();
		
		Card card = new MyPageDao().cardSelect(conn, userId);
		
		close(conn);
		
		return card;
	}
	
	public int accountInsert(Account account) {
		Connection conn = getConnection();
		
		int result = new MyPageDao().accountInsert(conn, account);
		
		if( result>0 ) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	public int accountUpdate(Account account) {
		Connection conn = getConnection();
		
		int result = new MyPageDao().accountUpdate(conn, account);
		
		if( result>0 ) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	public int cardInsert(Card card) {
		Connection conn = getConnection();
		
		int result = new MyPageDao().cardInsert(conn, card);
		
		if( result>0 ) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	public int cardUpdate(Card card) {
		Connection conn = getConnection();
		
		int result = new MyPageDao().cardUpdate(conn, card);
		
		if( result>0 ) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	// 관심 상품
	public ArrayList<ProductAll> wishlistList(String userId){
		
		Connection conn = getConnection();
		
		ArrayList<ProductAll> list = new MyPageDao().wishlistList(conn, userId);
		
		close(conn);
		
		return list;
		
	}
	
	public int wishlistItemDelete(String userId, String pName) {
		
		Connection conn = getConnection();
		
		int result = new MyPageDao().wishlistItemDelete(conn, userId, pName);
		
		if( result>0 ) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	
	// 장바구니
	public ArrayList<ShoppingCart> shoppingCartList(String userId){
		
		Connection conn = getConnection();
		
		ArrayList<ShoppingCart> list = new MyPageDao().shoppingCartList(conn, userId);
		
		close(conn);
		
		return list;
	}
	
	public int shoppingCartItemDelete(int cNo) {
		
		Connection conn = getConnection();
		
		int result = new MyPageDao().shoppingCartItemDelete(conn, cNo);
		
		if( result>0 ) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	// 주문 결제
	public ArrayList<ShoppingCart> stockProdcutSelectList(String userId, String[] pArr){
		
		Connection conn = getConnection();
		
		ArrayList<ShoppingCart> list = new MyPageDao().stockProdcutSelectList(conn, userId, pArr);
		
		close(conn);
		
		return list;
	}
	
	public int insertOrder(OrderBuilder ob, int[] cNo, int[] sNo, int usedPoint, int[] orderCount) {
		
		Connection conn = getConnection();
		
		int result1 = 0;
		int result2 = 1;
		int result3 = 1;
		int result4 = 1;
		int result5 = 0;
		
		result1 = new MyPageDao().insertOrder(conn, ob);
				
		for(int i=0; i<sNo.length; i++) {
			result2 *= new MyPageDao().insertOrderProduct(conn, sNo[i], orderCount[i]);
			result3 *= new MyPageDao().shoppingCartItemDelete(conn, cNo[i]);
			result4 *= new MyPageDao().updateStockOrder(conn, sNo[i], orderCount[i]);
			
			System.out.println(result2+" "+result3+" "+result4);
		}
		result5 = new MyPageDao().updateMemberPoint(conn, ob.getUserId(), usedPoint);
		
		
		
		if(result1>0 & result2>0 & result3>0 & result4>0 & result5>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1 & result2 & result3 & result4 & result5;
	}
	
	
	//구매 내역
	public ArrayList<ArrayList<BuySellHistory>> selectBuyListCount(String userId){
		
		Connection conn = getConnection();
			
		//주문 리스트번호 불러오기
		ArrayList<Integer> ListCount = new MyPageDao().selectBuyListCount(conn, userId);
		//주문 리스트 안에 있는 상품들 불러오기
		ArrayList<BuySellHistory> ListInProduct = new ArrayList<>();
		//주문 리스트 묶음
		ArrayList<ArrayList<BuySellHistory>> orderList = new ArrayList<ArrayList<BuySellHistory>>(); 
		
		for(int i=0; i<ListCount.size(); i++) {
			orderList.add(new MyPageDao().selectBuyListInProduct(conn, userId, ListCount.get(i)));
		}
		
		
		return orderList;
	}
	
	
	
}
