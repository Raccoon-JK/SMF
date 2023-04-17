package com.smf.main.model.dao;

import static com.smf.common.JDBCTemplate.*;

import com.smf.main.model.vo.MainProduct;

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

public class MainProductDao {
	private Properties prop = new Properties();

	public MainProductDao() {
		try {
			prop.loadFromXML(new FileInputStream(
					MainProductDao.class.getResource("/sql/main/product/main-product-mapper.xml").getPath()));
		} catch (InvalidPropertiesFormatException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<MainProduct> getProduct(Connection conn) {
		ArrayList<MainProduct> productList = new ArrayList<>();

		PreparedStatement pstmt = null;

		ResultSet rset = null;

		String sql = prop.getProperty("getProduct");

		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				MainProduct product = new MainProduct();
				product.setProductName(rset.getString("PRODUCT_NAME"));
				product.setCompanyPrice(rset.getInt("COMPANY_PRICE"));
				product.setImageName(rset.getString("IMG_NAME"));
				product.setImagePath(rset.getString("IMG_PATH"));
				product.setBrandName(rset.getString("BRAND_NAME"));

				productList.add(product);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return productList;
	}
	
	public ArrayList<MainProduct> getMoreProduct(Connection conn, int currentCount) {
		ArrayList<MainProduct> moreProductList = new ArrayList<>();
		PreparedStatement pstmt = null;

		ResultSet rset = null;

		String sql = prop.getProperty("getMoreProduct");

		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRange = (currentCount * 3) - 2; // 4, 7, 10, 13 ...
			int endRange = currentCount * 3; // 6, 9, 12
			
			pstmt.setInt(1, startRange);
			pstmt.setInt(2, endRange);
			
			rset = pstmt.executeQuery();

			while (rset.next()) {
				MainProduct product = new MainProduct(rset.getString("PRODUCT_NAME")
						, rset.getInt("COMPANY_PRICE")
						, rset.getString("IMG_NAME")
						, rset.getString("IMG_PATH")
						, rset.getString("BRAND_NAME"));
				moreProductList.add(product);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return moreProductList;
	}
}
