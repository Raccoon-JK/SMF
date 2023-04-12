package com.smf.style.model.dao;

import java.io.FileInputStream;
import static com.smf.common.JDBCTemplate.close;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

import com.smf.common.model.vo.PageInfo;
import com.smf.my.model.dao.MyPageDao;
import com.smf.style.model.vo.PostImg;
import com.smf.style.model.vo.StyleComment;
import com.smf.style.model.vo.StylePost;

public class StyleDao {
	
private Properties prop = new Properties();
	
	public StyleDao() {
		String fileName = MyPageDao.class.getResource("/sql/my/style-mapper.xml").getPath();
		
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
	

	
	public ArrayList<StylePost> selectList(Connection conn, PageInfo pi){
		
		ArrayList<StylePost> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			/* 
			 * boardLimit이 10이라고 가정
			 * currentPage 1을 요청시 -> 1 ~ 10
			 * currentPage 2을 요청시 -> 11 ~ 20
			 * currentPage n을 요청시 -> 시작값 : (currentPage -1) * boardLimit +1 ~ 시작값 + boardLimit -1
			 * 
			 * */
			int startRow = ( pi.getCurrentPage() - 1 ) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				StylePost sp = new StylePost(rset.getInt("POST_NO"),
						            rset.getString("USER_ID"),
						            rset.getString("CONTENT"),
						            rset.getDate("UPROADTIME"));						            
				list.add(sp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	
	
	public int insertPost(Connection conn,  StylePost sp) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertPost");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sp.getPostNo());
			pstmt.setString(2, sp.getContent());
			pstmt.setString(3, sp.getUserId());
			pstmt.setDate(4, sp.getUproadTime());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int insertImg(Connection conn, PostImg pi) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertImg");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pi.getImgNo());
			pstmt.setInt(2, pi.getPostNo());
			pstmt.setString(3, pi.getImgName());
			pstmt.setString(4, pi.getOriginName());
			pstmt.setString(5, pi.getImgPath());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) { 
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	
	
	public StylePost selectPost(Connection conn, int postNo) {
		
		StylePost sp = null;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPost");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, postNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				sp = new StylePost(rset.getInt("POST_NO") ,
						      rset.getString("USER_ID"), 
						      rset.getString("CONTENT") ,
						      rset.getDate("UPROADTIME"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return sp;
	}
	
	
	public PostImg selectImg(Connection conn, int postNo) {
		
		PostImg pi = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectImg");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, postNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				pi = new PostImg();
				
				pi.setImgNo(rset.getInt("IMG_NO"));
				pi.setImgName(rset.getString("IMG_NAME"));
				pi.setOriginName(rset.getString("ORIGIN_NAME"));
				pi.setImgPath(rset.getString("IMG_PATH"));
				
				pi.setImgLevel(rset.getInt("IMG_LEVEL"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return pi;
	}
	
	public int updatePost(Connection conn, StylePost sp) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updatePost");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sp.getContent());
			pstmt.setDate(2, sp.getUproadTime());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int updateImg(Connection conn, PostImg pi) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateImg");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pi.getOriginName());
			pstmt.setString(2, pi.getImgName());
			pstmt.setString(3, pi.getImgPath());
			pstmt.setInt(4, pi.getImgNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int insertNewImg(Connection conn , PostImg pi) {
		
		int result = 0;
		
		PreparedStatement pstmt =null;
		
		String sql = prop.getProperty("insertNewAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pi.getImgNo());
			pstmt.setInt(2, pi.getPostNo());
			pstmt.setString(3, pi.getOriginName());
			pstmt.setString(4, pi.getImgName());
			pstmt.setString(5, pi.getImgPath());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	public int deletePost(Connection conn, int postNo, String userId) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deletePost");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, postNo);
			pstmt.setString(2, userId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int deleteImg(Connection conn, int postNo) {
		
		int result =0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteImg");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, postNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int insertImgPost(Connection conn, StylePost sp) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertImgPost");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sp.getContent());
			pstmt.setString(2, sp.getUserId());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	
	public int insertImgList(Connection conn, ArrayList<PostImg> list) {
		
		int result = 1;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertImgList");
		
		String sql2 =prop.getProperty("insertImg2");
		// INSERT INTO ATTACHMENT(FILE_NO, REF_BNO, ORIGIN_NAME, CHANGE_NAME,FILE_PATH)
		// VALUES(SEQ_FNO.NEXTVAL , $ , ? , ?, ? )
		sql2.replace("$", "?");
		sql2.replace("$","SEQ_BNO.CURRVAL");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			for(PostImg pi : list) {
				
				pstmt.setString(1, pi.getOriginName());
				pstmt.setString(2, pi.getImgName());
				pstmt.setString(3, pi.getImgPath());
				pstmt.setInt(4 ,pi.getImgLevel());
				
				//실행
				result *= pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public ArrayList<StylePost> selectImgList(Connection conn){
		
		ArrayList<StylePost> list = new ArrayList();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectImgList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				StylePost sp = new StylePost();
				sp.setPostNo(rset.getInt("POST_NO"));
				sp.setContent(rset.getString("CONTENT"));
				sp.setUserId(rset.getString("USER_ID"));
				sp.setTitleImg(rset.getString("TITLEIMG"));
				
				
				PostImg pi = new PostImg();
				pi.setImgPath(rset.getString("IMG_PATH"));
				pi.setImgName(rset.getString("IMG_NAME"));
				pi.setImgLevel(rset.getInt("IMG_LEVEL"));
				
				
				sp.setPi(pi);
				
				list.add(sp);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
	public ArrayList<PostImg> selectImgList(Connection conn, int postNo){
		
		ArrayList<PostImg> list = new ArrayList();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectImg");
		 
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, postNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				PostImg pi = new PostImg();
				
				pi.setImgName(rset.getString("IMG_NAME"));
				pi.setOriginName(rset.getString("ORIGIN_NAME"));
				pi.setImgPath(rset.getString("IMG_PATH"));
				pi.setImgLevel(rset.getInt("IMG_LEVEL"));
				
				list.add(pi);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	
	public int insertComment(Connection conn, StyleComment sc) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertComment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sc.getcContent());
			pstmt.setString(2, sc.getUserId());
			pstmt.setDate(3, sc.getcUproadTime());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public ArrayList<StyleComment> selectCommentList(Connection conn, int postNo){
		ArrayList<StyleComment> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCommentList");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, postNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new StyleComment(
						rset.getInt("C_NO"),
						rset.getString("C_CONTENT"),
						rset.getString("USER_ID"),
						rset.getDate("UPROADTIME")
						));				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	

}
