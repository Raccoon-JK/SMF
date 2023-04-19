package com.smf.style.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smf.member.model.vo.Member;
import com.smf.style.model.service.StyleService;
import com.smf.style.model.vo.Follow;
import com.smf.style.model.vo.PostImg;
import com.smf.style.model.vo.StylePost;

/**
 * Servlet implementation class followController
 */
@WebServlet("/follow.st")
public class followController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public followController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		ArrayList<StylePost> list = new StyleService().selectPostImgList();
		ArrayList<ArrayList<PostImg>> list2 = new StyleService().selectPostImgList2();
		
		
		request.setAttribute("list",list);
		request.setAttribute("list2", list2);
		
		
		
		
		request.getRequestDispatcher("views/style/followPage.jsp").forward(request, response);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
