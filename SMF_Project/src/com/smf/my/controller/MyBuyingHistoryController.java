package com.smf.my.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smf.member.model.vo.Member;
import com.smf.my.model.service.MyPageService;
import com.smf.my.model.vo.BuySellHistory;

/**
 * Servlet implementation class MyBuyingHistory
 */
@WebServlet("/mypagbuyhistory.me")
public class MyBuyingHistoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyBuyingHistoryController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		if(request.getSession().getAttribute("loginUser") != null) {
			String userId = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
			
			ArrayList<ArrayList<BuySellHistory>> list = new MyPageService().selectBuyListCount(userId);
			ArrayList<BuySellHistory> orderList = new MyPageService().selectOrderListCount(userId);
			request.setAttribute("orderList", orderList);
			request.setAttribute("list", list);
			
			request.getRequestDispatcher("/views/my/mypageBuyingHistory.jsp").forward(request, response);
		}else {
			request.getSession().setAttribute("alertMsg", "로그인 후 이용가능합니다.");
			response.sendRedirect(request.getContextPath()+"/login.page");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
