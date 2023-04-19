package com.smf.shop.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smf.member.model.vo.Member;
import com.smf.my.model.vo.WishList;
import com.smf.shop.model.service.ShopService;

/**
 * Servlet implementation class WishListCountController
 */
@WebServlet("/wishListCount.sh")
public class WishListCountController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WishListCountController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String productName = request.getParameter("productName");
		String userId = ((Member) request.getSession().getAttribute("loginUser")).getUserId() + "";
		
		int result = new ShopService().insertWishList(productName, userId);
		
		if(result > 0) {
			response.sendRedirect(request.getContextPath()+"/productDetail.sh?productName="+productName);
			request.getSession().setAttribute("alertMsg", "관심 상품에 등록되었습니다.");
		}else {
			request.getSession().setAttribute("alertMsg", "이미 관심상품에 등록한 상품입니다.");
			response.sendRedirect(request.getContextPath()+"/productDetail.sh?productName="+productName);
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
