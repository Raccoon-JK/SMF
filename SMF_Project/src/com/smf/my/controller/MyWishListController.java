package com.smf.my.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smf.member.model.vo.Member;
import com.smf.my.model.service.MyPageService;
import com.smf.my.model.vo.WishList;
import com.smf.shop.model.vo.ProductAll;

/**
 * Servlet implementation class MyWishListController
 */
@WebServlet("/mypagewishlist.me")
public class MyWishListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyWishListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("loginUser") == null) {
			session.setAttribute("alertMsg", "로그인 후 이용가능합니다.");
			response.sendRedirect(request.getContextPath()+"/login.page");
		}else {
			
			String userId = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
			ArrayList<ProductAll> list = new MyPageService().wishlistList(userId);
			
			request.setAttribute("wList", list);
		
			request.getRequestDispatcher("views/my/mypageWhishList.jsp").forward(request, response);
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
