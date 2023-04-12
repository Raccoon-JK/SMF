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

/**
 * Servlet implementation class MyPageAccountUpdate
 */
@WebServlet("/accountupdate.me")
public class MyPageAccountUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageAccountUpdateController() {
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
		request.setCharacterEncoding("UTF-8");
		
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
		
		String bankName = request.getParameter("bankName");
		int accountNo = Integer.parseInt(request.getParameter("accountNo"));
		String accountHolder = request.getParameter("accountHolder");
		
		Account account = new Account(userId, bankName, accountNo, accountHolder);
		
		int result = new MyPageService().accountUpdate(account);
		
		if( result>0 ) {
			response.sendRedirect(request.getContextPath()+"/mypageaccountscard.me");
		}else {
			
		}
		
	}

}
