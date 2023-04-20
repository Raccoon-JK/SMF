package com.smf.dressroom.model.dao;

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
import com.smf.my.model.dao.MyPageDao;
import com.smf.shop.model.vo.ProductAll;

public class DressroomDao {
	private Properties prop = new Properties();
	
	public DressroomDao() {
		String fileName = MyPageDao.class.getResource("/sql/dressroom/dressroom-mapper.xml").getPath();
		
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
	
	public ArrayList<ProductAll> categoryItemList(Connection conn, String categoryName){
		
		ArrayList<ProductAll> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("categoryItemList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, categoryName);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				ProductAll pa = new ProductAll(rset.getString("PRODUCT_NAME"),
											   rset.getInt("IMG_NO"),
											   rset.getString("IMG_NAME"),
											   rset.getString("IMG_PATH"),
											   rset.getInt("CATEGORY_NO"),
											   rset.getString("SUB_CATEGORY_NAME")
											   );
				list.add(pa);
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
