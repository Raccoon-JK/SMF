package com.smf.my.controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smf.member.model.vo.Member;
import com.smf.my.model.service.MyPageService;
import com.smf.my.model.vo.Address;

/**
 * Servlet implementation class MyAddressInsertController
 */
@WebServlet("/addrinsert.me")
public class MyAddressInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyAddressInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
//		Enumeration e = request.getParameterNames();
//		while (e.hasMoreElements()) {
//			String name = (String) e.nextElement();
//			String[] values = request.getParameterValues(name);
//			for (String value : values) {
//				System.out.println("name=" + name + ",value=" + value);
//			}
//		}
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
		String receiver = request.getParameter("name");
		String phone = request.getParameter("phone");
		int postcode = Integer.parseInt(request.getParameter("postcode"));
		String address = request.getParameter("address") +" "+request.getParameter("detailedAddress");
		
		Address addr = new Address(userId,receiver,phone,postcode,address);
		
		int result = new MyPageService().insertAddress(addr);
		
		if( result>0 ) {
			response.sendRedirect(request.getContextPath()+"/address.me");
		}

	}

}
