package com.smf.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smf.admin.model.service.NoticeService;
import com.smf.admin.model.vo.Notice;



/**
 * Servlet implementation class NoticeInertController
 */
@WebServlet("/insert.no")
public class NoticeInertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeInertController() {
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
		
		String title   = request.getParameter("title");
		String category = request.getParameter("category");
		String content = request.getParameter("content");
		
		Notice n = new Notice();
		
		n.setAlertTitle(title);
		n.setAlertCategory(category);
		n.setAlertContent(content);
		
		int result = new NoticeService().insertNotice(n);
		
		if(result>0) {
			request.getSession().setAttribute("alert","공지사항 작성 성공");
			response.sendRedirect(request.getContextPath()+"/list.no");
		}else {
			request.setAttribute("errorMsg","공지사항 등록 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
		
	}

}
