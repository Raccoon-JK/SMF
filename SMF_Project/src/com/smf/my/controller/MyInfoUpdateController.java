package com.smf.my.controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.google.gson.Gson;
import com.oreilly.servlet.MultipartRequest;
import com.smf.common.MyFileRenamePolicy;
import com.smf.common.MyFileRenamePolicy2;
import com.smf.member.model.vo.Member;
import com.smf.my.model.service.MyPageService;

/**
 * Servlet implementation class MyInfoUpdateController
 */
@WebServlet("/myinfoupdate.me")
public class MyInfoUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyInfoUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String column = null;
		String value = null;
		String userId = null;
		Member m = null;
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 1024 * 1024 * 10;
			String savePath = request.getSession().getServletContext().getRealPath("/resources/my/img/");
			MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy2());
		
			userId = multi.getParameter("id");
			column = "USER_IMAGE";
			value = "/resources/my/img/"+multi.getFilesystemName("userImg");
			
			System.out.println(column);
			System.out.println(value);
			System.out.println(userId);
			
			m = new MyPageService().myInfoUpdate(column, value, userId);
			
			response.setContentType("application/json; charset=UTF-8");
			
			new Gson().toJson(m, response.getWriter());
			
		}else {
		
			
			column = request.getParameter("name");
			value = request.getParameter("val");
			userId = request.getParameter("id");
			
			System.out.println(column);
			System.out.println(value);
			System.out.println(userId);
			m = new MyPageService().myInfoUpdate(column, value, userId);
			
		}
		
		System.out.println(m);
		request.getSession().setAttribute("loginUser", m);
	}

}
