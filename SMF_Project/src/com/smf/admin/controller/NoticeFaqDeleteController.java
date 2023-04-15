package com.smf.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smf.admin.model.service.NoticeService;

/**
 * Servlet implementation class NoticeFaqDeleteController
 */
@WebServlet("/faqdelete.no")
public class NoticeFaqDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeFaqDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int nno = Integer.parseInt(request.getParameter("nno"));
		int result = new NoticeService().deletefaqNotice(nno);
		
		if(result>0) {
			request.getSession().setAttribute("alertMsg", "성공적으로 삭제되었습니다");
			
			response.sendRedirect(request.getContextPath()+"/Faqlist.no");
			
		}else {
			request.setAttribute("erorrMSG"," 공지사항 삭제에 실패하였습니다");
			request.getRequestDispatcher("views/common/error404.jsp").forward(request,response);
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
