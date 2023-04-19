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

import com.smf.common.model.vo.PageInfo;
import com.smf.my.model.vo.WishList;
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

	public int selectListCount(Connection conn) {
		
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCount");
		/*
		 * SELECT COUNT (*) AS COUNT
		 * FROM BOARD
		 * WHERE STATUS = 'Y'
		 * 	 AND BOARD_TYPE = 1
		 * 
		 */
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("COUNT");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
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
			pstmt.setInt(3, p.getCompanyPrice());
			pstmt.setInt(4, p.getCategoryNo());
			pstmt.setString(5, p.getProductGender());
			pstmt.setString(6, p.getProductWeather());
			
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
		
		String sql = prop.getProperty("insertStock");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			System.out.println(s);
			
			pstmt.setString(1, s.getUserId());
			pstmt.setString(2, s.getProductName());
			pstmt.setInt(3, s.getPrice());
			pstmt.setInt(4, s.getStock());
			pstmt.setString(5, s.getSize());
			pstmt.setInt(6, 1);
			
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
			System.out.println(pd);
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
	
	public ArrayList<ProductAll> selectProductAll(Connection conn, PageInfo pi){
		 
		ArrayList<ProductAll> list = new ArrayList<ProductAll>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectProductAll");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			System.out.println(startRow);
			System.out.println(endRow);
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
		System.out.println(productName);
		
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
	
	public ArrayList<ProductAll> selectProductBrandProduct(Connection conn, String brand){
		
		ArrayList<ProductAll> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectProductBrandProduct");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, brand);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				ProductAll pa = new ProductAll(
						rset.getString("PRODUCT_NAME"),
						rset.getString("BRAND_NAME"),
						rset.getInt("COMPANY_PRICE"),
						rset.getString("IMG_NAME"),
						rset.getString("IMG_PATH")
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
	
	public WishList selectWishList(Connection conn, String productName) {
		
		WishList wl = null;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectWishList");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, productName);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {

				wl = new WishList();
				
				wl.setProductName(rset.getString("PRODUCT_NAME"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return wl;
	}

	public ArrayList<Stock> selectSize(Connection conn, String productName) {
		
		ArrayList<Stock> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectSize");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, productName);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Stock s = new Stock();
				
				s.setSize(rset.getString("P_SIZE"));
				
				list.add(s);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public ArrayList<Stock> selectSizeStock(Connection conn, String productName, String pSize) {
		
		ArrayList<Stock> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectSizeStock");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, productName);
			pstmt.setString(2, pSize);
			pstmt.setString(3, productName);
			pstmt.setString(4, pSize);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Stock s = new Stock();
				
				s.setStockNo(rset.getInt("STOCK_NO"));
				s.setStock(rset.getInt("STOCK"));
				s.setPrice(rset.getInt("PRICE"));
				s.setUserClass(rset.getString("USER_CLASS"));
				
				list.add(s);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public int insertWishList(Connection conn, String productName, String userId) {
	
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertWishList");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			pstmt.setString(2, productName);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int deleteWishList(Connection conn, String productName, String userId) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteWishList");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			pstmt.setString(2, productName);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public ArrayList<ProductAll> selectNcategory(Connection conn, String category, PageInfo pi){
			
		ArrayList<ProductAll> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectNcategory");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			pstmt.setString(1, category);			
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
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
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
	}
	
	public ArrayList<ProductAll> selectNcategoryAll(Connection conn, String category){
		
		ArrayList<ProductAll> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectNcategoryAll");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, category);			
			
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
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
	}
	
	public ArrayList<ProductAll> selectBcategory(Connection conn, String category){
		
		ArrayList<ProductAll> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectBcategory");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, category);
			
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
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
	}
	
	public ArrayList<ProductAll> selectGcategory(Connection conn, String category){
		
		ArrayList<ProductAll> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectGcategory");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, category);
			
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
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
	}
	
	public ArrayList<ProductAll> selectTcategory(Connection conn, PageInfo pi){
		
		ArrayList<ProductAll> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectProductAll");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
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
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
	}
	
	public ArrayList<ProductAll> selectPcategory1(Connection conn){
		
		ArrayList<ProductAll> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPcategory1");
		
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
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
	}
	
	public ArrayList<ProductAll> selectPcategory2(Connection conn){
		
		ArrayList<ProductAll> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPcategory2");
		
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
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
	}
	
	public ArrayList<ProductAll> selectPcategory3(Connection conn){
		
		ArrayList<ProductAll> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPcategory3");
		
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
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
	}
	
	public ArrayList<ProductAll> selectPcategory4(Connection conn){
		
		ArrayList<ProductAll> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPcategory4");
		
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
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
	}
	
	public ArrayList<ProductAll> selectPcategory5(Connection conn){
		
		ArrayList<ProductAll> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPcategory5");
		
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
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
	}
	
	public ArrayList<ProductAll> selectPcategory6(Connection conn){
		
		ArrayList<ProductAll> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPcategory6");
		
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
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
	}
	
	public ArrayList<ProductAll> selectSizeCategory(Connection conn, String category){
		
		ArrayList<ProductAll> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectSizeCategory");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, category);
			
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
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
	}
	
	public int insertStockNo(Connection conn, String userId, int pCount, int stockNo) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertStockNo");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			pstmt.setInt(2, stockNo);
			pstmt.setInt(3, pCount);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
}
