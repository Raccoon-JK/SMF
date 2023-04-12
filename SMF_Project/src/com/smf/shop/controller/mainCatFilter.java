package com.smf.shop.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smf.shop.model.service.ShopService;
import com.smf.shop.model.vo.Product;
import com.smf.shop.model.vo.ProductAll;
import com.smf.shop.model.vo.Stock;

/**
 * Servlet implementation class mainCatFilter
 */
@WebServlet("/pCatFilter.sh")
public class mainCatFilter extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public mainCatFilter() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<ProductAll> list = new ShopService().selectCatProduct();
	
		response.setContentType("application/json; charset=UTF-8");
		
		response.getWriter().print(list);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
