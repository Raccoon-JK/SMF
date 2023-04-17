package com.smf.my.controller;

import java.awt.Point;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smf.member.model.vo.Member;
import com.smf.my.model.dao.MyPageDao;
import com.smf.my.model.service.MyPageService;
import com.smf.my.model.vo.Address;
import com.smf.my.model.vo.Card;
import com.smf.my.model.vo.ShoppingCart;
import com.smf.shop.model.vo.ProductAll;

/**
 * Servlet implementation class OrderPaymentFormController
 */
@WebServlet("/orderForm.pay")
public class OrderPaymentFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderPaymentFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
		
		String[] pArr = (request.getParameterValues("cNo"));
		
		String pIn = String.join(",", pArr);
//		System.out.println(pIn);
		
		ArrayList<ShoppingCart> pList = new ArrayList<>();
		
		pList = new MyPageService().stockProdcutSelectList(userId, pArr);
		
		//getparameterValues로 이따 상품받아와야함
		
		// 선택 상품 
		
		// 배송 주소
		Address defaultAddr = new MyPageService().addressDefault(userId);
		
		// 포인트
//		int userPoint = ((Member)request.getSession().getAttribute("loginUser")).getTotalPoint();
		
		// 결제 카드
		Card c = new MyPageService().cardSelect(userId);
		
		
		
		request.setAttribute("cart", c);
		request.setAttribute("defaultAddr", defaultAddr);
		
		request.getRequestDispatcher("/views/my/orderPaymentForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
