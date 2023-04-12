package com.smf.main.model.service;

import static com.smf.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.smf.main.model.dao.ProductDao;
import com.smf.main.model.vo.Product;
import com.smf.main.model.vo.ProductRange;

public class ProductService {

    public ArrayList<Product> getProduct() {
        Connection conn = getConnection();
        
		ArrayList<Product> productList = new ProductDao().getProduct(conn);
		
        close(conn);
        
        return productList;
    }
    
    public ArrayList<Product> getMoreProduct(ProductRange pr) {
        Connection conn = getConnection();
        
		ArrayList<Product> productList = new ProductDao().getMoreProduct(conn, pr);
		
        close(conn);
        
        return productList;
    }
}

