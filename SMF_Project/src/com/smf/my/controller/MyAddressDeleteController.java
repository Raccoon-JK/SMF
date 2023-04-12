package com.smf.my.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smf.member.model.vo.Member;
import com.smf.my.model.service.MyPageService;

/**
 * Servlet implementation class MyAddressDeleteController
 */
@WebServlet("/addrdel.me")
public class MyAddressDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyAddressDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int addrNo = Integer.parseInt(request.getParameter("addrNo"));
		
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
		
		int result = new MyPageService().addressDelete(addrNo, userId);
		
		if( result>0 ) {
			response.sendRedirect(request.getContextPath()+"/address.me");
		}else {
			System.out.println("에러");
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
