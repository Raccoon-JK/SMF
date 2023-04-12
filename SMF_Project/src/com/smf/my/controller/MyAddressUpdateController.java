package com.smf.my.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smf.member.model.vo.Member;
import com.smf.my.model.service.MyPageService;
import com.smf.my.model.vo.Address;

/**
 * Servlet implementation class MyAddressUpdateController
 */
@WebServlet("/addrupdate.me")
public class MyAddressUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyAddressUpdateController() {
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
		
//		request.setCharacterEncoding("UTF-8");
		
		int addrNo = Integer.parseInt(request.getParameter("addrNo"));
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
		String receiver = request.getParameter("name");
		String phone = request.getParameter("phone");
		int postcode = Integer.parseInt(request.getParameter("postcode"));
		String address = request.getParameter("address") +" "+request.getParameter("detailedAddress");
		
		Address addr = new Address(addrNo, userId, receiver, phone, postcode, address);
		
		int result = new MyPageService().addressUpdate(addr);
		
		if( result>0 ) {
			response.sendRedirect(request.getContextPath()+"/address.me");
		}else {
			
		}
	}

}
