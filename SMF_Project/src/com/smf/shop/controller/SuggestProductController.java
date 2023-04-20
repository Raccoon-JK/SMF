package com.smf.shop.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smf.member.model.vo.Member;
import com.smf.shop.model.service.ShopService;
import com.smf.shop.model.vo.Stock;

/**
 * Servlet implementation class SuggestProductController
 */
@WebServlet("/suggest.sh")
public class SuggestProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SuggestProductController() {
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
		
		String userId = ((Member) request.getSession().getAttribute("loginUser")).getUserId() + ""; // 로그인 유저 아이디 정보
		String userClass = ((Member) request.getSession().getAttribute("loginUser")).getUserType() + "";
		String bName = request.getParameter("brandName");
		String pName = request.getParameter("productName");
//		int price = Integer.parseInt(request.getParameter("price"));
		String price = request.getParameter("price");
		String size = request.getParameter("size");
//		int count = Integer.parseInt(request.getParameter("stock"));
		String count = request.getParameter("count");
		
		int result = new ShopService().suggestProduct(userId, userClass, bName, pName, price, size, count);
		
		request.setAttribute("userId", userId);
		request.setAttribute("bName", bName);
		request.setAttribute("pName", pName);
		request.setAttribute("price", price);
		request.setAttribute("size", size);
		request.setAttribute("count", count);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "등록 완료되었습니다.");
			response.sendRedirect(request.getContextPath()+"/productDetail.sh?productName="+pName);
		}else {
			
			response.sendRedirect(request.getContextPath()+"/productDetail.sh?productName="+pName);
		}
		
		
	}

}
