package com.smf.my.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smf.member.model.vo.Member;
import com.smf.my.model.service.MyPageService;
import com.smf.my.model.vo.Card;
import com.smf.my.model.vo.ReplaceDateFormat;

/**
 * Servlet implementation class MyPageCardUpdateController
 */
@WebServlet("/cardupdate.me")
public class MyPageCardUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageCardUpdateController() {
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
		int cardNo = Integer.parseInt(request.getParameter("cardNo"));
		int cardPwd = Integer.parseInt(request.getParameter("cardPwd"));
		Date cardDate = Date.valueOf(ReplaceDateFormat.repaceDate(request.getParameter("cardDate")));
		int cvcNo = Integer.parseInt(request.getParameter("cvcNo"));
		
		Card card = new Card(userId, cardNo, cardPwd, cardDate, cvcNo);
		
		int result = new MyPageService().cardUpdate(card);
		
		if( result>0 ) {
			response.sendRedirect(request.getContextPath()+"/mypageaccountscard.me");
		}else {
			
		}
	}

}
