package com.smf.style.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.smf.style.model.service.StyleService;
import com.smf.style.model.vo.StyleComment;

/**
 * Servlet implementation class AjaxReplyListController
 */
@WebServlet("/commentList.st")
public class AjaxReplyListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxReplyListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		  int postNo = Integer.parseInt(request.getParameter("postNo"));
		  
		  ArrayList<StyleComment> list = new StyleService().selectCommentList(postNo);
		  
		  
		  // Gson을 이용해서 응답 ArrayList- > JSONArray로 변환
		 response.setContentType("application/json; charset=UTF-8"); new
		 Gson().toJson(list , response.getWriter());
		 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
