package com.smf.my.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smf.member.model.vo.Member;
import com.smf.my.model.service.MyPageService;
import com.smf.my.model.vo.Account;
import com.smf.my.model.vo.Card;

/**
 * Servlet implementation class MyPageAccountsCard
 */
@WebServlet("/mypageaccountscard.me")
public class MyPageAccountsCardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageAccountsCardController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getSession().getAttribute("loginUser") != null) {
			String userId = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
			Account account = new MyPageService().accountSelect(userId);
			Card card = new MyPageService().cardSelect(userId);
			
			request.setAttribute("account", account);
			request.setAttribute("card", card);
			
			request.getRequestDispatcher("views/my/mypageAccountsCard.jsp").forward(request, response);
		}else {
			request.getSession().setAttribute("alertMsg","로그인이 필요합니다.");
			
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
