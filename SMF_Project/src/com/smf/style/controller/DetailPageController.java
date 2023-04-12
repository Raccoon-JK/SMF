package com.smf.style.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smf.style.model.service.StyleService;
import com.smf.style.model.vo.PostImg;
import com.smf.style.model.vo.StylePost;

/**
 * Servlet implementation class DetailPageController
 */
@WebServlet("/detailPost.th")
public class DetailPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DetailPageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int postNo = Integer.parseInt(request.getParameter("pno"));
		
		StylePost sp = new StyleService().selectPost(postNo);
		
		ArrayList<PostImg> list = new StyleService().selectPostImgList(postNo);
		
		request.setAttribute("sp", sp);
		request.setAttribute("list", list);
		
		
		request.getRequestDispatcher("views/style/userDetailPage.jsp").forward(request,response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
