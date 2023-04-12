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
import com.smf.my.model.vo.Address;

/**
 * Servlet implementation class MyAddressListController
 */
@WebServlet("/address.me")
public class MyAddressListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyAddressListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getSession().getAttribute("loginUser") != null) {
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getUserId();

		Address addrDefault = new MyPageService().addressDefault(userId);
		ArrayList<Address> addrList = new MyPageService().addressList(userId);
		
		request.setAttribute("addrDefault", addrDefault);
		request.setAttribute("addrList", addrList);
		
		
		request.getRequestDispatcher("/views/my/mypageAddress.jsp").forward(request, response);
		}else {
			request.getSession().setAttribute("alertMsg","로그인이 필요합니다.");
			
			response.sendRedirect(request.getContextPath()+"/login.page");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
