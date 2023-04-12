package com.smf.main.model.dao;

import static com.smf.common.JDBCTemplate.*;
import com.smf.main.model.vo.Product;
import com.smf.main.model.vo.ProductRange;

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

public class ProductDao {
	private Properties prop = new Properties();

	public ProductDao() {
		try {
			prop.loadFromXML(new FileInputStream(
					ProductDao.class.getResource("/sql/main/product/product-mapper.xml").getPath()));
		} catch (InvalidPropertiesFormatException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Product> getProduct(Connection conn) {
		ArrayList<Product> productList = new ArrayList<>();

		PreparedStatement pstmt = null;

		ResultSet rset = null;

		String sql = prop.getProperty("getProduct");

		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				Product product = new Product();
				product.setProductName(rset.getString("PRODUCT_NAME"));
				product.setCompanyPrice(rset.getInt("COMPANY_PRICE"));
				product.setTradeCount(rset.getInt("TRADE_COUNT"));
				product.setStatus(rset.getString("STATUS"));
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
	
	public ArrayList<Product> getMoreProduct(Connection conn, ProductRange pr) {
		ArrayList<Product> productList = new ArrayList<>();

		PreparedStatement pstmt = null;

		ResultSet rset = null;

		String sql = prop.getProperty("getMoreProduct");

		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
		
			int startRange = 1 + 3 * (pr.getCurrentRange() - 1);
			int endRange = 4 + pr.getProductLimit() * (startRange - 1);

			pstmt.setInt(1, startRange);
			pstmt.setInt(2, endRange);

			while (rset.next()) {
				Product product = new Product();
				product.setProductName(rset.getString("PRODUCT_NAME"));
				product.setCompanyPrice(rset.getInt("COMPANY_PRICE"));
				product.setTradeCount(rset.getInt("TRADE_COUNT"));
				product.setStatus(rset.getString("STATUS"));
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
}
