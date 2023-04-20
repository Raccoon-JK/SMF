package com.smf.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smf.admin.model.service.NoticeService;
import com.smf.shop.model.vo.Stock;

/**
 * Servlet implementation class SuggestUpdateController
 */
@WebServlet("/suggestupdate.no")
public class SuggestUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SuggestUpdateController() {
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
		
		request.setCharacterEncoding("UTF-8");
		
		String status = request.getParameter("status");
		String stockno = request.getParameter("stockno");
		
		System.out.println(stockno);
		
		//Stock s = new Stock();
		
		//s.setStatus(status);
		
		
		
		int result = new NoticeService().updateSuggest(stockno);
		
		
		
		
		if(result >0) {
			request.getSession().setAttribute("alertMsg", "상태가 변경되었습니다");
			response.sendRedirect(request.getContextPath() + "/suggestlist.no");
		}else {
			request.setAttribute("errorMsg", "상태 변경 실");
			request.getRequestDispatcher("views/commmon/error404.jsp").forward(request, response);
		}
		
		
	}

}
