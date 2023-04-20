package com.smf.style.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smf.common.model.vo.PageInfo;
import com.smf.member.model.service.MemberService;
import com.smf.member.model.vo.Member;
import com.smf.style.model.dao.StyleDao;
import com.smf.style.model.service.StyleService;
import com.smf.style.model.vo.StylePost;

/**
 * Servlet implementation class postListController
 */
@WebServlet("/styleList.st")
public class postListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public postListController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		ArrayList<StylePost> list = new StyleService().selectPostList();
		request.setAttribute("list",list);
		
		
		
		
		
		request.getRequestDispatcher("views/style/stylemain.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
