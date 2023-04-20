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
import com.smf.style.model.vo.StyleComment;
import com.smf.style.model.vo.StylePost;

/**
 * Servlet implementation class DetailPageController
 */
@WebServlet("/userDetail.st")
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
		
		int postNo = Integer.parseInt(request.getParameter("postNo"));
		
		StyleService sService = new StyleService();
				
		
			
		StylePost sp = sService.selectPost(postNo);
		PostImg pi = sService.selectPostImg(postNo);
			
		
		ArrayList<StylePost> list = new StyleService().selectPostImgList();
		ArrayList<ArrayList<PostImg>> list2 = new StyleService().selectPostImgList2();
		ArrayList<StyleComment> list3 = sService.selectCommentList(postNo);
		
		
		request.setAttribute("sp", sp);
		request.setAttribute("pi", pi);
		
		request.setAttribute("list",list);
		request.setAttribute("list2", list2);
		request.setAttribute("list3", list3);
			
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
