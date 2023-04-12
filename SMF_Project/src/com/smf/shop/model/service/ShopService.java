package com.smf.shop.model.service;

import static com.smf.common.JDBCTemplate.*;
import java.sql.Connection;
import java.util.ArrayList;
import com.smf.shop.model.dao.ShopDao;
import com.smf.shop.model.vo.Category_Sub;
import com.smf.shop.model.vo.Product;
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
}
