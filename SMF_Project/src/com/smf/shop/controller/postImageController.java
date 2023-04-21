package com.smf.shop.controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class postImageController
 */
@WebServlet("/fileupload.sh")
public class postImageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public postImageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		//전에 배웠던 것에서는 파일업로드와 다른 파라미터를 한 파일에서 작업했지만 여기선 파일업로드이 현재 파일에서 다른 파라미터 작업(DB Insert)은 다른 파일에서 
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024 * 1024 * 10;
			String savePath = request.getSession().getServletContext().getRealPath("/resources/shop/upfiles_img/");
			System.out.println(savePath);
			//파일 저장
			MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "UTF-8"); //new MyFileRenamePolicy()
			
			Enumeration e = multi.getParameterNames();
			while (e.hasMoreElements()) {
				String name = (String) e.nextElement();
				String[] values = multi.getParameterValues(name);
				for (String value : values) {
					System.out.println("name=" + name + ",value=" + value);
				}
			}
			
			// 파일 이름 동적으로 변경해야 됨
			String img = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/resources/shop/upfiles_img/"+multi.getOriginalFileName("upload"); //multi.getOriginalFileName("upload")
			System.out.println(img);
			JSONObject outData = new JSONObject();
			outData.put("url", img);
			outData.put("uploaded", true);
			
			response.setContentType("application/json; charset=UTF-8");
			response.getWriter().print(outData);
		}

	}

}
