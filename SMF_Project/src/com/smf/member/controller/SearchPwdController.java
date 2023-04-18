package com.smf.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smf.member.model.service.MemberService;

/**
 * Servlet implementation class SearchPwdController
 */
@WebServlet("/searchPwd.me")
public class SearchPwdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchPwdController() {
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
		
		String uphone = request.getParameter("uphone");
		String email  = request.getParameter("email");
	
		String pwd = new MemberService().searchPwd(uphone, email);
	
		System.out.println(uphone);
		System.out.println(email);
		
		if(pwd == null) {
			request.setAttribute("errorMSG", "가입 되어있지 않은 회원입니");
		}else {
			HttpSession session = request.getSession();
			
			session.setAttribute("pwd", pwd);
			session.setAttribute("alert", "비밀번호 찾기 성공");
		}
		
		response.sendRedirect(request.getContextPath()+"/views/member/searchpwdresult.jsp");
		
	}

}
