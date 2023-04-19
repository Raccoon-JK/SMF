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
import com.smf.my.model.vo.ShoppingCart;

/**
 * Servlet implementation class MyShoppingCartController
 */
@WebServlet("/mypageshoppingcart.me")
public class MyShoppingCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyShoppingCartController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getSession().getAttribute("loginUser") != null) {
			String userId = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
			
			ArrayList<ShoppingCart> list = new MyPageService().shoppingCartList(userId);
			
			request.setAttribute("cartList", list);
			
			request.getRequestDispatcher("/views/my/mypageShoppingCart.jsp").forward(request, response);
		}else {
			request.getSession().setAttribute("alertMsg", "로그인 후 이용가능합니다.");
			
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
