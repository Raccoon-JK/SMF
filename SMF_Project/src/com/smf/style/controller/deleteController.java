package com.smf.style.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.smf.member.model.vo.Member;
import com.smf.style.model.service.StyleService;
import com.smf.style.model.vo.PostImg;

/**
 * Servlet implementation class deleteController
 */
@WebServlet("/deletePost.me")
public class deleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int postNo = Integer.parseInt(request.getParameter("pno"));
		
		String userId = ((Member) request.getSession().getAttribute("loginUser")).getUserId();
	
		PostImg pi = new StyleService().selectImg(postNo);
		
		int result = new StyleService().deletePost(postNo, userId ,pi);
		
		if(result > 0) {
			//삭제처리
			if(pi != null) {
				String savePath = request.getSession().getServletContext().getRealPath(pi.getImgPath());				
				new File(savePath+pi.getImgName()).delete();
			}
			request.getSession().setAttribute("alertMsg", "성공적으로 게시글을 삭제했습니다.");
			response.sendRedirect(request.getContextPath()+"/list.bo");
		}else {
			request.setAttribute("errorMsg", "게시글삭제에 실패했습니다..");
			request.getRequestDispatcher("history.back()").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
