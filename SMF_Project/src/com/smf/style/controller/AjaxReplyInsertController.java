package com.smf.style.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smf.member.model.vo.Member;
import com.smf.style.model.service.StyleService;
import com.smf.style.model.vo.ReplyBuilder;
import com.smf.style.model.vo.StyleComment;


/**
 * Servlet implementation class AjaxReplyInsertController
 */
@WebServlet("/rinsert.bo")
public class AjaxReplyInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxReplyInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String cContent = request.getParameter("cContent");
		int postNo = Integer.parseInt(request.getParameter("pno"));
		String userId =  ((Member) request.getSession().getAttribute("loginUser")).getUserId();
	
		StyleComment sc = new StyleComment();
		sc.setcContent(cContent);
		sc.setPostNo(postNo);
		sc.setUserId(userId+"");
		
		ReplyBuilder rb =	 new ReplyBuilder.
									Builder(1).
									setcContent("댓글내용").
									setPostNo(1).
									build();
		
//		ReplyBuilder rb =	 new ReplyBuilder.
//									builder(1).
//									replyContent("댓글내용").
//									refBno(1).
//									build();

		
		int result = new StyleService().insertReply(sc);
		
		response.getWriter().print(result);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
