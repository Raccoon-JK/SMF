package com.smf.style.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.smf.common.MyFileRenamePolicy;
import com.smf.member.model.vo.Member;
import com.smf.style.model.service.StyleService;
import com.smf.style.model.vo.PostImg;
import com.smf.style.model.vo.StylePost;

/**
 * Servlet implementation class insertController
 */
@WebServlet("/styleInsert.st")
public class insertController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public insertController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.getRequestDispatcher("views/board/insertPage.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 10 * 1024 * 1024;
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/style/upfiles/");
			
			MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			StylePost sp = new StylePost();
			sp.setContent(multi.getParameter("content"));
			sp.setUserId( ((Member) request.getSession().getAttribute("loginUser")).getUserId()+"" );
			
			
			ArrayList<PostImg> list = new ArrayList();
			
			for(int i = 1; i<=4; i++) {
				
				String key = "img"+i;
				
				if(multi.getOriginalFileName(key) != null) { 
					PostImg pi = new PostImg();
					pi.setOriginName(multi.getOriginalFileName(key));
					pi.setImgName(multi.getFilesystemName(key));
					pi.setImgPath("/resources/style/upfiles/");
					pi.setImgLevel(i);
					
					list.add(pi);
					
				}
			}
			
			int result = new StyleService().insertThumbnailPost(sp, list);
			
			
			if(result > 0) { 
				response.sendRedirect(request.getContextPath()+"/styleList.st");
			}else {
				request.getRequestDispatcher("views/common/error500.jsp").forward(request, response);
			}
			
		}
		
		
	}
	
	

}
