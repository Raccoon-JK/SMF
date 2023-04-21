package com.smf.dressroom.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smf.dressroom.model.service.DressroomService;
import com.smf.member.model.vo.Member;

/**
 * Servlet implementation class dressroomWish
 */
@WebServlet("/dressroomWish.me")
public class dressroomWish extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public dressroomWish() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
		
		String productName = request.getParameter("productName");
		
		int result = new DressroomService().dressroomWish(userId, productName);
		
		if(result > 0) {
			response.sendRedirect(request.getContextPath()+"/mypagewishlist.me");
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
