package com.smf.main.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smf.main.model.dao.ProductDAO;
import com.smf.main.model.vo.Product;

@WebServlet("/product.pr")
public class ProductController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 데이터베이스에서 상품 정보를 조회하는 DAO 호출
        List<Product> productList = ProductDAO.getProduct();

        // 조회한 상품 정보를 JSON 형식으로 변환
        String json = "[";
        for (int i = 0; i < productList.size(); i++) {
            Product product = productList.get(i);
            json += "{";
            json += "\"title\":\"" + product.getProductName() + "\",";
            json += "\"brand\":\"" + product.getBrandName() + "\",";
            json += "\"price\":\"" + product.getCompanyPrice() + "\",";
            json += "\"image\":\"" + product.getImagePath() + "\"";
            json += "}";
            if (i < productList.size() - 1) {
                json += ",";
            }
        }
        json += "]";

        // JSON 형식으로 변환된 데이터를 HTTP 응답에 담아서 전송
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.print(json);
        out.flush();
    }
}

