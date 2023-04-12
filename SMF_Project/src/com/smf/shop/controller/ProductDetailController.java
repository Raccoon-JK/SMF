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
import com.smf.shop.model.vo.Product_Detail;
import com.smf.shop.model.vo.Product_Img;
import com.smf.shop.model.vo.Stock;

/**
 * Servlet implementation class ProductDetailController
 */
@WebServlet("/productDetail.sh")
public class ProductDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String productName = request.getParameter("productName");
		
		Product p = new ShopService().selectProduct(productName);
		Stock s = new ShopService().selectStock(productName);
		Product_Detail pd = new ShopService().selectProduct_Detail(productName);
		ArrayList<Product_Img> list = new ShopService().selectProduct_Img(productName);
		
		request.setAttribute("p", p);
		request.setAttribute("s", s);
		request.setAttribute("list", list);
		request.setAttribute("pd", pd);
		System.out.println(p);
		System.out.println(list);
		System.out.println(pd);
		
		request.getRequestDispatcher("views/shop/productDetailForm.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
