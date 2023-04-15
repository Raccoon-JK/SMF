package com.smf.main.model.dao;

import static com.smf.common.JDBCTemplate.*;

import com.smf.main.model.vo.MainStyle;

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

public class MainStyleDao {
	private Properties prop = new Properties();

	public MainStyleDao() {
		try {
			prop.loadFromXML(new FileInputStream(
					MainStyleDao.class.getResource("/sql/main/style/main-style-mapper.xml").getPath()));
		} catch (InvalidPropertiesFormatException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<MainStyle> getStyle(Connection conn) {
		ArrayList<MainStyle> styleList = new ArrayList<>();

		PreparedStatement pstmt = null;

		ResultSet rset = null;

		String sql = prop.getProperty("getStyle");

		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				MainStyle style = new MainStyle();
				style.setSnsId(rset.getString("SNS_ID"));
				style.setUserImage(rset.getString("USER_IMAGE"));
				style.setImgPath(rset.getString("IMG_PATH"));
				style.setImgName(rset.getString("IMG_NAME"));
				

				styleList.add(style);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return styleList;
	}
}
