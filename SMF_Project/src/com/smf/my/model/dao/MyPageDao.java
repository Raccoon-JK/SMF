package com.smf.my.model.dao;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

import static com.smf.common.JDBCTemplate.*;

import com.smf.main.model.vo.Product;
import com.smf.member.model.vo.Member;
import com.smf.my.model.vo.Account;
import com.smf.my.model.vo.Address;
import com.smf.my.model.vo.Card;
import com.smf.my.model.vo.ReplacePhoneNumber;
import com.smf.my.model.vo.WishList;
import com.smf.shop.model.vo.ProductAll;

public class MyPageDao {

	private Properties prop = new Properties();
	
	public MyPageDao() {
		String fileName = MyPageDao.class.getResource("/sql/my/my-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (InvalidPropertiesFormatException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 내 프로필 정보
	public int myInfoUpdate(Connection conn, String column, String value, String userId) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
//		String sql = prop.getProperty("myInfoUpdate");
		String sql = "UPDATE MEMBER SET "+column+" = ? WHERE USER_ID = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, value);
			pstmt.setString(2, userId);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public Member myInfoUpdateLoginUser(Connection conn, String userId) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member m = null;
		
		String sql = prop.getProperty("myInfoUpdateLoginUser");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				m = new Member(rset.getString("USER_ID"),
						   rset.getString("USER_NAME"),
						   rset.getString("USER_PWD"),
						   rset.getString("PHONE"),
						   rset.getDate("BIRTH"),
						   rset.getInt("USER_TYPE"),
						   rset.getString("AGREE_EMAIL"),
						   rset.getString("USER_IMAGE"),
						   rset.getString("INTRODUCE"),
						   rset.getString("SNS_ID"),
						   rset.getInt("TOTAL_POINT")
						   );
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return m;
		
	}
	
	public int myinfoDelete(Connection conn, String userId) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("myinfoDelete");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	//주소록
	public Address addressDefault(Connection conn, String userId) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Address addr = null;
		
		String sql = prop.getProperty("addressDefult");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				addr = new Address( rset.getInt("ADDRESS_NO"), 
								    rset.getString("USER_ID"), 
								    rset.getString("RECEIVER"), 
								    ReplacePhoneNumber.repacePhoneNo(rset.getString("PHONE")), 
								    rset.getInt("POSTCODE"), 
								    rset.getString("ADDRESS")
								   );
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return addr;
	}
	
	public ArrayList<Address> addressList(Connection conn, String userId){
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("addressList");
		
		ArrayList<Address> addrList = new ArrayList();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Address addr = new Address( rset.getInt("ADDRESS_NO"), 
										    rset.getString("USER_ID"), 
										    rset.getString("RECEIVER"), 
										    ReplacePhoneNumber.repacePhoneNo(rset.getString("PHONE")), 
										    rset.getInt("POSTCODE"), 
										    rset.getString("ADDRESS")
										   );
				addrList.add(addr);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return addrList;
	}
	
	public int insertAddress(Connection conn, Address addr) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertAddress");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, addr.getUserId());
			pstmt.setString(2, addr.getReceiver());
			pstmt.setString(3, addr.getPhone());
			pstmt.setInt(4, addr.getPostcode());
			pstmt.setString(5, addr.getAddress());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int addressDefaultUpdateY(Connection conn, int addrNo, String userId) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("addressDefaultUpdateY");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, addrNo);
			pstmt.setString(2, userId); //userId
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int addressDefaultUpdateN(Connection conn, String userId) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("addressDefaultUpdateN");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId); //userId
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int addressUpdate(Connection conn, Address addr) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("addressUpdate");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, addr.getReceiver());
			pstmt.setInt(2, Integer.parseInt(addr.getPhone()));
			pstmt.setInt(3, addr.getPostcode());
			pstmt.setString(4, addr.getAddress());
			pstmt.setInt(5, addr.getAddressNo());
			pstmt.setString(6, addr.getUserId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int addressDelete(Connection conn, int addrNo, String userId) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("addressDelete");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, addrNo);
			pstmt.setString(2, userId); //userId
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	// 계좌 및 카드 관리
	public Account accountSelect(Connection conn, String userId){
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Account account = null;
		
		String sql = prop.getProperty("accountSelect");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				account = new Account(rset.getString("USER_ID"),
									  rset.getString("BANK_NAME"),
									  rset.getInt("ACCOUNT_NO"),
									  rset.getString("ACCOUNT_HOLDER")
									 ); 
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return account;
	}
	
	public Card cardSelect(Connection conn, String userId) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Card card = null;
		
		String sql = prop.getProperty("cardSelect");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				card = new Card(rset.getString("USER_ID"),
								rset.getInt("CARD_NO"),
								rset.getInt("CARD_PWD"),
								rset.getDate("CARD_VALIDIY"),
								rset.getInt("CVC")
								);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return card;
	}
	
	public int accountInsert(Connection conn, Account account) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("accountInsert");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, account.getUserId());
			pstmt.setString(2, account.getBankName());
			pstmt.setInt(3, account.getAccountNo());
			pstmt.setString(4, account.getAccountHolder());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int accountUpdate(Connection conn, Account account) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("accountUpdate");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, account.getBankName());
			pstmt.setInt(2, account.getAccountNo());
			pstmt.setString(3, account.getAccountHolder());
			pstmt.setString(4, account.getUserId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int cardInsert(Connection conn, Card card) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("cardInsert");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, card.getUserId());
			pstmt.setInt(2, card.getCardNo());
			pstmt.setInt(3, card.getCardPwd());
			pstmt.setDate(4, card.getCardValidity());
			pstmt.setInt(5, card.getCvc());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int cardUpdate(Connection conn, Card card) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("cardUpdate");
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, card.getCardNo());
			pstmt.setInt(2, card.getCardPwd());
			pstmt.setDate(3, card.getCardValidity());
			pstmt.setInt(4, card.getCvc());
			pstmt.setString(5, card.getUserId());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	//관심 상품
	public ArrayList<ProductAll> wishlistList(Connection conn, String userId){
		
		ArrayList<ProductAll> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("wishlistList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				ProductAll pAll = new ProductAll(rset.getString("PRODUCT_NAME"), 
												 rset.getString("BRAND_NAME"), 
												 rset.getString("IMG_NAME"), 
												 rset.getString("IMG_PATH")
												 );
				list.add(pAll);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
}
