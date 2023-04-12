package com.smf.my.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smf.my.model.service.MyPageService;

/**
 * Servlet implementation class MyShoppingCartDeleteController
 */
@WebServlet("/mypageshoppingDel.me")
public class MyShoppingCartDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyShoppingCartDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int cNo = Integer.parseInt(request.getParameter("cNo"));
		
		int result = new MyPageService().shoppingCartItemDelete(cNo);
		
		if( result>0 ) {
			request.getSession().setAttribute("alertMsg", "삭제 되었습니다.");
			response.sendRedirect(request.getContextPath()+"/mypageshoppingcart.me");
		}else {
			System.out.println("장바구니 삭제 오류");
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
