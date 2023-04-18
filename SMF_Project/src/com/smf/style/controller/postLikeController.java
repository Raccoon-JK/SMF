package com.smf.style.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smf.member.model.vo.Member;
import com.smf.style.model.service.StyleService;
import com.smf.style.model.vo.Follow;
import com.smf.style.model.vo.PostLike;

/**
 * Servlet implementation class postLikeController
 */
@WebServlet("/postLike.st")
public class postLikeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public postLikeController() {
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
		
		PostLike pl = new PostLike();
		pl.setPostNo(Integer.parseInt(request.getParameter("postNo")));
		pl.setUserId( ((Member) request.getSession().getAttribute("loginUser")).getUserId()+"" );
		
		int result = new StyleService().insertPostLike(pl);
		System.out.println(result);
		
		if(result > 0) { 
			response.sendRedirect(request.getContextPath()+"/styleList.st");
		}else {
			request.getRequestDispatcher("views/common/error500.jsp").forward(request, response);
		}
        
      
	}

}
