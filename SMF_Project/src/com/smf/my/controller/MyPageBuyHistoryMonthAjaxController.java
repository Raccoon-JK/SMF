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
 * Servlet implementation class MyPageBuyHistoryMonthAjaxController
 */
@WebServlet("/buyingHistoryMonthAjax.me")
public class MyPageBuyHistoryMonthAjaxController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageBuyHistoryMonthAjaxController() {
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
		
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
		
		int month = Integer.parseInt(request.getParameter("month"));
		
//		ArrayList<BuySellHistory> orderList = new MyPageService().selectOrderListMountCount(userId, month);
		ArrayList<ArrayList<BuySellHistory>> list = new MyPageService().selectBuyListMountCount(userId, month);
		
		response.setContentType("apllication/json; charset=UTF-8");
		
        new Gson().toJson(list, response.getWriter());
	}

}
