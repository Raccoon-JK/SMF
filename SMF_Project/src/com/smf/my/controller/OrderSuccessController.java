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
import com.smf.my.model.vo.OrderBuilder;

/**
 * Servlet implementation class OrderSuccessController
 */
@WebServlet("/ordersuccess.pay")
public class OrderSuccessController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderSuccessController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
		int addrNo = Integer.parseInt(request.getParameter("addrNo"));
		int totalAmount = Integer.parseInt(request.getParameter("amount"));
		int usedPoint = Integer.parseInt(request.getParameter("point"));
		int point = (int) (totalAmount*0.1/100);
		
		int result = 0;
		
		String[] cNoStr = request.getParameterValues("cNo");
		String[] sNoStr = request.getParameterValues("sNo");
		String[] ocStr = request.getParameterValues("orderCount");
		
		int[] cNo = new int [cNoStr.length];
 		int[] sNo = new int [sNoStr.length];
		int[] orderCount = new int [ocStr.length];
		
		OrderBuilder ob = new OrderBuilder
	              .Builder(userId)
	              .setTotalAmount(totalAmount)
	              .setAddrNo(addrNo)
	              .setPoint(point)
	              .build();
		
		for(int i=0; i<sNoStr.length; i++) {
			sNo[i] = Integer.parseInt(sNoStr[i]);
			cNo[i] = Integer.parseInt(cNoStr[i]);
			orderCount[i] = Integer.parseInt(ocStr[i]);
		}
		
		result = new MyPageService().insertOrder(ob, cNo, sNo, usedPoint, orderCount);
		System.out.println(result);
		if(result>0) {
			request.getRequestDispatcher("/views/my/orderSuccess.jsp").forward(request, response);
		}else {
			
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
