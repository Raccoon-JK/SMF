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
import com.smf.member.model.vo.Member;
import com.smf.my.model.dao.MyPageDao;
import com.smf.style.model.vo.Follow;
import com.smf.style.model.vo.PostImg;
import com.smf.style.model.vo.PostLike;
import com.smf.style.model.vo.StyleComment;
import com.smf.style.model.vo.StylePost;

public class StyleDao {
	
private Properties prop = new Properties();
	
	public StyleDao() {
		String fileName = MyPageDao.class.getResource("/sql/style/style-mapper.xml").getPath();
		
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
	
	//
	public int insertThumbnailPost(Connection conn, StylePost sp) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertThumbnailPost");
		
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
	
	//
	public int insertPostImgList(Connection conn, ArrayList<PostImg> list) {
		
		int result = 1;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertPostImgList");
		
		/*
		 * String sql2 =prop.getProperty("insertPostImg2"); // INSERT INTO
		 * ATTACHMENT(FILE_NO, REF_BNO, ORIGIN_NAME, CHANGE_NAME,FILE_PATH) //
		 * VALUES(SEQ_FNO.NEXTVAL , $ , ? , ?, ? ) sql2.replace("$", "?");
		 * sql2.replace("$","SEQ_BNO.CURRVAL");
		 */
		
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
	
//
	
	public ArrayList<StylePost> selectPostList(Connection conn){
		
		ArrayList<StylePost> list = new ArrayList();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPostList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				StylePost sp = new StylePost();
				sp.setPostNo(rset.getInt("POST_NO"));
				sp.setContent(rset.getString("CONTENT"));
				sp.setTitleImg(rset.getString("TITLEIMG"));
				sp.setUserId(rset.getString("USER_ID"));
				sp.setUproadTime(rset.getDate("UPROADTIME"));
				sp.setUserImage(rset.getString("USER_IMAGE"));
				
				
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
	
public ArrayList<StylePost> selectUserPost(Connection conn){
		
		ArrayList<StylePost> list = new ArrayList();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectUserPost");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				StylePost sp = new StylePost();
				sp.setContent(rset.getString("CONTENT"));
				sp.setTitleImg(rset.getString("TITLEIMG"));
				sp.setUserId(rset.getString("USER_ID"));
				sp.setUproadTime(rset.getDate("UPROADTIME"));
				sp.setUserImage(rset.getString("USER_IMAGE"));
				
				
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
						      rset.getString("CONTENT"), 
						      rset.getString("USER_ID") ,
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
	
public ArrayList<StylePost> selectPostImgList(Connection conn){
		
		ArrayList<StylePost> list = new ArrayList();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPostImgList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				StylePost sp = new StylePost();
				sp.setPostNo(rset.getInt("POST_NO"));
				sp.setContent(rset.getString("CONTENT"));
				sp.setTitleImg(rset.getString("TITLEIMG"));
				sp.setUserId(rset.getString("USER_ID"));
				sp.setUproadTime(rset.getDate("UPROADTIME"));
				sp.setUserImage(rset.getString("USER_IMAGE"));
				
				

				
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

	public ArrayList<PostImg> selectPostImgList2(Connection conn, int postNo){
		
		ArrayList<PostImg> list = new ArrayList();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPostImgList2");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, postNo);
			
			
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				PostImg pi = new PostImg();
				pi.setImgPath(rset.getString("IMG_PATH"));
				pi.setImgName(rset.getString("IMG_NAME"));
				pi.setImgLevel(rset.getInt("IMG_LEVEL"));
				
				list.add(pi);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public ArrayList<StylePost> selectHtList(Connection conn){
	
	ArrayList<StylePost> list = new ArrayList();
	
	PreparedStatement pstmt = null;
	
	ResultSet rset = null;
	
	String sql = prop.getProperty("selectHtList");
	
	try {
		pstmt = conn.prepareStatement(sql);
		
		rset = pstmt.executeQuery();
		
		while(rset.next()) {
			StylePost sp = new StylePost();
			sp.setContent(rset.getString("CONTENT"));
			sp.setTitleImg(rset.getString("TITLEIMG"));
			sp.setUserId(rset.getString("USER_ID"));
			sp.setUproadTime(rset.getDate("UPROADTIME"));
			sp.setUserImage(rset.getString("USER_IMAGE"));
			
			
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
	
	public int insertFollow(Connection conn, Follow f) {
		int result = 1;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertFollow");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, f.getFollower());
			pstmt.setString(2, f.getUserId());
			
			result = pstmt.executeUpdate();
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	public int insertPostLike(Connection conn, PostLike pl) {
		int result = 1;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertPostLike");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pl.getPostNo());
			pstmt.setString(2, pl.getUserId());
			
			result = pstmt.executeUpdate();
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
public int insertComment(Connection conn, StyleComment sc) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertComment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sc.getcContent());
			pstmt.setInt(2, sc.getPostNo());
			pstmt.setString(3, sc.getUserId());
			
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
						rset.getDate("C_UPROADTIME")
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

	public PostImg selectPostImg(Connection conn, int postNo) {
		
		PostImg pi = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectPostImg");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, postNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				pi = new PostImg();
				
				pi.setImgNo(rset.getInt("IMG_NO"));
				pi.setOriginName(rset.getString("ORIGIN_NAME"));
				pi.setImgName(rset.getString("IMG_NAME"));
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

	
	
}
