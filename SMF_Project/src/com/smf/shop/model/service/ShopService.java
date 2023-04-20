package com.smf.shop.model.service;

import static com.smf.common.JDBCTemplate.*;
import java.sql.Connection;
import java.util.ArrayList;

import com.smf.common.model.vo.PageInfo;
import com.smf.my.model.vo.WishList;
import com.smf.shop.model.dao.ShopDao;
import com.smf.shop.model.vo.Category_Sub;
import com.smf.shop.model.vo.Product;
import com.smf.shop.model.vo.ProductAll;
import com.smf.shop.model.vo.Product_Detail;
import com.smf.shop.model.vo.Product_Img;
import com.smf.shop.model.vo.Stock;

public class ShopService {
	
	public int selectListCount() {
		
		Connection conn = getConnection();
		
		int result = new ShopDao().selectListCount(conn);
		
		close(conn);
		
		return result;
		
	}
	
	public ArrayList<Category_Sub> list (String cat){
		
		Connection conn = getConnection();
		
		ArrayList<Category_Sub> list = new ShopDao().list(conn, cat);
		
		close(conn);
		
		return list;
		
	}
	
	public int insertProduct(Product p) {
		
		Connection conn = getConnection();
		
		int result1 = new ShopDao().insertProduct(conn, p);
		
		if (result1 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result1;
		
	}
	
	public int insertProduct2(Stock s, Product_Detail pd) {
		
		Connection conn = getConnection();
		
		int result2 = new ShopDao().insertStock(conn, s);
		int result3 = new ShopDao().insertProduct_Detail(conn, pd);
		
		if(result2 > 0 && result3 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result2 * result3;
		
	}
	
	public int insertProductImg(Product_Img pi) {
		
		Connection conn = getConnection();
		
		int result = new ShopDao().insertProductImg(conn, pi);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public ArrayList<ProductAll> selectProductAll(PageInfo pi){
		
		Connection conn = getConnection();
		
		ArrayList<ProductAll> list = new ShopDao().selectProductAll(conn, pi);
		
		close(conn);
		
		return list;
	}
	
	public Product selectProduct(String productName) {
		
		Connection conn = getConnection();
		
		Product result = new ShopDao().selectProduct(conn, productName);
		
		close(conn);
		
		return result;
	}
	
	public Stock selectStock(String productName) {
		
		Connection conn = getConnection();
		
		Stock result = new ShopDao().selectStock(conn, productName);
		
		close(conn);
		
		return result;
	}
	
	public ArrayList<Product_Img> selectProduct_Img(String productName) {
		
		Connection conn = getConnection();
		
		ArrayList<Product_Img> list = new ShopDao().selectProduct_Img(conn, productName);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<ProductAll> selectProductBrandProduct(String brand) {
		
		Connection conn = getConnection();
		
		ArrayList<ProductAll> list = new ShopDao().selectProductBrandProduct(conn, brand);
		
		close(conn);
		
		return list;
	}
	
	public Product_Detail selectProduct_Detail(String productName) {
		
		Connection conn = getConnection();
		
		Product_Detail result = new ShopDao().selectProduct_Detail(conn, productName);
		
		close(conn);
		
		return result;
	}

	public WishList selectWishList(String productName) {
		
		Connection conn = getConnection();
		
		WishList result = new ShopDao().selectWishList(conn, productName);
		
		close(conn);
		
		return result;
	}
	
	public ArrayList<Stock> selectSize(String productName) {
		
		Connection conn = getConnection();
		
		ArrayList<Stock> list = new ShopDao().selectSize(conn, productName);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Stock> selectSizeStock(String productName, String pSize) {
		
		Connection conn = getConnection();
		
		ArrayList<Stock> list = new ShopDao().selectSizeStock(conn, productName, pSize);
		
		close(conn);
		
		return list;
		
	}
	
	public int insertWishList(String productName, String userId) {
		
		Connection conn = getConnection();
		
		int result = new ShopDao().insertWishList(conn, productName, userId);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
		
	}
	
	public int deleteWishList(String productName, String userId) {
		
		Connection conn = getConnection();
		
		int result = new ShopDao().deleteWishList(conn, productName, userId);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public ArrayList<ProductAll> selectNcategory(String category, PageInfo pi) {
		
		Connection conn = getConnection();
		
		ArrayList<ProductAll> list = new ShopDao().selectNcategory(conn, category, pi);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<ProductAll> selectNcategoryAll(String category) {
		
		Connection conn = getConnection();
		
		ArrayList<ProductAll> list = new ShopDao().selectNcategoryAll(conn, category);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<ProductAll> selectBcategory(String category) {
		
		Connection conn = getConnection();
		
		ArrayList<ProductAll> list = new ShopDao().selectBcategory(conn, category);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<ProductAll> selectGcategory(String category) {
		
		Connection conn = getConnection();
		
		ArrayList<ProductAll> list = new ShopDao().selectGcategory(conn, category);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<ProductAll> selectTcategory(PageInfo pi) {
		
		Connection conn = getConnection();
		
		ArrayList<ProductAll> list = new ShopDao().selectTcategory(conn, pi);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<ProductAll> selectPcategory1() {
		
		Connection conn = getConnection();
		
		ArrayList<ProductAll> list = new ShopDao().selectPcategory1(conn);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<ProductAll> selectPcategory2() {
		
		Connection conn = getConnection();
		
		ArrayList<ProductAll> list = new ShopDao().selectPcategory2(conn);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<ProductAll> selectPcategory3() {
		
		Connection conn = getConnection();
		
		ArrayList<ProductAll> list = new ShopDao().selectPcategory3(conn);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<ProductAll> selectPcategory4() {
		
		Connection conn = getConnection();
		
		ArrayList<ProductAll> list = new ShopDao().selectPcategory4(conn);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<ProductAll> selectPcategory5() {
		
		Connection conn = getConnection();
		
		ArrayList<ProductAll> list = new ShopDao().selectPcategory5(conn);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<ProductAll> selectPcategory6() {
		
		Connection conn = getConnection();
		
		ArrayList<ProductAll> list = new ShopDao().selectPcategory6(conn);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<ProductAll> selectSizeCategory(String category) {
		
		Connection conn = getConnection();
		
		ArrayList<ProductAll> list = new ShopDao().selectSizeCategory(conn, category);
		
		close(conn);
		
		return list;
	}
	
	public int insertStockNo(String userId, int pCount, int stockNo) {
		
		Connection conn = getConnection();
		
		int result = new ShopDao().insertStockNo(conn, userId, pCount, stockNo);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	public ArrayList<ProductAll> searchPname(String text) {
		
		Connection conn = getConnection();
		
		ArrayList<ProductAll> list = new ShopDao().searchPname(conn, text);
		
		close(conn);
		
		return list;
	}
	
	public int suggestProduct(String userId, String userClass, String bName, String pName, String price, String size, String count) {
		
		Connection conn = getConnection();
		
		int result = new ShopDao().suggestProduct(conn, userId, userClass, bName, pName, price, size, count);
		
		close(conn);
		
		return result;
	}
}
