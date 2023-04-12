package com.smf.main.model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.smf.common.JDBCTemplate;
import com.smf.main.model.vo.Product;

public class ProductDAO {
    // 모든 상품 정보를 가져오는 메소드
    public static List<Product> getProduct() {
        List<Product> productList = new ArrayList<>();
        String sql = "SELECT * FROM PRODUCT";
        try (Connection conn = JDBCTemplate.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                Product product = new Product();
                product.setProductName(rs.getString("PRODUCT_NAME"));
                product.setCompanyPrice(rs.getInt("COMPANY_PRICE"));
                product.setTradeCount(rs.getInt("TRADE_COUNT"));
                product.setStatus(rs.getString("STATUS"));
                product.setImagePath(rs.getString("IMG_PATH"));
                product.setBrandName(rs.getString("BRAND_NAME"));
                productList.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productList;
    }
}






