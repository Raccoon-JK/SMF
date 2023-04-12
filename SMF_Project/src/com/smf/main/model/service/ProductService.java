package com.smf.main.model.service;

import java.sql.Connection;
import java.util.List;

import com.smf.main.model.dao.ProductDAO;
import com.smf.main.model.vo.Product;
import com.smf.common.JDBCTemplate;

public class ProductService {

    public static List<Product> getProduct() {
        Connection conn = JDBCTemplate.getConnection();
        new ProductDAO();
		List<Product> productList = ProductDAO.getProduct();
        JDBCTemplate.close(conn);
        return productList;
    }
}

