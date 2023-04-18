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
 * Servlet implementation class NoticeFaqUpdateController
 */
@WebServlet("/faqupdate.no")
public class NoticeFaqUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeFaqUpdateController() {
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
		
		int nno = Integer.parseInt(request.getParameter("nno"));
		
		String category = request.getParameter("category");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		System.out.println(category);
		System.out.println(title);
		System.out.println(content);
		
		Notice n = new Notice();
		n.setAlertNo(nno);
		n.setAlertCategory(category);
		n.setAlertTitle(title);
		n.setAlertContent(content);
		
		
		int result = new NoticeService().updatefaqNotice(n);
		
		if(result>0) {
			request.getSession().setAttribute("alertMsg","FAQ 성공적으로 수정되었습니다");
			response.sendRedirect(request.getContextPath()+"/Faqlist.no");
			

			
		}else {
			request.setAttribute("errorMsg", "FAQ 수정 실패");
			request.getRequestDispatcher("views/commmon/error404.jsp").forward(request, response);
			
		}
		 
	}

}
