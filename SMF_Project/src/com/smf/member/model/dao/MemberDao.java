package com.smf.member.model.dao;

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

import com.smf.common.JDBCTemplate;
import com.smf.member.model.vo.Member;

public class MemberDao {

		private Properties prop = new Properties();
		
		public MemberDao() {
			
			String fileName = MemberDao.class.getResource("/sql/member/member-mapper.xml").getPath();
			
			try {
				prop.loadFromXML(new FileInputStream(fileName));
			} catch (InvalidPropertiesFormatException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	
	
	public Member loginMember(Connection conn, String userId, String userPwd) {
		
		// select -> resultset 
		Member m = null;
		
		ResultSet rset = null;
		
		PreparedStatement pstmt = null;
		
		
		String sql = prop.getProperty("loginMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			rset = pstmt.executeQuery();
			
			
			
			if(rset.next()) {
				m = new Member(rset.getString("USER_ID"),
							   rset.getString("USER_NAME"),
							   rset.getString("USER_PWD"),
							   rset.getString("PHONE"),
							   rset.getDate("BIRTH"),
							   rset.getString("AGREE_EMAIL"),
							   rset.getString("STATUS"));
				
				
				
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				rset.close();
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return m;
	}
	
	
	public int insertMember(Connection conn, Member m) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserName());
			pstmt.setString(3, m.getUserPwd());
			pstmt.setString(4, m.getPhone());
			pstmt.setDate(5, m.getBirth());
			pstmt.setString(6, m.getAgreeEmail());
			pstmt.setString(7,  m.getSnsId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
	
	
		public ArrayList<String> searchEmail(Connection conn, String uphone) {
		
		String email = "";
		ArrayList<String> list = new ArrayList();
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("searchEmail");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uphone);
			ResultSet result = pstmt.executeQuery();
			
			while(result.next()) {
				email = result.getString("USER_ID");
				
				list.add(email);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return list;
	}
		
		public String searchPwd(Connection conn, String uphone, String userId) {
		
		String pwd = "";
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("searchPwd");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uphone);
			pstmt.setString(2, userId);
			
			ResultSet result = pstmt.executeQuery();
			
			if(result.next()) {
				pwd = result.getString("USER_PWD");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return pwd;
		
	}
	
	public ArrayList<Member> selectMemberList(Connection conn){
		
		ArrayList<Member> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMemberList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Member m = new Member(
						rset.getString("USER_ID"),
						rset.getString("USER_NAME"),
						rset.getString("PHONE"),
						rset.getDate("ENROLL_DATE"),
						rset.getString("ADDRESS"),
						rset.getString("AGREE_EMAIL")
						);
				
				list.add(m);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

	
	
