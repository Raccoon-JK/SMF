package com.smf.shop.model.service;

import static com.smf.common.JDBCTemplate.*;
import java.sql.Connection;
import java.util.ArrayList;

import com.smf.my.model.vo.WishList;
import com.smf.shop.model.dao.ShopDao;
import com.smf.shop.model.vo.Category_Sub;
import com.smf.shop.model.vo.Product;
import com.smf.shop.model.vo.ProductAll;
import com.smf.shop.model.vo.Product_Detail;
import com.smf.shop.model.vo.Product_Img;
import com.smf.shop.model.vo.Stock;

public class ShopService {
	
	public ArrayList<Category_Sub> list (String cat){
		
		Connection conn = getConnection();
		
		ArrayList<Category_Sub> list = new ShopDao().list(conn, cat);
		
		close(conn);
		
		return list;
		
	}
	
	public int insertProduct(Product p, Stock s, Product_Detail pd) {
		
		Connection conn = getConnection();
		
		int result1 = new ShopDao().insertProduct(conn, p);
		int result2 = new ShopDao().insertStock(conn, s);
		int result3 = new ShopDao().insertProduct_Detail(conn, pd);
		
		if (result1 > 0 && result2 > 0 && result3 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result1 * result2 * result3;
		
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
	
	public ArrayList<ProductAll> selectProductAll(){
		
		Connection conn = getConnection();
		
		ArrayList<ProductAll> list = new ShopDao().selectProductAll(conn);
		
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
}
