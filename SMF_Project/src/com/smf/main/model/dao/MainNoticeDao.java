package com.smf.main.model.dao;

import static com.smf.common.JDBCTemplate.*;

import com.smf.main.model.vo.MainNotice;

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

public class MainNoticeDao {
	private Properties prop = new Properties();

	public MainNoticeDao() {
		try {
			prop.loadFromXML(new FileInputStream(
					MainNoticeDao.class.getResource("/sql/main/notice/main-notice-mapper.xml").getPath()));
		} catch (InvalidPropertiesFormatException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<MainNotice> getNotice(Connection conn) {
		ArrayList<MainNotice> noticeList = new ArrayList<>();

		PreparedStatement pstmt = null;

		ResultSet rset = null;

		String sql = prop.getProperty("getNotice");

		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				MainNotice notice = new MainNotice();
				notice.setAlertTitle(rset.getString("ALERT_TITLE"));

				noticeList.add(notice);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return noticeList;
	}
	
}
