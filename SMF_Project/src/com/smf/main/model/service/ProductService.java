package com.smf.main.model.service;

import static com.smf.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.smf.main.model.dao.ProductDao;
import com.smf.main.model.vo.Product;

public class ProductService {

    public ArrayList<Product> getProduct() {
        Connection conn = getConnection();
        
		ArrayList<Product> productList = new ProductDao().getProduct(conn);
		
        close(conn);
        
        return productList;
    }
    
    public ArrayList<Product> getMoreProduct(int currentCount) {
        Connection conn = getConnection();
        
		ArrayList<Product> moreProductList = new ProductDao().getMoreProduct(conn, currentCount);
		
        close(conn);
        
        return moreProductList;
        
    }
}

