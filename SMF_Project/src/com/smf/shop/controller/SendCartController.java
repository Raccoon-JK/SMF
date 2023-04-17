package com.smf.shop.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.smf.member.model.vo.Member;
import com.smf.shop.model.service.ShopService;
import com.smf.shop.model.vo.Stock;

/**
 * Servlet implementation class SendCartController
 */
@WebServlet("/sCart.sh")
public class SendCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendCartController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = ((Member) request.getSession().getAttribute("loginUser")).getUserId() + "";
		int pCount = Integer.parseInt(request.getParameter("pCount"));
		int stockNo = Integer.parseInt(request.getParameter("stockNo"));
		
		int result = new ShopService().insertStockNo(userId, pCount, stockNo);
		
		if(result > 0) {
			response.sendRedirect(request.getContextPath() + "/mypageshoppingcart.me");
		}
//		response.setContentType("apllication/json; charset=UTF-8");
//		
//		System.out.println(s);
//		
//		new Gson().toJson(s, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
