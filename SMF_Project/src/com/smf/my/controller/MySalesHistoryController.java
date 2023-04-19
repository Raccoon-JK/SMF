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
 * Servlet implementation class MySalesHistoryController
 */
@WebServlet("/mypagsalehistory.me")
public class MySalesHistoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MySalesHistoryController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getSession().getAttribute("loginUser") != null) {
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
		
		ArrayList<BuySellHistory> sellList = new MyPageService().selectsellList(userId);
			
		request.setAttribute("sellList", sellList);
		
		request.getRequestDispatcher("/views/my/mypageSalesHistory.jsp").forward(request, response);
		}else {
			request.getSession().setAttribute("alertMsg", "로그인이 필요합니다.");
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
