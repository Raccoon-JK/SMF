package com.smf.style.controller;

import java.io.File;
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
import com.smf.style.model.service.StyleService;
import com.smf.style.model.vo.PostImg;
import com.smf.style.model.vo.StylePost;

/**
 * Servlet implementation class updateController
 */
@WebServlet("/updatePost.me")
public class updateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		StyleService spService = new StyleService();
		int postNo = Integer.parseInt(request.getParameter("pno"));
		
		ArrayList<StylePost> list = spService.selectPostImgList();
		StylePost sp = spService.selectPost(postNo);
		PostImg pi = spService.selectImg(postNo);
		
		request.setAttribute("list", list);
		request.setAttribute("sp", sp);
		request.setAttribute("pi", pi);
	
		
		request.getRequestDispatcher("views/board/boardUpdateForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			if(ServletFileUpload.isMultipartContent(request)) {
			
			// 1_1. 전송파일 용량제한(10mByte)
			int maxSize = 10 * 1024 * 1024;
			// 1_2. 전달된 파일을 저장시킬 서버의 폴더의 물리적인 경로 알아내기
			String savePath = request.getSession().getServletContext().getRealPath("/uproad/");
			// 2. 전달된 파일명 수정작업후 서버에 업로드
			MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			// 3. 본격적으로 sql문 실행시 필요한 값들 셋팅
			// - Board테이블에 update시 필요한 값들 셋팅
			int postNo = Integer.parseInt(multi.getParameter("pno").trim());
			String imgName = multi.getParameter("IMG_NAME");
			String imgPath = multi.getParameter("IMG_PATH");
			String content = multi.getParameter("CONTENT");
			
			
			StylePost sp = new StylePost();
			PostImg pi = null;
			
			sp.setContent(content);
			pi.setImgName(imgName);
			sp.setPostNo(postNo);
			pi.setImgPath(imgPath);
			
			
			// 새롭게 전달된 첨부파일이 있는경우에만 at변수에 필요한 값을추가할것
			
			if(multi.getOriginalFileName("upfile") != null) {
				
				pi= new PostImg();
				pi.setOriginName(multi.getOriginalFileName("upfile"));
				pi.setImgName(multi.getFilesystemName("upfile"));
				pi.setImgPath("/uproad/");
				
				// 첨부파일이 원래 등록되어있을경우 원본파일의 파일번호, 수정된이름을 hidden 넘겨받았음
				if(multi.getParameter("originFileNo") != null) {
					// 기존에 파일이 있었던 경우
					// Attachment테이블의 정보를 update
					// 기존의 파일번호를 저장시키기
					pi.setImgNo( Integer.parseInt(multi.getParameter("originFileNo")));
					
					// 기존의 첨부파일을 삭제
					 new File(savePath+ multi.getParameter("changeFileName") ).delete();
				}else { 
					//기존에 첨부파일 없는경우
					// Attachment 테이블에 정보를 insert
					// REF_BNO에 현재 게시글번호를 추가시켜줌.
					pi.setPostNo( postNo );
				}
			}
			//하나의 트랜잭션으로 board에 update문과 Attachment테이블의 insert,update 동시에 처리해주기
			int result = new StyleService().updatePost(sp, pi);
			// 항상 board에 update문은 반드시 실행시켜줘야함.
			// case1 : 새로운 첨부파일이 없는경우(x) -> insert (x), update(x)
			// case2 : 새로운 첨부파일이 있는경우(o), 기존에도 첨부파일이 있던경우 (o) -> update(o) , insert(x)
			// case3 : 새로운 첨부파일이 있는경우(o), 기존에는 첨부파일이 없던경우 (x) -> update(x) , insert(o)
			
			//수정성공시 : 상세조회페이지로 redirect
			if(result > 0) {
				request.getSession().setAttribute("alertMsg", "성공적으로 수정되었습니다");
				response.sendRedirect(request.getContextPath()+"/detailPost.th?pno="+postNo);
			}else { //수정 실패시 : errorPage
				request.setAttribute("errorMsg", "게시글 수정에 실패했습니다");
			}
			
		} else {
			request.setAttribute("errorMsg","전송방식이 잘못되었습니다");
		}
	}

}
