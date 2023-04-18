package com.smf.my.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.smf.member.model.vo.Member;
import com.smf.my.model.service.MyPageService;
import com.smf.my.model.vo.BuySellHistory;

/**
 * Servlet implementation class MyPageSellingHistoryMontAjaxController
 */
@WebServlet("/sellingHistoryMonthAjax.me")
public class MyPageSellingHistoryMontAjaxController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageSellingHistoryMontAjaxController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int month = Integer.parseInt(request.getParameter("month"));
		
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
		
		ArrayList<BuySellHistory> list = new MyPageService().selectSellMonthList(userId, month);
		
		System.out.println(list);
		
		response.setContentType("apllication/json; charset=UTF-8");
		
		new Gson().toJson(list, response.getWriter());
	}

}
