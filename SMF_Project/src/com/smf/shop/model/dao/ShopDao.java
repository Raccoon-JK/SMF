package com.smf.shop.model.dao;

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
import com.smf.shop.model.vo.Category_Sub;
import com.smf.shop.model.vo.Product;
import com.smf.shop.model.vo.ProductAll;
import com.smf.shop.model.vo.Product_Detail;
import com.smf.shop.model.vo.Product_Img;
import com.smf.shop.model.vo.Stock;

public class ShopDao {
	private Properties prop = new Properties();

	public ShopDao() {

		String fileName = ShopDao.class.getResource("/sql/shop/shop-mapper.xml").getPath();

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

	public ArrayList<Category_Sub> list(Connection conn, String cat) {

		ArrayList<Category_Sub> list = new ArrayList();

		ResultSet rset = null;

		PreparedStatement pstmt = null;

		String sql = prop.getProperty("selectSubCategory");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, cat);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				Category_Sub c = new Category_Sub();
				c.setSubCategoryNo(rset.getInt("SUB_CATEGORY_NO"));
				c.setpCategoryNo(rset.getInt("P_CATEGORY_NO"));
				c.setSubCategoryName(rset.getString("SUB_CATEGORY_NAME"));
				
				list.add(c);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public int insertProduct(Connection conn, Product p) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertProduct");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, p.getBrandName());
			pstmt.setString(2, p.getProductName());
			pstmt.setInt(3, p.getCategoryNo());
			pstmt.setString(4, p.getProductGender());
			pstmt.setString(5, p.getProductWeather());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int insertStock(Connection conn, Stock s) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertResellStock");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, s.getUserId());
			pstmt.setString(2, s.getProductName());
			pstmt.setInt(3, s.getPrice());
			pstmt.setInt(4, s.getStock());
			pstmt.setString(5, s.getSize());
			pstmt.setString(6, s.getUserClass());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int insertProduct_Detail(Connection conn, Product_Detail pd) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertProduct_Detail");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, pd.getProductName());
			pstmt.setString(2, pd.getProductContent());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int insertProductImg(Connection conn, Product_Img pi) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertProductImg");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, pi.getProductName());
			pstmt.setString(2, pi.getImgName());
			pstmt.setString(3, pi.getImgPath());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public ArrayList<ProductAll> selectProductAll(Connection conn){
		 
		ArrayList<ProductAll> list = new ArrayList<ProductAll>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectProductAll");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				ProductAll pa = new ProductAll(
						rset.getString("PRODUCT_NAME"),
						rset.getString("BRAND_NAME"),
						rset.getInt("COMPANY_PRICE"),
						rset.getString("IMG_NAME"),
						rset.getString("IMG_PATH"),
						rset.getInt("WISHLIST_COUNT"),
						rset.getInt("PPT_COUNT")
						);
				list.add(pa);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public Product selectProduct(Connection conn, String productName) {
		
		Product p = null;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectProduct");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, productName);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				p = new Product(
						rset.getString("PRODUCT_NAME"),
						rset.getString("BRAND_NAME"),
						rset.getInt("COMPANY_PRICE")
						);
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return p;
	}
	
	public Stock selectStock(Connection conn, String productName) {
		
		Stock s = null;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectStock");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, productName);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {

				s = new Stock();
				
				s.setStock(rset.getInt("STOCK"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return s;
	}
	
	public ArrayList<Product_Img> selectProduct_Img(Connection conn, String productName) {
		
		ArrayList<Product_Img> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectProduct_Img");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, productName);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Product_Img pi = new Product_Img(
						rset.getString("PRODUCT_NAME"),
						rset.getString("IMG_NAME"),
						rset.getString("IMG_PATH")
						);
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
	
	public Product_Detail selectProduct_Detail(Connection conn, String productName) {
		
		Product_Detail pd = null;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectProduct_Detail");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, productName);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				pd = new Product_Detail();
				
				pd.setProductContent(rset.getString("PRODUCT_CONTENT"));
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return pd;
	}

}
