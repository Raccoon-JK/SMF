package com.smf.style.controller;

import java.io.IOException;
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
@WebServlet("/styleInsert.me")
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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("views/style/insertPage.jsp").forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 10 * 1024 * 1024;
			
			String savePath = request.getSession().getServletContext().getRealPath("/upload/");
			
			MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			StylePost sp = new StylePost();
			sp.setPostNo(Integer.parseInt(multi.getParameter("postNo")));
			sp.setContent(multi.getParameter("content"));
			sp.setUserId( ((Member) request.getSession().getAttribute("loginUser")).getUserId()+"" );
			
			
			ArrayList<PostImg> list = new ArrayList();
			
			for(int i = 1; i<=4; i++) {
				
				String key = "file"+i;
				
				if(multi.getOriginalFileName(key) != null) {
					
					PostImg pi = new PostImg();
					pi.setOriginName(multi.getOriginalFileName(key));
					pi.setImgName(multi.getFilesystemName(key));
					pi.setImgPath("/upload/");
					
					list.add(pi);
				}
			}
			
			int result = new StyleService().insertPostImgList(sp, list);
			
			if(result > 0) { // 성공 -> list.th를 요청
				request.getSession().setAttribute("alertMsg", "성공적으로 업로드 되었습니다");
				response.sendRedirect(request.getContextPath()+"/userPage.me");
			}else {
				request.setAttribute("errorMsg", "사진 업로드 실패..");
			}
			
		}
	}

}
