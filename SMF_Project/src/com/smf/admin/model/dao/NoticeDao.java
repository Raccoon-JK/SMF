package com.smf.admin.model.dao;

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
import com.smf.admin.model.vo.Notice;

public class NoticeDao {

	
	private Properties prop = new Properties();
	
	public NoticeDao() {
		
		String fileName = NoticeDao.class.getResource("/sql/admin/notice-mapper.xml").getPath();
		
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
	
	public ArrayList<Notice> selectNoticeList(Connection conn){
		
		//SElECT문 = > ResultSet(여러 행)
		ArrayList<Notice> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectNoticeList");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			//rset.next()함수를 통해 다음행이 있는지 없는지 검사
			int count=0;
			while(rset.next()) {
				Notice n = new Notice(
						   rset.getInt("ALERT_NO"),
						   rset.getString("ALERT_CATEGORY"),
						   rset.getString("ALERT_TITLE"),
						   rset.getDate("CREATE_DATE"),
						   rset.getString("QLEVEL")
								);
						count++;   
				list.add(n);		 
				
				
				
			}
			System.out.println(count);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public Notice selectNotice(Connection conn, int nno) {
		
		Notice n = null;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, nno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				n = new Notice(
						rset.getInt("ALERT_NO"),
						rset.getString("ALERT_CATEGORY"),
						rset.getString("ALERT_TITLE"),
						rset.getString("ALERT_CONTENT"),
						rset.getDate("CREATE_DATE")
						);
				
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return n;
	}


	public int insertNotice(Connection conn, Notice n) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, n.getAlertCategory());
			pstmt.setString(2, n.getAlertTitle());
			pstmt.setString(3, n.getAlertContent());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}



	public int updateNotice(Connection conn, Notice n) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, n.getAlertCategory());
			pstmt.setString(2, n.getAlertTitle());
			pstmt.setString(3, n.getAlertContent());
			pstmt.setInt(4, n.getAlertNo());
			
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteNotice(Connection conn, int nno) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteNotice");
		
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, nno);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}


	
public ArrayList<Notice> selectFaqNoticeList(Connection conn){
		
		//SElECT문 = > ResultSet(여러 행)
		ArrayList<Notice> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectFaqNoticeList");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			//rset.next()함수를 통해 다음행이 있는지 없는지 검사
			int count=0;
			while(rset.next()) {
				Notice n = new Notice(
						   rset.getInt("ALERT_NO"),
						   rset.getString("ALERT_CATEGORY"),
						   rset.getString("ALERT_TITLE"),
						   rset.getString("ALERT_CONTENT"),
						   rset.getString("QLEVEL")
								);
						count++;   
				list.add(n);		 
				
				
				
			}
			System.out.println(count);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}





public int insertFaq(Connection conn, Notice n) {
	
	int result = 0;
	
	PreparedStatement pstmt = null;
	String sql = prop.getProperty("insertFaq");
	
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, n.getAlertCategory());
		pstmt.setString(2, n.getAlertTitle());
		pstmt.setString(3, n.getAlertContent());
		
		result = pstmt.executeUpdate();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally {
		close(pstmt);
	}
	return result;
}

public Notice selectfaqNotice(Connection conn, int nno) {
	
	Notice n = null;
	
	PreparedStatement pstmt = null;
	
	ResultSet rset = null;
	
	String sql = prop.getProperty("selectfaqNotice");
	
	try {
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, nno);
		
		rset = pstmt.executeQuery();
		
		if(rset.next()) {
			n = new Notice(
					rset.getInt("ALERT_NO"),
					rset.getString("ALERT_CATEGORY"),
					rset.getString("ALERT_TITLE"),
					rset.getString("ALERT_CONTENT"),
					rset.getDate("CREATE_DATE")
					);
			
		}
		
	} catch (SQLException e) {
		
		e.printStackTrace();
	}finally {
		close(rset);
		close(pstmt);
	}
	
	return n;
}


public int updatefaqNotice(Connection conn, Notice n) {
	
	int result = 0;
	
	PreparedStatement pstmt = null;
	
	String sql = prop.getProperty("updatefaqNotice");
	
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, n.getAlertCategory());
		pstmt.setString(2, n.getAlertTitle());
		pstmt.setString(3, n.getAlertContent());
		pstmt.setInt(4, n.getAlertNo());
		
		
		result = pstmt.executeUpdate();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally {
		close(pstmt);
	}
	return result;
}


public int deletefaqNotice(Connection conn, int nno) {
	
	int result = 0;
	
	PreparedStatement pstmt = null;
	
	String sql = prop.getProperty("deletefaqNotice");
	
	
	try {
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, nno);
		
		result = pstmt.executeUpdate();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally {
		close(pstmt);
	}
	return result;
}


}
