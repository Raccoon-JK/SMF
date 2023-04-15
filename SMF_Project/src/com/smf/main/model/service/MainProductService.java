package com.smf.main.model.service;

import static com.smf.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.smf.main.model.dao.MainProductDao;
import com.smf.main.model.vo.MainProduct;

public class MainProductService {

    public ArrayList<MainProduct> getProduct() {
        Connection conn = getConnection();
        
		ArrayList<MainProduct> productList = new MainProductDao().getProduct(conn);
		
        close(conn);
        
        return productList;
    }
    
    public ArrayList<MainProduct> getMoreProduct(int currentCount) {
        Connection conn = getConnection();
        
		ArrayList<MainProduct> moreProductList = new MainProductDao().getMoreProduct(conn, currentCount);
		
        close(conn);
        
        return moreProductList;
        
    }
}

